/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ClubDAO;
import DAOs.StudentProfileDAO;
import DAOs.UserLoginDAO;
import DAOs.UserProfileDAO;
import DAOs.UserRoleDAO;
import Models.Club;
import Models.StudentProfile;
import Models.UserLogin;
import Models.UserProfile;
import Models.UserRole;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        String roleURL = (String) session.getAttribute("roleURL");

        if (request.getParameter("editProfile") != null) {
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
                    session.setAttribute("editStatus", "fail");
                    response.sendRedirect("/" + roleURL + "/profile/edit");
                }
            }

            UserProfileDAO uProfileDAO = new UserProfileDAO();

            UserProfile newUser = new UserProfile(userProfile.getUserProfileID(), firstName, lastName, avatar, gender, birthdate, address, userProfile.getEnrollmentDate(), userProfile.getEmail(), phone);
            UserProfile user = uProfileDAO.updateUserProfile(newUser);
            if (user == null) {
                session.setAttribute("editStatus", "fail");
                response.sendRedirect("/" + roleURL + "/profile/edit");
            } else {
                session.setAttribute("editStatus", "success");
                session.setAttribute("user", user);
                response.sendRedirect("/" + roleURL + "/profile");
            }
        } else if (request.getParameter("createStudent") != null) {
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            Date enrollDate = Date.valueOf(request.getParameter("enrolldate"));
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String rollNumber = request.getParameter("rollnumber");
            String memberCode = request.getParameter("membercode");
            String major = request.getParameter("major");
            String mode = request.getParameter("mode");

            java.util.Date currentDate = new java.util.Date();
            Timestamp currentTime = new Timestamp(currentDate.getTime());

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
                    session.setAttribute("createStudent", "fail");
                    response.sendRedirect("/admin/account/student");
                }
            }
            UserProfileDAO uProfileDAO = new UserProfileDAO();
            UserProfile newUser = new UserProfile(firstName, lastName, avatar, gender, birthdate, address, enrollDate, email, phone);

            UserProfile user = uProfileDAO.addUserProfile(newUser);
            if (user == null) {
                session.setAttribute("createStudent", "fail");
                response.sendRedirect("/admin/account/student/create");
            } else {
                int id = uProfileDAO.getUserProfileIDByEmail(email);
                StudentProfileDAO stDAO = new StudentProfileDAO();
                StudentProfile newStudent = new StudentProfile(rollNumber, memberCode, major, mode, id);
                StudentProfile student = stDAO.addStudentProfile(newStudent);

                UserLoginDAO userLoginDAO = new UserLoginDAO();
                UserLogin newUserLogin = new UserLogin(email, currentTime, true, id);
                UserLogin userLogin = userLoginDAO.addUserLogin(newUserLogin);

                UserRoleDAO userRoleDAO = new UserRoleDAO();
                int studentRole = 4;
                UserRole newUserRole = new UserRole(studentRole, id);
                UserRole userRole = userRoleDAO.addUserRole(newUserRole);

                session.setAttribute("createStudent", "success");
                response.sendRedirect("/admin/account/student");
            }
        } else if (request.getParameter("signUpClub") != null) {
            ClubDAO clubDAO = new ClubDAO();
            Club club = clubDAO.getClub();

            String clubName = request.getParameter("clubname");
            String description = request.getParameter("description");
            int studentProfileID = Integer.parseInt(request.getParameter("studentProfileID"));
            Date establishDate = null;

            String logo = "";
            Part part = request.getPart("logo");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                logo = club.getLogo();
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/img/logo_club");
                    logo = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + logo);
                } catch (Exception ex) {
                    session.setAttribute("signUpClub", "fail");
//                    response.sendRedirect("/student/clubs/view");
                }
            }
            ClubDAO clubD = new ClubDAO();
            boolean signUp;
            signUp = clubD.signUpClub(logo, clubName, establishDate, description, studentProfileID);
            if (signUp) {
                session.setAttribute("signUpClub", "success");
                response.sendRedirect("/student/clubs/view");
            } else {
                session.setAttribute("signUpClub", "fail");
                response.sendRedirect("/student/clubs/view");
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
