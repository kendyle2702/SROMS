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
            String path = request.getRequestURI();
            HttpSession session = request.getSession();
            ClubDAO clubDAO = new ClubDAO();
            List<Club> listClub = clubDAO.listClub();
            int totalClub = clubDAO.getTotalClub();
            session.setAttribute("Club", listClub);
            session.setAttribute("totalClub", totalClub);
            if (path.endsWith("/clubmanager")) {
                request.getRequestDispatcher("/ClubHome.jsp").forward(request, response);
            } else if (path.startsWith("/clubmanager/delete")) {
                String[] parts = path.split("/");
                String p = parts[parts.length - 1];
                int id = Integer.parseInt(p);
                clubDAO.delete(id);
                listClub = clubDAO.listClub();
                totalClub = clubDAO.getTotalClub();
                session.setAttribute("Club", listClub);
                session.setAttribute("totalClub", totalClub);
                request.getRequestDispatcher("/ClubHome.jsp").forward(request, response);
            } else if (path.startsWith("/clubmanager/viewdetail")) {
                request.getRequestDispatcher("/ClubDetail.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClubManagerController.class.getName()).log(Level.SEVERE, null, ex);
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

}
