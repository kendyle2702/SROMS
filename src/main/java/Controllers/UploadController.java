/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.UserProfileDAO;
import Models.UserProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.sql.Date;

/**
 *
 * @author QuocCu
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxRequestSize = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10
)
public class UploadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserProfile userProfile = (UserProfile) session.getAttribute("user");
        String role = (String) session.getAttribute("role");

        if (request.getParameter("editProfile") != null) {
            String urlRole = "";

            switch (role) {
                case "Student":
                    urlRole = "student";
                    break;
                case "Club Manager":
                    urlRole = "clubmanager";
                    break;
                case "Event Manager":
                    urlRole = "eventmanager";
                    break;
                case "Admin":
                    urlRole = "admin";
                    break;
            }
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");

            String avatar = "";
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = userProfile.getAvatar();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/img/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    response.sendRedirect("/"+ urlRole +"/profile/edit");
                }
            }

            UserProfileDAO uProfileDAO = new UserProfileDAO();
            
            UserProfile newUser = new UserProfile(userProfile.getUserProfileID(),firstName,lastName,avatar,gender,birthdate,address,userProfile.getEnrollmentDate(),userProfile.getEmail(),phone);
            UserProfile user = uProfileDAO.updateUserProfile(newUser);
            if (user == null) {
                session.setAttribute("editStatus", "fail");
                response.sendRedirect("/"+ urlRole +"/profile/edit");
            } else {
                session.setAttribute("editStatus", "success");
                session.setAttribute("user", user);
                response.sendRedirect("/"+ urlRole +"/profile/edit");
            }
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        if (!contentDisposition.contains("filename=")) {
            return null;
        }
        int beginIndex = contentDisposition.indexOf("filename=") + 10;
        int endIndex = contentDisposition.length() - 1;

        return contentDisposition.substring(beginIndex, endIndex);
    }
}
