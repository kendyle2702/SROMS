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
            } else if (path.startsWith("/clubmanager/profile")) {
                if (path.endsWith("/clubmanager/profile/edit")) {
                        session.setAttribute("tabId", 4);
                        request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                    } else {
                        session.setAttribute("tabId", 3);
                        request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
                    }
            }
            else if (path.startsWith("/clubmanager/delete")) {
                String[] parts = path.split("/");
                String p = parts[parts.length - 1];
                int id = Integer.parseInt(p);
                clubDAO.delete(id);
                listClub = clubDAO.listClub();
                totalClub = clubDAO.getTotalClub();
                session.setAttribute("Club", listClub);
                session.setAttribute("totalClub", totalClub);
                request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
            } else if (path.startsWith("/clubmanager/viewdetail")) {
                session.setAttribute("tabId", 2);
                request.getRequestDispatcher("/clubManager.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClubManagerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        }else{
            response.sendRedirect("/");
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
