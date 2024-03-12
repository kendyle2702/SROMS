package Controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class StudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String path = request.getRequestURI();

        if (role != null && role.equals("Student")) {
            if (path.endsWith("/student")) {
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
            } else if (path.startsWith("student/clubs/viewMemberClubs/")) {
                String[] idArray = path.split("/");
                int id = Integer.parseInt(idArray[idArray.length - 1]);
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
