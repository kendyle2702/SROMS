
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


public class StudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String path = request.getServletPath();

        if (role != null) {
            if (path.endsWith("/student")) {
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
        } else {
            res.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
