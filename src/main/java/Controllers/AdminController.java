/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author QuocCu
 */
public class AdminController extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String path = request.getRequestURI();
       HttpSession session = request.getSession();
       String role = (String) session.getAttribute("role");
       if (role != null && role.equals("Admin")){
           if(path.startsWith("/admin/profile")){
               if(path.endsWith("/admin/profile/edit")){
                   session.setAttribute("tabId", 2);
                   request.getRequestDispatcher("/admin.jsp").forward(request, response);
               }else{
                   session.setAttribute("tabId", 1);
                   request.getRequestDispatcher("/admin.jsp").forward(request, response);
               }
           }
           else if(path.equals("/admin")){
              session.setAttribute("tabId", 3);
              request.getRequestDispatcher("/admin.jsp").forward(request, response);
           }
           else if(path.endsWith("/admin/account/eventmanager")){
              session.setAttribute("tabId", 4);
              request.getRequestDispatcher("/admin.jsp").forward(request, response);
           }
           else if(path.endsWith("/admin/account/eventmanager/create")){
              session.setAttribute("tabId", 5);
              request.getRequestDispatcher("/admin.jsp").forward(request, response);
           }
           else if(path.endsWith("/admin/account/clubmanager")){
              session.setAttribute("tabId", 6);
              request.getRequestDispatcher("/admin.jsp").forward(request, response);
           }
           else if(path.endsWith("/admin/account/clubmanager/create")){
              session.setAttribute("tabId", 7);
              request.getRequestDispatcher("/admin.jsp").forward(request, response);
           }  
           else if(path.endsWith("/admin/account/student")){
              session.setAttribute("tabId", 8);
              request.getRequestDispatcher("/admin.jsp").forward(request, response);
           }
           else if(path.endsWith("/admin/account/student/create")){
              session.setAttribute("tabId", 9);
              request.getRequestDispatcher("/admin.jsp").forward(request, response);
               
           }
       }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }
}
