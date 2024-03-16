package Controllers;

import static Controllers.LoginController.getSemester;
import DAOs.UserLoginDAO;
import Models.UserProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;

public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            String username = null;
            String role = null;
            Cookie[] cList = request.getCookies();
            if (cList != null) {
                boolean logged = false;
                for (Cookie c : cList) {
                    if (c.getName().equals("login")) {
                        String[] userInfo = URLDecoder.decode(c.getValue(),"UTF-8").split("/");
                        username = userInfo[0];
                        role = userInfo[1];
                        logged = true;
                        break;
                    }
                }
                if (logged) {
                    UserLoginDAO userLoginDAO = new UserLoginDAO();
                    UserProfile userProfile = userLoginDAO.getUserProfileByUsername(username);
                    if (userProfile != null) {
                        session.setAttribute("user", userProfile);
                        session.setAttribute("role", role);
                        session.setAttribute("semester", getSemester());
                    }
                    switch(role) {
                        case "Admin":
                            session.setAttribute("roleURL", "admin");
                            response.sendRedirect("/admin");
                            break;
                        case "Event Manager":
                            session.setAttribute("roleURL", "eventmanager");
                            response.sendRedirect("/eventmanager");
                            break;
                        case "Club Manager":
                            session.setAttribute("roleURL", "clubmanager");
                            response.sendRedirect("/clubmanager");
                            break;
                        case "Student":
                            session.setAttribute("roleURL", "student");
                            response.sendRedirect("/student");
                            break;
                    }
                } else {
                    response.sendRedirect("/login");
                }
            } else {
                response.sendRedirect("/login");
            }
        } else {
            String role = (String)session.getAttribute("role");
            switch (role) {
                case "Admin":
                    response.sendRedirect("/admin");
                    break;
                case "Event Manager":
                    response.sendRedirect("/eventmanager");
                    break;
                case "Club Manager":
                    response.sendRedirect("/clubmanager");
                    break;
                case "Student":
                    response.sendRedirect("/student");
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
