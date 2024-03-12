/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AdminProfileDAO;
import DAOs.NewsDAO;
import DAOs.StudentProfileDAO;
import DAOs.UserLoginDAO;
import Models.AdminProfile;
import Models.Event;
import Models.News;
import Models.UserProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;

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
        if (role != null && role.equals("Admin")) {
            if (path.startsWith("/admin/profile")) {
                if (path.endsWith("/admin/profile/edit")) {
                    session.setAttribute("tabId", 2);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                } else {
                    session.setAttribute("tabId", 1);
                    request.getRequestDispatcher("/admin.jsp").forward(request, response);
                }
            } else if (path.equals("/admin")) {
                session.setAttribute("tabId", 3);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/account/eventmanager")) {
                session.setAttribute("tabId", 4);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/account/eventmanager/create")) {
                session.setAttribute("tabId", 5);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/account/clubmanager")) {
                session.setAttribute("tabId", 6);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/account/clubmanager/create")) {
                session.setAttribute("tabId", 7);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/account/student")) {
                session.setAttribute("tabId", 8);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/account/student/create")) {
                session.setAttribute("tabId", 9);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/account/student/detail/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);

                StudentProfileDAO stProfileDAO = new StudentProfileDAO();
                ResultSet rsStudent = stProfileDAO.getStudentProfileMoreByID(id);

                session.setAttribute("rsStudent", rsStudent);
                session.setAttribute("rsStudentID", id);
                session.setAttribute("tabId", 10);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/account/student/block/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);

                UserLoginDAO userLogin = new UserLoginDAO();
                int studentID = userLogin.getStudentProfileIDByUserProfileID(id);
                userLogin.blockAccount(id);
                response.sendRedirect("/admin/account/student/detail/" + studentID);
            } else if (path.startsWith("/admin/account/student/unblock/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);
                UserLoginDAO userLogin = new UserLoginDAO();
                int studentID = userLogin.getStudentProfileIDByUserProfileID(id);
                userLogin.unblockAccount(id);
                response.sendRedirect("/admin/account/student/detail/" + studentID);
            } else if (path.endsWith("/admin/news")) {
                session.setAttribute("tabId", 13);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.endsWith("/admin/news/create")) {
                session.setAttribute("tabId", 14);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            } else if (path.startsWith("/admin/news/detail/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);
                
                NewsDAO newsDAO = new NewsDAO();
                ResultSet rsNews = newsDAO.getAllNewsMoreByID(id);
                session.setAttribute("rsNews", rsNews);
                session.setAttribute("tabId", 15);
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserProfile user = (UserProfile)session.getAttribute("user");
        String role = (String) session.getAttribute("role");
        
        if(request.getParameter("createNews")!=null){
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            java.util.Date currentDate = new java.util.Date();
            Date currentTime = new Date(currentDate.getTime());
            
            AdminProfileDAO adminProfileDAO  = new AdminProfileDAO();
            AdminProfile adminProfile = adminProfileDAO.getAdminProfileByEmail(user.getEmail());
            
            NewsDAO newsDAO = new NewsDAO();
            
            News newNews = new News(0,title, content, currentTime, adminProfile.getAdminProfileID());
            News news = newsDAO.addNews(newNews);
            if(news==null){
                session.setAttribute("createNews", "fail");
                response.sendRedirect("/admin/news/create");
            }
            else{
                session.setAttribute("createNews", "success");
                response.sendRedirect("/admin/news");
            }
        }
        else if(request.getParameter("editNews")!=null){
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int newsID = Integer.parseInt(request.getParameter("newsID"));
            
            NewsDAO newsDAO = new NewsDAO();
            
            News newNews = new News(newsID,title, content, null, 0);
            News news = newsDAO.updateNews(newNews);
            if(news==null){
                session.setAttribute("editNews", "fail");
                response.sendRedirect("/admin/news/detail/"+newsID);
            }
            else{
                session.setAttribute("editNews", "success");
                response.sendRedirect("/admin/news/detail/"+ newsID);
            }
        }
    }
}
