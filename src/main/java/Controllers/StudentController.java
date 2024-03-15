package Controllers;

import DAOs.ClubDAO;
import DAOs.EventDAO;
import DAOs.ManagerProfileDAO;
import DAOs.StudentProfileDAO;
import DAOs.UserLoginDAO;
import Models.Club;
import Models.ClubMember;
import Models.Event;
import Models.ParticipationEventDetail;
import Models.StudentProfile;
import Models.UserLogin;
import Models.UserProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import static jdk.nashorn.internal.runtime.Debug.id;

public class StudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        UserProfile userProfile = (UserProfile) session.getAttribute("user");
        String path = request.getRequestURI();

        if (role != null && role.equals("Student")) {
            try {
                StudentProfileDAO studentProfileDAO = new StudentProfileDAO();
                ManagerProfileDAO managerProfileDAO = new ManagerProfileDAO();

                UserLoginDAO userLoginDAO = new UserLoginDAO();
                int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userProfile.getUserProfileID());

                //DAO
                EventDAO eventManagerDAO = new EventDAO();
                ClubDAO clubDAO = new ClubDAO();

                List<Club> listC = clubDAO.listClub();
                List<ClubMember> clubM = clubDAO.getClubMemberByStudentProfileID(studentProfileID);
//                String semesterName = clubDAO.getSemesterNameByClubID( , studentProfileID);
                List<Event> listEventStudent = eventManagerDAO.checkStudentParticipationEventDetail(studentProfileID);
                //Event
                List<Event> listE = eventManagerDAO.eventList();
                List<ParticipationEventDetail> pertiList = eventManagerDAO.participateEventList();
                Map<Integer, String> eventCategoryNames = new HashMap<>();
                List<Club> listMyClub = clubDAO.getMyClub(studentProfileID);
                for (Event event : listE) {
                    String eventC = eventManagerDAO.getEventCategoryName(event.getEventCategoryID());
                    eventCategoryNames.put(event.getEventID(), eventC);
                }

                if (path.endsWith("/student")) {
                    session.setAttribute("userProfile", userProfile);
                    session.setAttribute("studentProfileID", studentProfileID);
                    session.setAttribute("listEvent", listE);
                    session.setAttribute("pertiList", pertiList);
                    session.setAttribute("eventCategoryNames", eventCategoryNames);
                    session.setAttribute("listClub", listC);
                    session.setAttribute("clubMembers", clubM);
                    session.setAttribute("listMyClub", listMyClub);
                    session.setAttribute("listEventStudent", listEventStudent);

                    session.setAttribute("tabId", 1);
                    request.getRequestDispatcher("/student.jsp").forward(request, response);
                } else if (path.startsWith("/student/profile")) {
                    if (path.endsWith("/student/profile/edit")) {
                        session.setAttribute("tabId", 6);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else {
                        session.setAttribute("tabId", 5);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/clubs")) {
                    if (path.endsWith("/student/clubs/view")) {

                        session.setAttribute("userProfile", userProfile);
                        session.setAttribute("studentProfileID", studentProfileID);

                        session.setAttribute("listClub", listC);
                        session.setAttribute("clubMembers", clubM);
                        session.setAttribute("listMyClub", listMyClub);
                        session.setAttribute("tabId", 4);

                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.startsWith("/student/clubs/detail")) {
                        String[] idArray = path.split("/");

                        int id = Integer.parseInt(idArray[idArray.length - 1]);
                        ResultSet rsStudent = studentProfileDAO.getStudentProfileMorebyEventID(id);
                        session.setAttribute("studentProfileID", studentProfileID);
                        session.setAttribute("rsStudent", rsStudent);
                        session.setAttribute("rsClubID", id);

                        Club club = clubDAO.getClub(id);
                        session.setAttribute("club", club);
                        session.setAttribute("tabId", 8);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.endsWith("/student/clubs/register")) {
                        request.getRequestDispatcher("/club-regsiter.jsp").forward(request, response);
                    } else if (path.startsWith("/student/clubs/viewClubMember/")) {
                        String[] isArray = path.split("/");
                        int studentProfileId = Integer.parseInt(isArray[isArray.length - 1]);
                        int clubId = Integer.parseInt(isArray[isArray.length - 2]);
                        List<Map<String, String>> listClubMember = clubDAO.getAllMembersClub(studentProfileId, clubId);
                        session.setAttribute("listClubMember", listClubMember);
                        session.setAttribute("tabId", 9);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/events")) {
                    if (path.endsWith("/student/events/view")) {
                        session.setAttribute("listEventStudent", listEventStudent);

                        session.setAttribute("userProfile", userProfile);

                        session.setAttribute("eventCategoryNames", eventCategoryNames);
                        session.setAttribute("listEvent", listE);
                        session.setAttribute("pertiList", pertiList);

                        session.setAttribute("tabId", 3);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.startsWith("/student/events/detail")) {
                        String[] idArray = path.split("/");

                        int id = Integer.parseInt(idArray[idArray.length - 1]);

                        ResultSet rsManager = managerProfileDAO.getManagerProfileMoreByEventID(id);
                        ResultSet rsStudent = studentProfileDAO.getStudentProfileMorebyEventID(id);
                        session.setAttribute("studentProfileID", studentProfileID);

                        session.setAttribute("rsManager", rsManager);
                        session.setAttribute("rsStudent", rsStudent);
                        session.setAttribute("rsEventID", id);

                        Event event = eventManagerDAO.getEvent(id);
                        session.setAttribute("event", event);

                        session.setAttribute("tabId", 7);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.endsWith("/student/events/register")) {
                        request.getRequestDispatcher("/event-register.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/news")) {
                    if (path.endsWith("/student/news/view")) {
                        session.setAttribute("tabId", 2);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    }
                    if (path.endsWith("/student/new/detail")) {
                        request.getRequestDispatcher("/new-detail.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/point")) {
                    if (path.endsWith("/student/point/view")) {
                        request.getRequestDispatcher("/point.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect("/");
                }
            } catch (SQLException ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        EventDAO eventDAO = new EventDAO();
        try {
            if (action.equals("Join")) {
                int eventID = Integer.parseInt(request.getParameter("EventID"));

                // Assuming you're storing the student's profile ID in the session when they log in or register
                int studentProfileID = Integer.parseInt(request.getParameter("studentProfileID"));

                String roleEvent = "Menber";
                boolean isPresent = Boolean.TRUE;
                String report = null;
                String result = null;

                ParticipationEventDetail participationEventDetail = new ParticipationEventDetail(
                        eventID, studentProfileID, roleEvent, isPresent, report, result
                );

                // Gọi phương thức và nhận kết quả
                boolean isSuccess = eventDAO.addStudentToParticipationEventDetail(participationEventDetail);

                if (isSuccess) {
                    session.setAttribute("joinEvent", "success");
                } else {
                    session.setAttribute("joinEvent", "fail");
                }
                response.sendRedirect("/student/events/view");
            } else if (action.equals("Register")) {
                int clubID = Integer.parseInt(request.getParameter("ClubID"));

                int studentProfileID = Integer.parseInt(request.getParameter("studentProfileID"));
                int semesterID = 10;
                String clubRole = "Member";
                int clubPoint = 0;
                String report = null;

                ClubDAO clubDAO = new ClubDAO();

                ClubMember clubMember = new ClubMember(
                        clubID,
                        semesterID,
                        clubRole,
                        clubPoint,
                        report,
                        studentProfileID
                );

                boolean isRegister = clubDAO.registerStudentToClub(clubMember);
                if (isRegister) {
                    session.setAttribute("registerClub", "success");
                } else {
                    session.setAttribute("registerClub", "fail");
                }
                response.sendRedirect("/student/clubs/view");

            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
