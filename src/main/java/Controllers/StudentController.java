package Controllers;

import DAOs.ClubDAO;
import DAOs.EventDAO;
import Models.Club;
import Models.Event;
import Models.ParticipationEventDetail;
import Models.StudentProfile;
import Models.UserProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String path = request.getServletPath();

        if (role != null && role.equals("Student")) {
            try {
                EventDAO eventManagerDAO = new EventDAO();
                ClubDAO clubDAO = new ClubDAO();
                List<Event> listE = eventManagerDAO.eventList();
                List<ParticipationEventDetail> pertiList = eventManagerDAO.participateEventList();

                UserProfile userProfile = new UserProfile();
                int userP = userProfile.getUserProfileID();
                StudentProfile studentProfile = new StudentProfile();
                int studentProfileID = studentProfile.getStudentProfileID();

                List<Club> listC = clubDAO.listClub();
                
                List<Club> myClubs = clubDAO.getMyClubs(userP);
                Map<Integer, String> semesterNames = new HashMap<>();
                
                for (Club club : myClubs) {
                    String semesterName = clubDAO.getSemesterNameByClubID(club.getClubID());
                    semesterNames.put(club.getClubID(), semesterName);
                }

                Map<Integer, String> eventCategoryNames = new HashMap<>();

                for (Event event : listE) {
                    String eventC = eventManagerDAO.getEventCategoryName(event.getEventCategoryID());
                    eventCategoryNames.put(event.getEventID(), eventC);
                }

                if (path.endsWith("/student")) {
                    session.setAttribute("listEvent", listE);
                    session.setAttribute("pertiList", pertiList);
                    session.setAttribute("listClub", listC);
                    session.setAttribute("myClubs", myClubs);
                    session.setAttribute("semesterNames", semesterNames);
                    session.setAttribute("userProfileID", userP);
                    session.setAttribute("StudentPorfile", studentProfile);
                    session.setAttribute("studentProfileID", studentProfileID);
                    session.setAttribute("eventCategoryNames", eventCategoryNames);
                    session.setAttribute("tabId", 1);
                    request.getRequestDispatcher("/student.jsp").forward(request, response);
                } else if (path.startsWith("/student/profile")) {
                    if (path.endsWith("/student/profile/view")) {
                        request.getRequestDispatcher("/profile.jsp").forward(request, response);
                    } else if (path.endsWith("/student/profile/edit")) {
                        request.getRequestDispatcher("/profile-edit.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/clubs")) {
                    if (path.endsWith("/student/clubs/view")) {
                        session.setAttribute("listClub", listC);
                        session.setAttribute("myClubs", myClubs);
                        session.setAttribute("semesterNames", semesterNames);
                        session.setAttribute("userProfileID", userP);
                        session.setAttribute("StudentPorfile", studentProfile);
                        session.setAttribute("studentProfileID", studentProfileID);
                        session.setAttribute("tabId", 4);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.endsWith("/student/clubs/detail")) {
                        request.getRequestDispatcher("/club-detail.jsp").forward(request, response);
                    } else if (path.endsWith("/student/clubs/register")) {
                        request.getRequestDispatcher("/club-regsiter.jsp").forward(request, response);
                    } else if (path.startsWith("/student/clubs/myclub")) {
                        request.getRequestDispatcher("/myclub.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/events")) {
                    if (path.endsWith("/student/events/view")) {
                        session.setAttribute("userProfileID", userP);
                        session.setAttribute("StudentPorfile", studentProfile);
                        session.setAttribute("studentProfileID", studentProfileID);
                        session.setAttribute("eventCategoryNames", eventCategoryNames);
                        session.setAttribute("listEvent", listE);
                        session.setAttribute("pertiList", pertiList);
                        session.setAttribute("tabId", 3);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.endsWith("/student/events/detail")) {
                        request.getRequestDispatcher("/event-detail.jsp").forward(request, response);
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
                }
            } catch (SQLException ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
