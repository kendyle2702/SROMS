/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ClubDAO;
import DAOs.SemesterDAO;
import DAOs.UserLoginDAO;
import Models.Club;
import Models.UserProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class ClubManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if (role != null && role.equals("Club Manager")) {
            try {
                ClubDAO clubDAO = new ClubDAO();
                List<Club> listClub = clubDAO.listClub();
                int totalClub = clubDAO.getTotalClub();
                session.setAttribute("Club", listClub);
                session.setAttribute("totalClub", totalClub);
                if (path.endsWith("/clubmanager")) {
                    session.setAttribute("tabId", 1);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                } else if (path.equals("/clubmanager/profile")) {
                    session.setAttribute("tabId", 2);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                } else if (path.equals("/clubmanager/profile/edit")) {
                    session.setAttribute("tabId", 3);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                } else if (path.equals("/clubmanager/viewclubs")) {
                    session.setAttribute("tabId", 4);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                } else if (path.startsWith("/clubmanager/clubdetail/block/")) {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);
                    ClubDAO club = new ClubDAO();
                    club.blockClub(id);
                    response.sendRedirect("/clubmanager/clubdetail/" + id);
                } else if (path.startsWith("/clubmanager/clubdetail/unblock/")) {
                    String[] idArray = path.split("/");
                    int id = Integer.parseInt(idArray[idArray.length - 1]);
                    ClubDAO club = new ClubDAO();
                    club.unblockClub(id);
                    response.sendRedirect("/clubmanager/clubdetail/" + id);
                } else if (path.startsWith("/clubmanager/clubdetail/")) {
                    String[] isArray = path.split("/");
                    int id = Integer.parseInt(isArray[isArray.length - 1]);
                    Club clubDetail = clubDAO.getClubByClubID(id);
                    session.setAttribute("clubDetail", clubDetail);
                    ClubDAO clubC = new ClubDAO();
                    ResultSet clubCurrent = clubC.getCurrentClubDetail(id);
                    session.setAttribute("rsClubCurrent", clubCurrent);
                    session.setAttribute("rsClubCurrentID", id);

                    session.setAttribute("tabId", 5);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);

                } else if (path.equals("/clubmanager/checkrequestClub")) {
                    session.setAttribute("tabId", 6);
                    int clubID = 0;
                    int studentProfileID = 0;
                    List<Club> listCheckRequestClub = clubDAO.listCheckRequest();
                    String fullName = null;
                    for (Club club : listCheckRequestClub) {
                        clubID = club.getClubID();
                        studentProfileID = club.getStudentProfileID();
                        fullName = clubDAO.getFullName(clubID, studentProfileID);
                    }
                    session.setAttribute("fullNameCreateClub", fullName);
                    session.setAttribute("listCheckRequestClub", listCheckRequestClub);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);

                } else if (path.startsWith("/clubmanager/check/")) {
                    if (path.startsWith("/clubmanager/check/accept/")) {
                        String[] parts = path.split("/");
                        String p = parts[parts.length - 1];
                        int id = Integer.parseInt(p);
                        int checkAccept = clubDAO.checkRequestCreate(1, id);
                        if (checkAccept > 0) {
                            session.setAttribute("checkrequestClub", "acceptSuccess");
                        } else {
                            session.setAttribute("checkrequestClub", "acceptFail");
                        }
                    } else if (path.startsWith("/clubmanager/check/reject/")) {
                        String[] parts = path.split("/");
                        String p = parts[parts.length - 1];
                        int id = Integer.parseInt(p);
                        int checkReject = clubDAO.checkRequestCreate(0, id);
                        if (checkReject > 0) {
                            session.setAttribute("checkrequestClub", "rejectSuccess");
                        } else {
                            session.setAttribute("checkrequestClub", "rejectFail");
                        }
                    }
                    response.sendRedirect("/clubmanager/checkrequestClub");
                } else if (path.endsWith("/clubmanager/viewclubpoint")) {
                    String semesterIDString = (String) session.getAttribute("semesterIDClubScore");
                    if (semesterIDString == null) {
                        SemesterDAO semDAO = new SemesterDAO();
                        String currentSemesterName = (String) session.getAttribute("semester");
                        int semesterID = semDAO.getSemesterIDBySemesterName(currentSemesterName);
                        session.setAttribute("semesterIDClubScore", semesterID + "");
                    } else {
                        session.setAttribute("semesterIDClubScore", semesterIDString);
                    }
                    session.setAttribute("tabId", 7);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                } else if (path.startsWith("/clubmanager/viewclubpoint/detail/")) {
                    String[] parts = path.split("/");
                    int id = Integer.parseInt(parts[parts.length - 1]);
                    ClubDAO cDAO = new ClubDAO();
                    Club clubDetail = clubDAO.getClubByClubID(id);
                    session.setAttribute("clubDetail", clubDetail);
                    String currentSemester = (String)session.getAttribute("semesterIDClubScore");
                    int semesterID = Integer.parseInt(currentSemester);
                    ResultSet clubCurrent = cDAO.getCurrentClubDetailBySemesterID(id,semesterID);
                    session.setAttribute("memberCurrentClub", clubCurrent);
                    session.setAttribute("tabId", 8);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                }

            } catch (SQLException ex) {
                Logger.getLogger(ClubManagerController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserProfile user = (UserProfile) session.getAttribute("user");
        String role = (String) session.getAttribute("role");

        if (request.getParameter("selectClubScoreSemester") != null) {
            String semesterID = request.getParameter("semesterID");
            session.setAttribute("semesterIDClubScore", semesterID);
            response.sendRedirect("/clubmanager/viewclubpoint");
        }
    }
}
