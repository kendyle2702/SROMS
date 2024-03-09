package Controllers;

import static Controllers.LoginController.getToken;
import static Controllers.LoginController.getUserInfo;
import DAOs.EventDAO;
import Models.Event;
import Models.ParticipationEventDetail;
import Models.StudentProfile;
import Utils.GoogleInformation;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Map;

/**
 *
 * @author vietn
 */
public class EventManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if (role != null && role.equals("Event Manager")) {
            try {
                // HttpSession is already an HttpSession, no need to cast
                EventDAO eventManagerDAO = new EventDAO();
                List<Event> listE = eventManagerDAO.eventList();
                List<ParticipationEventDetail> pertiList = eventManagerDAO.participateEventList();
                int totalEventTook = eventManagerDAO.getTotalEventTook();
                int totalEventTaking = eventManagerDAO.getTotalEventTaking();
                long totalCost = eventManagerDAO.getTotalCost();
                List<StudentProfile> studentList = eventManagerDAO.participateEventList();
                Calendar calen = Calendar.getInstance();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                List<Map<String, Integer>> numberParti = eventManagerDAO.getTotalIsPresent();
                Timestamp d = new Timestamp(calen.getTimeInMillis());
                if (path.equals("/eventmanager")) {
                    session.setAttribute("listEvent", listE);
                    session.setAttribute("pertiList", pertiList);
                    session.setAttribute("totalevent", totalEventTaking);
                    session.setAttribute("totalEventTook", totalEventTook);
                    session.setAttribute("totalcost", totalCost);
                    session.setAttribute("studentList", studentList);
                    String s = format.format(d);
                    session.setAttribute("numberParti", numberParti);
                    session.setAttribute("tabId", 1);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.startsWith("/eventmanager/profile")) {
                    if (path.endsWith("/eventmanager/profile/edit")) {
                        session.setAttribute("tabId", 6);
                        request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                    } else {
                        session.setAttribute("tabId", 5);
                        request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                    }
                } else if (path.equals("/eventmanager/events/viewevent")) {
                    session.setAttribute("tabId", 3);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.equals("/eventmanager/events/create")) {
                    session.setAttribute("tabId", 2);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.startsWith("/eventmanager/events/detail/")) {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);
                    Event event = eventManagerDAO.getEvent(id);
                    session.setAttribute("event", event);
                    session.setAttribute("tabId", 4);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(EventManagerController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("/");
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EventDAO eventManagerDAO = new EventDAO();
        HttpSession session = request.getSession();
        String action = request.getParameter("event");
        try {
            if (action.equals("Submit")) {
                String eventName = request.getParameter("eventname");
                Timestamp pretime = formatTime(LocalDateTime.parse(request.getParameter("pretime")));
                Timestamp holeTime = formatTime(LocalDateTime.parse(request.getParameter("holetime")));
                String location = request.getParameter("location");
                int cost = Integer.parseInt(request.getParameter("cost"));
                int exNum = Integer.parseInt(request.getParameter("exnum"));
                String organization = request.getParameter("organization");
                String description = request.getParameter("description");

                Timestamp endTime = formatTime(LocalDateTime.parse(request.getParameter("endtime")));
                Event event = new Event(eventName, pretime, holeTime,
                        location, cost, exNum, organization,
                        description, endTime);
                eventManagerDAO.addEvent(event);
                response.sendRedirect("/eventmanager");
            } else if (action.equals("Update")) {
                String nameUpdate = request.getParameter("eventnameupdate");
                Timestamp preTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("pretimeupdate")));
                Timestamp holeTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("holetimeupdate")));
                String locationUpdate = request.getParameter("locationeupdate");
                int costUpdate = Integer.parseInt(request.getParameter("costupdate"));
                int exnumUpdate = Integer.parseInt(request.getParameter("exnumupdate"));
                String organUpdate = request.getParameter("organupdate");
                String descriptionUpdate = request.getParameter("descriptionupdate");
                Timestamp endTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("endtimeupdate")));
                int idUpdate = Integer.parseInt(request.getParameter("idupdate"));
                String feedbackupdate = request.getParameter("feedbackupdate");
                int check = eventManagerDAO.updateEvent(nameUpdate, preTimeUpdate, holeTimeUpdate, locationUpdate, costUpdate, exnumUpdate, organUpdate, descriptionUpdate, feedbackupdate, endTimeUpdate, idUpdate);
                if (check != 0) {
                    session.setAttribute("massage", "success");
                } else {
                    session.setAttribute("massage", "failed!");
                }
//                request.getRequestDispatcher("/eventDetail.jsp").forward(request, response);
                response.sendRedirect("/eventmanager/events/detail/" + idUpdate);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventManagerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public Timestamp formatTime(LocalDateTime time) {
        Timestamp formattedTime = null;
        if (time != null) {
            try {
                // Convert LocalDateTime to Timestamp
                formattedTime = Timestamp.valueOf(time.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")));
            } catch (Exception e) {
                e.printStackTrace(); // Handle parsing exception
            }
        } else {
            // Handle case where time is missing or empty
        }
        return formattedTime;
    }
}
