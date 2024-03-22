package Controllers;

import DAOs.ClubDAO;
import DAOs.EventDAO;
import DAOs.ManagerProfileDAO;
import DAOs.NewsDAO;
import DAOs.SemesterDAO;
import DAOs.StudentProfileDAO;
import DAOs.UserLoginDAO;
import Models.Club;
import Models.ClubMember;
import Models.Event;
import Models.News;
import Models.ParticipationEventDetail;
import Models.StudentProfile;
import Models.UserLogin;
import DAOs.StudentProfileDAO;
import DAOs.UserProfileDAO;
import Models.UserProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;
import java.util.ArrayList;
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
        UserProfile userProfile = (UserProfile) session.getAttribute("user");
        String path = request.getRequestURI();
        UserProfileDAO userprofileDAO = new UserProfileDAO();
        if (role != null && role.equals("Student")) {
            try {
                StudentProfileDAO studentProfileDAO = new StudentProfileDAO();
                ManagerProfileDAO managerProfileDAO = new ManagerProfileDAO();
                UserLoginDAO userLoginDAO = new UserLoginDAO();
                int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userProfile.getUserProfileID());
                EventDAO eventManagerDAO = new EventDAO();
                ClubDAO clubDAO = new ClubDAO();
                List<Club> listC = clubDAO.listClub();
                List<ClubMember> clubM = clubDAO.getClubMemberByStudentProfileID(studentProfileID);
                // String semesterName = clubDAO.getSemesterNameByClubID( , studentProfileID);
                List<Event> listEventStudent = eventManagerDAO.checkStudentParticipationEventDetail(studentProfileID);
                String getClubRole = clubDAO.getClubRoll(studentProfileID);
                List<Event> listE = eventManagerDAO.eventList();
                List<ParticipationEventDetail> pertiList = eventManagerDAO.participateEventList();
                Map<Integer, String> eventCategoryNames = new HashMap<>();
                List<Club> listMyClub = clubDAO.getMyClub(studentProfileID);
                for (Event event : listE) {
                    String eventC = eventManagerDAO.getEventCategoryName(event.getEventCategoryID());
                    eventCategoryNames.put(event.getEventID(), eventC);
                }
                if (path.endsWith("/student")) {
                    String semesterIDString = (String) session.getAttribute("semesterIDStudentChart");
                    if (semesterIDString == null) {
                        SemesterDAO semDAO = new SemesterDAO();
                        String currentSemesterName = (String) session.getAttribute("semester");
                        int semesterID = semDAO.getSemesterIDBySemesterName(currentSemesterName);
                        session.setAttribute("semesterIDStudentChart", semesterID + "");
                    } else {
                        session.setAttribute("semesterIDStudentChart", semesterIDString);
                    }
                    session.setAttribute("userProfile", userProfile);
                    session.setAttribute("studentProfileID", studentProfileID);
                    session.setAttribute("listEvent", listE);
                    session.setAttribute("pertiList", pertiList);
                    session.setAttribute("eventCategoryNames", eventCategoryNames);
                    session.setAttribute("listClub", listC);
                    session.setAttribute("clubMembers", clubM);
                    session.setAttribute("listMyClub", listMyClub);
                    session.setAttribute("listEventStudent", listEventStudent);
                    session.setAttribute("getClubRole", getClubRole);
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
                        String checkClubRole = clubDAO.getClubRole(studentProfileID);
                        session.setAttribute("checkClubRole", checkClubRole);

                        session.setAttribute("listClub", listC);
                        session.setAttribute("clubMembers", clubM);
                        session.setAttribute("listMyClub", listMyClub);
                        session.setAttribute("tabId", 4);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.startsWith("/student/clubs/detail")) {
                        String[] idArray = path.split("/");
                        int id = Integer.parseInt(idArray[idArray.length - 1]);

                        String checkClubRole = clubDAO.getClubRole(studentProfileID);
                        session.setAttribute("checkClubRole", checkClubRole);
                        ResultSet rsStudent = studentProfileDAO.getStudentProfileMorebyEventID(id);
                        session.setAttribute("studentProfileID", studentProfileID);
                        session.setAttribute("rsStudent", rsStudent);
                        session.setAttribute("rsClubID", id);
                        Club club = clubDAO.getClub(id);
                        boolean checkIsMember = clubDAO.checkStudentAsMemeberInClub(id, studentProfileID);
                        session.setAttribute("checkIsMember", checkIsMember);
                        session.setAttribute("club", club);
                        session.setAttribute("tabId", 8);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.endsWith("/student/clubs/create")) {
                        session.setAttribute("studentProfileID", studentProfileID);
                        session.setAttribute("tabId", 10);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.startsWith("/student/clubs/viewClubMember/")) {
                        String[] isArray = path.split("/");
                        int clubId = Integer.parseInt(isArray[isArray.length - 1]);
                        List<Map<String, String>> listClubMember = clubDAO.getAllMembersClub(clubId);
                        session.setAttribute("listClubMember", listClubMember);
                        Club myClubInfo = clubDAO.getClubByClubID(clubId);
                        Club clubMy = clubDAO.getClubByClubID(clubId);
                        session.setAttribute("myClubInfo", myClubInfo);
                        session.setAttribute("clubMy", clubMy);
                        List<Map<String, String>> listCheckRequestJoin = clubDAO.getRequestJoinClub(clubId);
                        session.setAttribute("listCheckRequestJoin", listCheckRequestJoin);

                        session.setAttribute("tabId", 9);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    } else if (path.startsWith("/student/clubs/feedback/")) {

                        String[] idArray = path.split("/");
                        int id = Integer.parseInt(idArray[idArray.length - 1]);

                        Club clubMy = clubDAO.getClubByClubID(id);
                        Club club = clubDAO.getClub(id);
                        String semesterIDString = (String) session.getAttribute("semesterIDStudentScore");

                        if (semesterIDString == null) {
                            SemesterDAO semDAO = new SemesterDAO();
                            String currentSemesterName = (String) session.getAttribute("semester");
                            int semesterID = semDAO.getSemesterIDBySemesterName(currentSemesterName);
                            session.setAttribute("semesterIDStudentScore", semesterID + "");
                        } else {
                            session.setAttribute("semesterIDStudentScore", semesterIDString);
                        }
                        ResultSet rsStudent = studentProfileDAO.getStudentProfileMorebyEventID(id);
                        session.setAttribute("studentProfileID", studentProfileID);
                        session.setAttribute("rsStudent", rsStudent);
                        session.setAttribute("rsClubID", id);
                        session.setAttribute("clubMy", clubMy);
                        session.setAttribute("club", club);
                        session.setAttribute("tabId", 16);
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
                        session.setAttribute("eventCategoryNames", eventCategoryNames);
                        session.setAttribute("studentProfileID", studentProfileID);
                        session.setAttribute("rsEventID", id);

                        Event event = eventManagerDAO.getEvent(id);
                        int numberOfParticipants = eventManagerDAO.getNumberOfParticipants(id);
                        boolean checkParticipation = eventManagerDAO.checkStudentJoinEvent(id, studentProfileID);
                        boolean checkAttendance = eventManagerDAO.checkStudentJoinEventAttendance(id, studentProfileID);
                        session.setAttribute("numberOfParticipants", numberOfParticipants);
                        session.setAttribute("checkParticipation", checkParticipation);
                        session.setAttribute("checkAttendance", checkAttendance);
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
                    if (path.startsWith("/student/news/detail")) {
                        String[] idArray = path.split("/");
                        int id = Integer.parseInt(idArray[idArray.length - 1]);
                        NewsDAO newsDAO = new NewsDAO();
                        News news = newsDAO.getNewsByID(id);
                        String name = newsDAO.getNameAuthor(id);
                        session.setAttribute("news", news);
                        session.setAttribute("name", name);
                        session.setAttribute("newsID", id);
                        session.setAttribute("tabId", 13);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/point")) {
                    if (path.endsWith("/student/point/view")) {
                        String semesterIDString = (String) session.getAttribute("semesterIDStudentScore");
                        if (semesterIDString == null) {
                            SemesterDAO semDAO = new SemesterDAO();
                            String currentSemesterName = (String) session.getAttribute("semester");
                            int semesterID = semDAO.getSemesterIDBySemesterName(currentSemesterName);
                            session.setAttribute("semesterIDStudentScore", semesterID + "");
                        } else {
                            session.setAttribute("semesterIDStudentScore", semesterIDString);
                        }
                        session.setAttribute("tabId", 15);
                        request.getRequestDispatcher("/student.jsp").forward(request, response);
                    }
                } else if (path.startsWith("/student/clubmember/deletemember/")) {
                    String[] isArray = path.split("/");
                    int clubId = Integer.parseInt(isArray[isArray.length - 1]);
                    int studentId = Integer.parseInt(isArray[isArray.length - 2]);
                    int count = clubDAO.deleteClubMember(studentId, clubId);
                    if (count > 0) {
                        session.setAttribute("checkDeleteMember", "success");
                    } else {
                        session.setAttribute("checkDeleteMember", "fail");
                    }
                    response.sendRedirect("/student/clubs/viewClubMember/" + clubId);
                } else if (path.equals("/student/viewEventMyClub")) {
                    int clubId = clubDAO.getMyClubId(studentProfileID);
                    List<Map<String, String>> listEventMyClub = clubDAO.getListEventMyclub(clubId, studentProfileID);
                    session.setAttribute("listEventMyClub", listEventMyClub);
                    session.setAttribute("tabId", 12);
                    request.getRequestDispatcher("/student.jsp").forward(request, response);
                } else if (path.equals("/student/createEventMyClub")) {
                    session.setAttribute("tabId", 14);
                    request.getRequestDispatcher("/student.jsp").forward(request, response);
                } else if (path.startsWith("/student/viewClubMember/detailMember/")) {
                    String[] isArray = path.split("/");
                    int studentId = Integer.parseInt(isArray[isArray.length - 2]);
                    int clubId = Integer.parseInt(isArray[isArray.length - 1]);
                    session.setAttribute("tabId", 11);
                    session.setAttribute("clubId", clubId);
                    ResultSet rsStudent = studentProfileDAO.getStudentProfileMoreByID(studentId);
                    session.setAttribute("rsStudent", rsStudent);
                    String clubRoleOfMember = clubDAO.getClubRole(studentId);
                    session.setAttribute("clubRoleOfMember", clubRoleOfMember);
                    request.getRequestDispatcher("/student.jsp").forward(request, response);
                } else if (path.startsWith("/student/checkrequestjoinclub/")) {
                    if (path.startsWith("/student/checkrequestjoinclub/accept/")) {
                        String[] isArray = path.split("/");
                        int clubId = Integer.parseInt(isArray[isArray.length - 2]);
                        int studentId = Integer.parseInt(isArray[isArray.length - 1]);
                        int check = clubDAO.checkRequestJoinClub("Member", studentId, clubId);
                        LocalDate currentDate = LocalDate.now();
                        if (check > 0) {
                            session.setAttribute("checkRequestJoinAccept", "success");
                        } else {
                            session.setAttribute("checkRequestJoinAccept", "fail");
                        }
                        response.sendRedirect("/student/clubs/viewClubMember/" + clubId);
                    } else if (path.startsWith("/student/checkrequestjoinclub/reject/")) {
                        String[] isArray = path.split("/");
                        int clubId = Integer.parseInt(isArray[isArray.length - 2]);
                        int studentId = Integer.parseInt(isArray[isArray.length - 1]);
                        int check = clubDAO.checkRequestJoinClub("Decline", studentId, clubId);
                        if (check > 0) {
                            session.setAttribute("checkRequestJoinReject", "success");
                        } else {
                            session.setAttribute("checkRequestJoinReject", "fail");
                        }
                        response.sendRedirect("/student/clubs/viewClubMember/" + clubId);
                    } else if (path.startsWith("/student/checkrequestjoinclub/remove/")) {
                        String[] isArray = path.split("/");
                        int clubId = Integer.parseInt(isArray[isArray.length - 2]);
                        int studentId = Integer.parseInt(isArray[isArray.length - 1]);
                        int check = clubDAO.removeRequest(studentId, clubId);
                        if (check > 0) {
                            session.setAttribute("checkRequestJoinRemove", "success");
                        } else {
                            session.setAttribute("checkRequestJoinRemove", "fail");
                        }
                        response.sendRedirect("/student/clubs/viewClubMember/" + clubId);
                    }
                } else if (path.startsWith("/student/clubs/feedback")) {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);

                    Club clubMy = clubDAO.getClubByClubID(id);
                    Club club = clubDAO.getClub(id);

                    ResultSet rsStudent = studentProfileDAO.getStudentProfileMorebyEventID(id);
                    session.setAttribute("studentProfileID", studentProfileID);
                    session.setAttribute("rsStudent", rsStudent);
                    session.setAttribute("rsClubID", id);
                    session.setAttribute("clubMy", clubMy);
                    session.setAttribute("club", club);
                    session.setAttribute("tabId", 16);
                    request.getRequestDispatcher("/student.jsp").forward(request, response);
//                    response.sendRedirect("/student/clubs/viewClubMember/" + id);
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
        EventDAO eventManagerDAO = new EventDAO();
        String path = request.getRequestURI();
        String createCompatition = request.getParameter("createCompatition");
        String createEvent = request.getParameter("createEvent");
        String pointAndReportForStudent = request.getParameter("pointAndReportForStudent");
        String updateRoleMember = request.getParameter("updateRoleMember");
        try {
            if (action != null && action.equals("Join")) {
                int eventID = Integer.parseInt(request.getParameter("EventID"));
                int studentProfileID = Integer.parseInt(request.getParameter("studentProfileID"));
                String roleEvent = "Menber";
                boolean isPresent = Boolean.FALSE;
                String report = null;
                String result = null;
                ParticipationEventDetail participationEventDetail = new ParticipationEventDetail(
                        eventID, studentProfileID, roleEvent, isPresent, report, result);
                boolean isSuccess = eventManagerDAO.addStudentToParticipationEventDetail(participationEventDetail);
                if (isSuccess) {
                    session.setAttribute("joinEvent", "success");
                    response.sendRedirect("/student/events/view");
                } else {
                    session.setAttribute("joinEvent", "fail");
                    response.sendRedirect("/student/events/view");
                }

            } else if (request.getParameter("selectStudentScoreSemester") != null) {
                String semesterID = request.getParameter("semesterID");
                session.setAttribute("semesterIDStudentScore", semesterID);
                response.sendRedirect("/student/point/view");
            } else if (request.getParameter("selectClubScoreSemester") != null) {
                String semesterID = request.getParameter("semesterID");
                String clubID = request.getParameter("clubIDfromViewClubMember");
                session.setAttribute("semesterIDStudentScore", semesterID);
                session.setAttribute("clubID", clubID);
                response.sendRedirect("/student/clubs/feedback/" + clubID);
            } else if (action != null && action.equals("Register")) {
                int clubID = Integer.parseInt(request.getParameter("ClubID"));

                int studentProfileID = Integer.parseInt(request.getParameter("studentProfileID"));
                int semesterID = 10;
                String clubRole = null;
                int clubPoint = 0;
                String report = null;
                ClubDAO clubDAO = new ClubDAO();
                ClubMember clubMember = new ClubMember(
                        clubID,
                        semesterID,
                        clubRole,
                        clubPoint,
                        report,
                        studentProfileID);
                boolean isRegister = clubDAO.registerStudentToClub(clubMember);
                if (isRegister) {
                    session.setAttribute("registerClub", "success");
                    response.sendRedirect("/student/clubs/view");
                } else {
                    session.setAttribute("registerClub", "fail");
                    response.sendRedirect("/student/clubs/view");
                }
            } else if (createEvent != null && createEvent.equals("Submit")) {
                int count = 0;
                ManagerProfileDAO managerProfileDAO = new ManagerProfileDAO();
                String eventName = request.getParameter("eventname");
                Timestamp preTime = formatTime(LocalDateTime.parse(request.getParameter("pretime")));
                Timestamp holeTime = formatTime(LocalDateTime.parse(request.getParameter("holdtime")));
                String location = request.getParameter("location");
                int cost = Integer.parseInt(request.getParameter("cost"));
                int exNum = Integer.parseInt(request.getParameter("exnum"));
                String organization = request.getParameter("organization");
                String description = request.getParameter("description");
                String feedback = request.getParameter("feedback");
                Timestamp endTime = formatTime(LocalDateTime.parse(request.getParameter("endtime")));
                UserProfile userProfile = (UserProfile) session.getAttribute("user");
                UserLoginDAO userLoginDAO = new UserLoginDAO();
                int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userProfile.getUserProfileID());
                String eventCatelogyName = request.getParameter("catelogyEvent");
                int eventCatelogyID = 0;
                if (eventCatelogyName.equalsIgnoreCase("Soft Skills")) {
                    eventCatelogyID = 1;
                } else {
                    eventCatelogyID = 3;
                }
                count = eventManagerDAO.addEventForMyClub(eventName, preTime, holeTime, location, cost, exNum,
                        organization, description, feedback, endTime, studentProfileID, eventCatelogyID);
                if (count > 0) {
                    session.setAttribute("checkCreateEvent", "success");
                } else {
                    session.setAttribute("checkCreateEvent", "fail");
                }
                response.sendRedirect("/student/events/view");
            } else if (createCompatition != null && createCompatition.equals("Submit")) {
                int count = 0;
                ManagerProfileDAO managerProfileDAO = new ManagerProfileDAO();
                String eventName = request.getParameter("eventname");
                Timestamp preTime = formatTime(LocalDateTime.parse(request.getParameter("pretime")));
                Timestamp holeTime = formatTime(LocalDateTime.parse(request.getParameter("holdtime")));
                String location = request.getParameter("location");
                int cost = Integer.parseInt(request.getParameter("cost"));
                int exNum = Integer.parseInt(request.getParameter("exnum"));
                String organization = request.getParameter("organization");
                String description = request.getParameter("description");
                String feedback = request.getParameter("feedback");
                Timestamp endTime = formatTime(LocalDateTime.parse(request.getParameter("endtime")));
                UserProfile userProfile = (UserProfile) session.getAttribute("user");
                UserLoginDAO userLoginDAO = new UserLoginDAO();
                int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userProfile.getUserProfileID());
                int firtPrize = Integer.parseInt(request.getParameter("firtPrize"));
                int secondPrize = Integer.parseInt(request.getParameter("secondPrize"));
                int thirdPrize = Integer.parseInt(request.getParameter("thirdPrize"));
                int encouragementPrize = Integer.parseInt(request.getParameter("encouragementPrize"));
                int prizeStructureID = eventManagerDAO.getMaxPrizeStructureID();
                count = eventManagerDAO.addPrizeStructure(firtPrize, secondPrize, thirdPrize, encouragementPrize);
                eventManagerDAO.addCompatitionForMyCLub(eventName, preTime, holeTime, location, cost, exNum,
                        organization, description, feedback, endTime, studentProfileID, 2, prizeStructureID);
                if (count > 0) {
                    session.setAttribute("checkCreateEvent", "success");
                } else {
                    session.setAttribute("checkCreateEvent", "fail");
                }
                response.sendRedirect("/student/events/view");
            } else if (updateRoleMember != null && updateRoleMember.startsWith("Update")) {
                String[] isArray = path.split("/");
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                int clubId = Integer.parseInt(request.getParameter("clubId"));
                String clubrole = request.getParameter("clubrole");
                ClubDAO clubDAO = new ClubDAO();
                UserProfile userProfile = (UserProfile) session.getAttribute("user");
                UserLoginDAO userLoginDAO = new UserLoginDAO();
                int studentProfileID = userLoginDAO.getStudentProfileIDByUserProfileID(userProfile.getUserProfileID());
                int check = 0;
                if (studentId != studentProfileID && clubrole.equalsIgnoreCase("Leader Club")) {
                    check = clubDAO.updateRoleMember(clubrole, studentId, clubId);
                    check = clubDAO.updateRoleMember("Member", studentProfileID, clubId);
                    if (check > 0) {
                        session.setAttribute("checkUpdateRole", "success");
                    } else {
                        session.setAttribute("checkUpdateRole", "fail");
                    }
                    response.sendRedirect("/student");
                } else {
                    check = clubDAO.updateRoleMember(clubrole, studentId, clubId);
                    if (check > 0) {
                        session.setAttribute("checkUpdateRole", "success");
                    } else {
                        session.setAttribute("checkUpdateRole", "fail");
                    }
                    response.sendRedirect("/student/clubs/viewClubMember/" + clubId);
                }
            } else if (pointAndReportForStudent != null && pointAndReportForStudent.equals("Submit")) {
                int count = 0;
                Enumeration<String> parameterNames = request.getParameterNames();
                ArrayList<String> pointList = new ArrayList<>();
                ArrayList<String> reportList = new ArrayList<>();
                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    if (paramName.startsWith("pointStudent")) {
                        pointList.add(paramName);
                    } else if (paramName.startsWith("reportStudent")) {
                        reportList.add(paramName);
                    }
                }

                for (int i = 0; i < pointList.size(); i++) {

                    String[] pointSplit = pointList.get(i).split("/");
                    int clubId = Integer.parseInt(pointSplit[1]);
                    int studentProfileId = Integer.parseInt(pointSplit[2]);
                    int semesterID = Integer.parseInt(pointSplit[3]);

                    int point = Integer.parseInt(request.getParameter(pointList.get(i)));
                    String report = request.getParameter(reportList.get(i));

                    ClubDAO clubDAO = new ClubDAO();

                    int rs = clubDAO.updatePointAndReport(clubId, studentProfileId, semesterID, point, report);
                    session.setAttribute("checkEvaluateStudentMember", "success");
                    response.sendRedirect("/student/clubs/feedback/" + clubId);
                }

                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    String paramNameReport = parameterNames.nextElement();

                    if (paramName.startsWith("pointStudent/") || paramNameReport.startsWith("reportStudent/")) {
                        String[] ids = paramName.split("/");
                        int clubId = Integer.parseInt(ids[1]);
                        int studentProfileId = Integer.parseInt(ids[2]);
                        int semesterID = Integer.parseInt(ids[3]);

                        String pointString = request.getParameter(paramName);
                        String report = request.getParameter(paramNameReport);

                        int point = Integer.parseInt(pointString);
                        ClubDAO clubDAO = new ClubDAO();
                        int rs = clubDAO.updatePointAndReport(clubId, studentProfileId, semesterID, point, report);
                        if (rs > 0) {
                            count++;
                        }
                        if (count > 0) {
                            session.setAttribute("checkEvaluateStudentMember", "success");
                        } else {
                            session.setAttribute("checkEvaluateStudentMember", "fail");
                        }

                        response.sendRedirect("/student/clubs/feedback/" + clubId);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
