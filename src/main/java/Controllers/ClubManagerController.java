/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ClubDAO;
import Models.Club;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
                } else if (path.equals("/clubmanager/viewClubs")) {
                    session.setAttribute("tabId", 4);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                } else if (path.startsWith("/clubmanager/delete")) {
                    String[] parts = path.split("/");
                    String p = parts[parts.length - 1];
                    int id = Integer.parseInt(p);
                    clubDAO.delete(id);
                    listClub = clubDAO.listClub();
                    totalClub = clubDAO.getTotalClub();
                    session.setAttribute("Club", listClub);
                    session.setAttribute("totalClub", totalClub);
                    request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                } else if (path.equals("/clubmanager/checkRequestClub")) {
                    session.setAttribute("tabId", 2);
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
                } else if (path.startsWith("/clubmanager/check")) {

                    if (path.startsWith("/clubmanager/check/accept")) {
                        String[] parts = path.split("/");
                        String p = parts[parts.length - 1];
                        int id = Integer.parseInt(p);
                        int checkAccept = clubDAO.checkRequestCreate(1, id);
                        if (checkAccept > 0) {
                            session.setAttribute("checkRequestClub", "acceptSuccess");
                        } else {
                            session.setAttribute("checkRequestClub", "acceptFail");
                        }
                    } else if (path.startsWith("/clubmanager/check/reject")) {
                        String[] parts = path.split("/");
                        String p = parts[parts.length - 1];
                        int id = Integer.parseInt(p);
                        int checkReject = clubDAO.checkRequestCreate(0, id);
                        if (checkReject > 0) {
                            session.setAttribute("checkRequestClub", "rejectSuccess");
                        } else {
                            session.setAttribute("checkRequestClub", "rejectFail");
                        }
                    }
                    response.sendRedirect("/clubmanager/checkRequestClub");
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
    }
}
