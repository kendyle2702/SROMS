package Controllers;

import static Controllers.LoginController.getToken;
import static Controllers.LoginController.getUserInfo;
import DAOs.EventDAO;
import DAOs.ManagerProfileDAO;
import Models.Event;
import Models.ParticipationEventDetail;
import Models.PrizeStructure;
import Models.StudentProfile;
import Models.UserProfile;
import Utils.GoogleInformation;
import com.oracle.wls.shaded.org.apache.xalan.xsltc.compiler.sym;
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
import java.time.format.DateTimeParseException;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
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
//                List<ParticipationEventDetail> pertiList = eventManagerDAO.participateEventList();
                int totalEventTook = eventManagerDAO.getTotalEventTook();
                int totalEventTaking = eventManagerDAO.getTotalEventTaking();
                long totalCost = eventManagerDAO.getTotalCost();
                int totalEventNotStarted = eventManagerDAO.getTotalEventNotStarted();
                //    List<StudentProfile> studentList = eventManagerDAO.participateEventList();
                Calendar calen = Calendar.getInstance();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
                List<Map<String, Integer>> numberParti = eventManagerDAO.getTotalIsPresent();
                Timestamp d = new Timestamp(calen.getTimeInMillis());
                if (path.equals("/eventmanager")) {
                    session.setAttribute("listEvent", listE);
                    session.setAttribute("totalevent", totalEventTaking);
                    session.setAttribute("totalEventTook", totalEventTook);
                    session.setAttribute("totalcost", totalCost);
                    session.setAttribute("totalEventNotStarted", totalEventNotStarted);
                    String s = format.format(d);
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
                    Map<String, String> eventDetail = eventManagerDAO.getDetailEventByEventManager(id);
                    request.setAttribute("eventDetail", eventDetail);
                    session.setAttribute("tabId", 4);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.startsWith("/eventmanager/events/checkAttandant")) {
                    session.setAttribute("tabId", 7);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.startsWith("/eventmanager/events/checkAttendant/")) {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);
                    List<Map<String, String>> listAttendant = eventManagerDAO.getListAttendant(id);
                    session.setAttribute("tabId", 8);
                    session.setAttribute("listAttendant", listAttendant);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.equals("/eventmanager/events/evaluate")) {
                    session.setAttribute("tabId", 9);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.startsWith("/eventmanager/events/evaluate/")) {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);
                    List<Map<String, String>> listAttendant = eventManagerDAO.getListAttendant(id);
                    session.setAttribute("tabId", 10);
                    session.setAttribute("listAttendant", listAttendant);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.equals("/eventmanager/events/checkrequestcreateevent")) {
                    session.setAttribute("listEvent", listE);
                    session.setAttribute("tabId", 11);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.equals("/eventmanager/events/eventswitingapprove")) {
                    session.setAttribute("tabId", 12);
                    request.getRequestDispatcher("/eventManager.jsp").forward(request, response);
                } else if (path.startsWith("/eventmanager/events/checkrequestcreate/")) {
                    int count = 0;
                    if (path.startsWith("/eventmanager/events/checkrequestcreate/accept/")) {
                        String[] isArray = path.split("/");
                        int eventID = Integer.parseInt(isArray[isArray.length - 1]);
                        count = eventManagerDAO.checkRequestCreate("EA", eventID);
                    } else if (path.startsWith("/eventmanager/events/checkrequestcreate/decline/")) {
                        String[] isArray = path.split("/");
                        int eventID = Integer.parseInt(isArray[isArray.length - 1]);
                        count = eventManagerDAO.checkRequestCreate("DL", eventID);
                    }
                    if (count > 0) {
                        session.setAttribute("checkRequestCreateEvent", "success");
                    } else {
                        session.setAttribute("checkRequestCreateEvent", "fail");
                    }
                    response.sendRedirect("/eventmanager/events/checkrequestcreateevent");
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
        try {
            String updateEvent = request.getParameter("UpdateEvent");
            String updateCompatition = request.getParameter("UpdateCompatition");
            String createCompatition = request.getParameter("createCompatition");
            String createEvent = request.getParameter("createEvent");
            String checkAttendanceForm = request.getParameter("checkAttendanceForm");
            String evaluateStudentForm = request.getParameter("evaluateStudentForm");
            if (createEvent != null && createEvent.equals("Submit")) {
                int count = 0;
                ManagerProfileDAO managerProfileDAO = new ManagerProfileDAO();
                String eventName = request.getParameter("eventname");
                Timestamp preTime = formatTime(LocalDateTime.parse(request.getParameter("pretime")));
                Timestamp holeTime = formatTime(LocalDateTime.parse(request.getParameter("holetime")));
                String location = request.getParameter("location");
                int cost = Integer.parseInt(request.getParameter("cost"));
                int exNum = Integer.parseInt(request.getParameter("exnum"));
                String organization = request.getParameter("organization");
                String description = request.getParameter("description");
                String feedback = request.getParameter("feedback");
                Timestamp endTime = formatTime(LocalDateTime.parse(request.getParameter("endtime")));
                UserProfile userProfile = (UserProfile) session.getAttribute("user");
                String role = (String) session.getAttribute("role");
                int id = managerProfileDAO.getManagerProfileIdByEmail(userProfile.getEmail());
                String eventCatelogyName = request.getParameter("catelogyEvent");
                int eventCatelogyID = 0;
                if (eventCatelogyName.equalsIgnoreCase("Soft Skills")) {
                    eventCatelogyID = 1;
                } else {
                    eventCatelogyID = 3;
                }

                count = eventManagerDAO.addEvent(eventName, preTime, holeTime, location, cost, exNum, organization, description, feedback, endTime, role, id, eventCatelogyID);
                if (count > 0) {
                    session.setAttribute("checkCreateEvent", "success");
                } else {
                    session.setAttribute("checkCreateEvent", "fail");
                }
                response.sendRedirect("/eventmanager");
            } else if (createCompatition != null && createCompatition.equals("Submit")) {
                int count = 0;
                ManagerProfileDAO managerProfileDAO = new ManagerProfileDAO();
                String eventName = request.getParameter("eventname");
                Timestamp preTime = formatTime(LocalDateTime.parse(request.getParameter("pretime")));
                Timestamp holeTime = formatTime(LocalDateTime.parse(request.getParameter("holetime")));
                String location = request.getParameter("location");
                int cost = Integer.parseInt(request.getParameter("cost"));
                int exNum = Integer.parseInt(request.getParameter("exnum"));
                String organization = request.getParameter("organization");
                String description = request.getParameter("description");
                String feedback = request.getParameter("feedback");
                Timestamp endTime = formatTime(LocalDateTime.parse(request.getParameter("endtime")));
                UserProfile userProfile = (UserProfile) session.getAttribute("user");
                String role = (String) session.getAttribute("role");
                int firtPrize = Integer.parseInt(request.getParameter("firtPrize"));
                int secondPrize = Integer.parseInt(request.getParameter("secondPrize"));
                int thirdPrize = Integer.parseInt(request.getParameter("thirdPrize"));
                int encouragementPrize = Integer.parseInt(request.getParameter("encouragementPrize"));
                int id = managerProfileDAO.getManagerProfileIdByEmail(userProfile.getEmail());
                int prizeStructureID = eventManagerDAO.getMaxPrizeStructureID();
                count = eventManagerDAO.addPrizeStructure(firtPrize, secondPrize, thirdPrize, encouragementPrize);
                eventManagerDAO.addCompatition(eventName, preTime, holeTime, location, cost, exNum, organization, description, feedback, endTime, role, id, 2, prizeStructureID);
                if (count > 0) {
                    session.setAttribute("checkCreateEvent", "success");
                } else {
                    session.setAttribute("checkCreateEvent", "fail");
                }
                response.sendRedirect("/eventmanager");

            } else if (updateEvent != null && updateEvent.equals("Update")) {
                int count = 0;
                String eventNameUpdate = request.getParameter("eventNameUpdate");
                Timestamp preTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("preTimeUpdate")));
                Timestamp holeTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("holeTimeUpdate")));
                String locationUpdate = request.getParameter("locationeUpdate");
                String categoryUpdate = request.getParameter("catelogyEventUpdate");
                int eventCatelogyIDUpdate = 0;
                if (categoryUpdate.equalsIgnoreCase("Soft Skills")) {
                    eventCatelogyIDUpdate = 1;
                } else {
                    eventCatelogyIDUpdate = 3;
                }
                int costUpdate = Integer.parseInt(request.getParameter("costUpdate"));
                int exnumUpdate = Integer.parseInt(request.getParameter("exnumUpdate"));
                String organUpdate = request.getParameter("organUpdate");
                String descriptionUpdate = request.getParameter("descriptionUpdate");
                Timestamp endTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("endTimeUpdate")));
                int idUpdate = Integer.parseInt(request.getParameter("idUpdate"));
                String feedbackupdate = request.getParameter("feedbackUpdate");
                int check = eventManagerDAO.updateEvent(eventNameUpdate, preTimeUpdate, holeTimeUpdate, locationUpdate, costUpdate, exnumUpdate, organUpdate, descriptionUpdate, feedbackupdate, endTimeUpdate, eventCatelogyIDUpdate, idUpdate);
                if (check > 0) {
                    session.setAttribute("checkUpdateEvent", "success");
                } else {
                    session.setAttribute("checkUpdateEvent", "failed");
                }

                response.sendRedirect("/eventmanager/events/detail/" + idUpdate);
            } else if (updateCompatition != null && updateCompatition.equals("Update")) {
                int checkUpdate = 0;
                String eventNameUpdate = request.getParameter("eventNameUpdate");
                Timestamp preTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("preTimeUpdate")));
                Timestamp holeTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("holeTimeUpdate")));
                String locationUpdate = request.getParameter("locationeUpdate");
                int costUpdate = Integer.parseInt(request.getParameter("costUpdate"));
                int exnumUpdate = Integer.parseInt(request.getParameter("exnumUpdate"));
                String organUpdate = request.getParameter("organUpdate");
                String descriptionUpdate = request.getParameter("descriptionUpdate");
                Timestamp endTimeUpdate = formatTime(LocalDateTime.parse(request.getParameter("endTimeUpdate")));
                int idUpdate = Integer.parseInt(request.getParameter("idUpdate"));
                String feedbackupdate = request.getParameter("feedbackUpdate");
                int firstPrizeUpdate = Integer.parseInt(request.getParameter("firstPrizeUpdate"));
                int secondPrizeUpdate = Integer.parseInt(request.getParameter("secondPrizeUpdate"));
                int thirdPrizeUpdate = Integer.parseInt(request.getParameter("thirdPrizeUpdate"));
                int encouragementPrizeUpdate = Integer.parseInt(request.getParameter("encouragementPrizeUpdate"));
                int prizeStructureID = Integer.parseInt(request.getParameter("prizeStructureIdUpdate"));
                int check = eventManagerDAO.updateEvent(eventNameUpdate, preTimeUpdate, holeTimeUpdate, locationUpdate, costUpdate, exnumUpdate, organUpdate, descriptionUpdate, feedbackupdate, endTimeUpdate, 3, idUpdate);
                PrizeStructure prize = new PrizeStructure(prizeStructureID, firstPrizeUpdate, secondPrizeUpdate, thirdPrizeUpdate, encouragementPrizeUpdate);
                checkUpdate = eventManagerDAO.updateCompatition(prize);
                if (check > 0 && checkUpdate > 0) {
                    session.setAttribute("checkUpdateEvent", "success");
                } else {
                    session.setAttribute("checkUpdateEvent", "failed");
                }

                response.sendRedirect("/eventmanager/events/detail/" + idUpdate);

            } else if (checkAttendanceForm != null && checkAttendanceForm.equals("Submit")) {
                int count = 0;
                Enumeration<String> parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    // Kiểm tra xem tên tham số bắt đầu bằng "checkAttendance_"
                    if (paramName.startsWith("checkAttendance/")) {
                        // Trích xuất StudentProfileID và EventID từ tên tham số
                        String[] ids = paramName.split("/");
                        int studentProfileId = Integer.parseInt(ids[1]);
                        int eventId = Integer.parseInt(ids[2]);
                        // Lấy giá trị điểm danh
                        String attendanceValue = request.getParameter(paramName);
                        // Xử lý điểm danh ở đây...
                        boolean check = "Present".equals(attendanceValue);
                        int result = eventManagerDAO.checkAttendance(check, studentProfileId, eventId);
                        if (result > 0) {
                            count++;
                        }
                    }
                }
                if (count > 0) {
                    session.setAttribute("checkAttendanceAlert", "success");
                } else {
                    session.setAttribute("checkAttendanceAlert", "fail");
                }
                response.sendRedirect("/eventmanager/events/checkAttandant");
            } else if (evaluateStudentForm != null && evaluateStudentForm.equals("Submit")) {
                int count = 0;
                Enumeration<String> parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    // Kiểm tra xem tên tham số bắt đầu bằng "checkAttendance_"
                    if (paramName.startsWith("evaluateStudent/")) {
                        // Trích xuất StudentProfileID và EventID từ tên tham số
                        String[] ids = paramName.split("/");
                        int studentProfileId = Integer.parseInt(ids[1]);
                        int eventId = Integer.parseInt(ids[2]);
                        // Lấy giá trị điểm danh
                        String evaluate = request.getParameter(paramName);
                        // Xử lý điểm danh ở đây...

                        int result = eventManagerDAO.evaluateStudent(evaluate, studentProfileId, eventId);
                        if (result > 0) {
                            count++;
                        }
                    }
                }
                if (count > 0) {
                    session.setAttribute("checkEvaluateStudent", "success");
                } else {
                    session.setAttribute("checkEvaluateStudent", "fail");
                }

                response.sendRedirect("/eventmanager/events/evaluate");

            }

        } catch (SQLException ex) {
            Logger.getLogger(EventManagerController.class
                    .getName()).log(Level.SEVERE, null, ex);
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
