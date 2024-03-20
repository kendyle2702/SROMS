package Controllers;

import DAOs.UserLoginDAO;
import Models.UserProfile;
import Utils.Constants;
import Utils.GoogleInformation;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Month;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

public class LoginController extends HttpServlet {

    private void doGetLoginWithGoogle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        String authToken = getToken(code);
        GoogleInformation userInfor = getUserInfo(authToken);

//      System.out.println(userInfor.getEmail() + ":" +(String)session.getAttribute("role") );
        UserLoginDAO userLoginDAO = new UserLoginDAO();
        String roleLogin = (String) session.getAttribute("roleLogin");
        String username = userInfor.getEmail();
        UserProfile userProfile = userLoginDAO.getUserProfileByUsername(username);
        if (userProfile != null) {
            boolean isLogin = userLoginDAO.loginWithGoogleByUsernameAndRole(username, roleLogin);
            if (isLogin) {
                session.setAttribute("user", userProfile);
                session.setAttribute("role", roleLogin);
                session.setAttribute("semester", getSemester());
                System.out.println(getSemester());
                Cookie c = new Cookie("login", URLEncoder.encode(userProfile.getEmail() + "/" + roleLogin, "UTF-8"));
                c.setMaxAge(24 * 60 * 60 * 3);
                response.addCookie(c);
                // Redirect to the corresponding Controller role
                switch (roleLogin) {
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
                request.setAttribute("errorLogin", "You don't have permission to log in to the \"" + (String) session.getAttribute("role") + "\" role");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorLogin", "Account does not exist");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getRequestURI();
        if (!path.endsWith("/logout")) {
            if (request.getParameter("code") != null) {
                doGetLoginWithGoogle(request, response);
            } else if (session.getAttribute("user") != null) {
                response.sendRedirect("/");
            } else {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }else{
            Cookie[] cList = request.getCookies();
            if (cList != null) {
                for (Cookie c : cList) {
                    c.setValue("");
                    c.setPath("/");
                    c.setMaxAge(0);
                    response.addCookie(c);
                }

            }
            session.invalidate();
            response.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String submitButton = request.getParameter("submitButton");
        String role = request.getParameter("userRoleLogin");
        if (submitButton != null) {
            switch (role) {
                case "0":
                    session.setAttribute("roleLogin", "None");
                    break;
                case "1":
                    session.setAttribute("roleLogin", "Admin");
                    break;
                case "2":
                    session.setAttribute("roleLogin", "Event Manager");
                    break;
                case "3":
                    session.setAttribute("roleLogin", "Club Manager");
                    break;
                case "4":
                    session.setAttribute("roleLogin", "Student");
                    break;
            }
            response.sendRedirect("/login");
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleInformation getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleInformation googleinfo = new Gson().fromJson(response, GoogleInformation.class);
        return googleinfo;
    }
    
    public static String getSemester() {
        LocalDate currentDate = LocalDate.now();
        
        int currentYear = currentDate.getYear();
        Month currentMonth = currentDate.getMonth();

        if (currentMonth.getValue() >= 1 && currentMonth.getValue() <= 4) {
            return "Spring " + currentYear;
        } else if (currentMonth.getValue() > 4 && currentMonth.getValue() <= 8) {
            return "Summer " + currentYear;
        } else {
            return "Fall " + currentYear;
        }
    }
    public static String getTimePeriod() {
        LocalTime currentTime = LocalTime.now();
        if (currentTime.isBefore(LocalTime.of(11, 0))) {
            return "Good morning";
        } else if (currentTime.isBefore(LocalTime.of(14, 0))) {
            return "Good noon";
        } else if (currentTime.isBefore(LocalTime.of(19, 0))) {
            return "Good afternoon";
        } else if (currentTime.isBefore(LocalTime.of(22, 0))) {
            return "Good evening";
        }
        else {
            return "Good night";
        }
    }
}
