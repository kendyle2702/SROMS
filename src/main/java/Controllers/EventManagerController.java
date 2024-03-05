/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.EventManagerDAO;
import Models.Event;
import Models.ParticipationEventDetail;
import Models.StudentProfile;
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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

//        } catch (SQLException ex) {
//            Logger.getLogger(EventManagerController.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // HttpSession is already an HttpSession, no need to cast
            String path = request.getRequestURI();
            HttpSession session = request.getSession();
            EventManagerDAO eventManagerDAO = new EventManagerDAO();
            List<Event> listE = eventManagerDAO.eventList();

            if (path.equals("/eventmanager")) {
                session.setAttribute("listEvent", listE);
                List<ParticipationEventDetail> pertiList = eventManagerDAO.participateEventList();
                session.setAttribute("pertiList", pertiList);
                int totalEventTaking = eventManagerDAO.getTotalEventTaking();
                session.setAttribute("totalevent", totalEventTaking);
                int totalEventTook = eventManagerDAO.getTotalEventTook();
                session.setAttribute("totalEventTook", totalEventTook);
                long totalCost = eventManagerDAO.getTotalCost();
                session.setAttribute("totalcost", totalCost);
                List<StudentProfile> studentList = eventManagerDAO.participateEventList();
                session.setAttribute("studentList", studentList);
                Calendar calen = Calendar.getInstance();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                Timestamp d = new Timestamp(calen.getTimeInMillis());
                String s = format.format(d);
                List<Map<String, Integer>> numberParti = eventManagerDAO.getTotalIsPresent();
                session.setAttribute("numberParti", numberParti);
                request.getRequestDispatcher("/EventManagerHome.jsp").forward(request, response);
            } else if (path.equals("/eventmanager/events/viewevent")) {
                request.getRequestDispatcher("/ViewEvents.jsp").forward(request, response);
            } else if (path.equals("/eventmanager/events/create")) {
                request.getRequestDispatcher("/CreateEvent.jsp").forward(request, response);
            } else if (path.startsWith("/eventmanager/events/detail/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);
                Event event = eventManagerDAO.getEvent(id);
                session.setAttribute("event", event);
                request.getRequestDispatcher("/EventDetail.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(EventManagerController.class.getName()).log(Level.SEVERE, null, ex);
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
        String eventName = request.getParameter("eventname");
        Timestamp pretime = formatTime(LocalDateTime.parse(request.getParameter("pretime")));
        Timestamp holeTime = formatTime(LocalDateTime.parse(request.getParameter("holetime")));
        String location = request.getParameter("location");
        int cost = Integer.parseInt(request.getParameter("cost"));
        int exNum = Integer.parseInt(request.getParameter("exnum"));
        String organization = request.getParameter("organization");
        String description = request.getParameter("description");
        String createBy = request.getParameter("createby");
        Timestamp endTime = formatTime(LocalDateTime.parse(request.getParameter("endtime")));
        Event event = new Event(eventName, pretime, holeTime, location, cost, exNum, organization, description, createBy, endTime);
        EventManagerDAO eventManagerDAO = new EventManagerDAO();
        HttpSession session = request.getSession();

        try {
            eventManagerDAO.addEvent(event);
//            List<Event> listE = eventManagerDAO.eventList();
//            session.setAttribute("listEvent", listE);
//            List<Map<String, Integer>> NumberParti = eventManagerDAO.getTotalIsPresent();
//            session.setAttribute("numberParti", NumberParti);
            List<Event> listE = eventManagerDAO.eventList();
            session.setAttribute("listEvent", listE);
            response.sendRedirect(request.getContextPath() + "/EventManagerHome.jsp");

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
