/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.UserLoginDAO;
import Models.UserProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author khuy
 */
public class StudentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminPageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminPageController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String path = request.getServletPath();

        if (role != null && "Student".equals(role)) {
            if (path.endsWith("/student")) {
                request.getRequestDispatcher("/student-ui.jsp").forward(request, response);

            } else if (path.startsWith("/student/profile")) {
                if (path.endsWith("/student/profile/view")) {
                    request.getRequestDispatcher("/profile.jsp").forward(request, response);
                } else if (path.endsWith("/student/profile/edit")) {
                    request.getRequestDispatcher("/profile-edit.jsp").forward(request, response);
                }
            } else if (path.startsWith("/student/clubs")) {
                if (path.endsWith("/student/clubs/view")) {
                    request.getRequestDispatcher("/clubs.jsp").forward(request, response);
                } else if (path.endsWith("/student/clubs/detail")) {
                    request.getRequestDispatcher("/club-detail.jsp").forward(request, response);
                } else if (path.endsWith("/student/clubs/register")) {
                    request.getRequestDispatcher("/club-regsiter.jsp").forward(request, response);
                } else if (path.startsWith("/student/clubs/myclub")) {
                    request.getRequestDispatcher("/myclub.jsp").forward(request, response);
                }
            } else if (path.startsWith("/student/events")) {
                if (path.endsWith("/student/events/view")) {
                    request.getRequestDispatcher("/events.jsp").forward(request, response);
                } else if (path.endsWith("/student/events/detail")) {
                    request.getRequestDispatcher("/event-detail.jsp").forward(request, response);
                } else if (path.endsWith("/student/events/register")) {
                    request.getRequestDispatcher("/event-register.jsp").forward(request, response);
                }
            } else if (path.startsWith("/student/news")) {
                if (path.endsWith("/student/news/view")) {
                    request.getRequestDispatcher("/news.jsp").forward(request, response);
                }
                if (path.endsWith("/student/new/detail")) {
                    request.getRequestDispatcher("/new-detail.jsp").forward(request, response);
                }
            }
        } else {
            res.sendRedirect("/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
