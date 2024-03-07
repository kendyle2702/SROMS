package Controllers;

import DAOs.UserLoginDAO;
import Models.UserProfile;
import Utils.Constants;
import Utils.GoogleInformation;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
        String role = (String) session.getAttribute("role");
        String username = userInfor.getEmail();
        UserProfile userProfile = userLoginDAO.getUserProfileByUsername(username);
        if (userProfile != null) {
            boolean isLogin = userLoginDAO.loginWithGoogleByUsernameAndRole(username, role);
            if (isLogin) {
                session.setAttribute("user", userProfile);
                // Redirect to the corresponding Controller role
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
        if (request.getParameter("code") != null) {
            doGetLoginWithGoogle(request, response);
        } else {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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
                    session.setAttribute("role", "None");
                    break;
                case "1":
                    session.setAttribute("role", "Admin");
                    break;
                case "2":
                    session.setAttribute("role", "Event Manager");
                    break;
                case "3":
                    session.setAttribute("role", "Club Manager");
                    break;
                case "4":
                    session.setAttribute("role", "Student");
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
}
