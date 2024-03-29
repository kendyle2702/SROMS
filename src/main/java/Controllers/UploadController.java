/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.ClubDAO;
import DAOs.ManagerProfileDAO;
import DAOs.StudentProfileDAO;
import DAOs.UserLoginDAO;
import DAOs.UserProfileDAO;
import DAOs.UserRoleDAO;
import Models.Club;
import Models.ManagerProfile;
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
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxRequestSize = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10)
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

            UserProfile newUser = new UserProfile(userProfile.getUserProfileID(), firstName, lastName, avatar, gender,
                    birthdate, address, userProfile.getEnrollmentDate(), userProfile.getEmail(), phone);
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
            
            if(birthdate.compareTo(enrollDate)>=0){
                session.setAttribute("createStudent", "failDate");
                response.sendRedirect("/admin/account/student/create");
                return;
            }
            
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
            UserProfile newUser = new UserProfile(firstName, lastName, avatar, gender, birthdate, address, enrollDate,
                    email, phone);
            
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
        } else if (request.getParameter("editStudent") != null) {
            int studentID = Integer.parseInt(request.getParameter("rsStudentID"));
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            Date enrollDate = Date.valueOf(request.getParameter("enrolldate"));
            
            if(birthdate.compareTo(enrollDate)>=0){
                session.setAttribute("editStudent", "failDate");
                response.sendRedirect("/admin/account/student/detail/" + studentID);
                return;
            }
            
            
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String rollNumber = request.getParameter("rollnumber");
            String memberCode = request.getParameter("membercode");
            String major = request.getParameter("major");
            String mode = request.getParameter("mode");
            String avatarOld = request.getParameter("avatar_old");

            String avatar = "";
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = avatarOld;
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/img/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("editStudent", "fail");
                    response.sendRedirect("/admin/account/student/detail/" + studentID);
                }
            }

            UserProfileDAO uProfileDAO = new UserProfileDAO();
            int userProfileID = uProfileDAO.getUserProfileIDByStudentProfileID(studentID);

            UserProfile newUser = new UserProfile(firstName, lastName, avatar, gender, birthdate, address, enrollDate, email, phone);

            UserProfile user = uProfileDAO.updateUserProfileByUserProfileID(newUser, userProfileID);

            if (user == null) {
                session.setAttribute("editStudent", "fail");
                response.sendRedirect("/admin/account/student/detail/" + studentID);
            } else {
                StudentProfileDAO stDAO = new StudentProfileDAO();
                StudentProfile newStudent = new StudentProfile(rollNumber, memberCode, major, mode, userProfileID);
                StudentProfile student = stDAO.updateStudentProfileByUserProfileID(newStudent, userProfileID);

                session.setAttribute("editStudent", "success");
                response.sendRedirect("/admin/account/student/detail/" + studentID);
            }
        } else if (request.getParameter("createEventManager") != null) {
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            Date enrollDate = Date.valueOf(request.getParameter("enrollmentdate"));
            
            if(birthdate.compareTo(enrollDate)>=0){
                session.setAttribute("creatEventManager", "failDate");
                response.sendRedirect("/admin/account/eventmanager/create");
                return;
            }
            
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String staffnumber = request.getParameter("staffnumber");
            String academiclevel = request.getParameter("academiclevel");
            String degree = request.getParameter("degree");
            String exprience = request.getParameter("exprience");

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
                    session.setAttribute("creatEventManager", "fail");
                    response.sendRedirect("/admin/account/eventmanager");
                }
            }
            UserProfileDAO uProfileDAO = new UserProfileDAO();
            UserProfile newUser = new UserProfile(firstName, lastName, avatar, gender, birthdate, address, enrollDate, email, phone);

            UserProfile user = uProfileDAO.addUserProfile(newUser);
            if (user == null) {
                session.setAttribute("createEventManager", "fail");
                response.sendRedirect("/admin/account/eventmanager/create");
            } else {
                int id = uProfileDAO.getUserProfileIDByEmail(email);
                ManagerProfileDAO eDAO = new ManagerProfileDAO();
                ManagerProfile newEventM = new ManagerProfile(staffnumber, academiclevel, degree, exprience, id);
                ManagerProfile eventmanager = eDAO.addManagerProfile(newEventM);

                UserLoginDAO userLoginDAO = new UserLoginDAO();
                UserLogin newUserLogin = new UserLogin(email, currentTime, true, id);
                UserLogin userLogin = userLoginDAO.addUserLogin(newUserLogin);

                UserRoleDAO userRoleDAO = new UserRoleDAO();
                int eventManagerRole = 2;
                UserRole newUserRole = new UserRole(eventManagerRole, id);
                UserRole userRole = userRoleDAO.addUserRole(newUserRole);

                session.setAttribute("createEventManager", "success");
                response.sendRedirect("/admin/account/eventmanager");
            }
        } else if (request.getParameter("editEventManager") != null) {

            int managerID = Integer.parseInt(request.getParameter("rsEventManagerID"));
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            Date enrollDate = Date.valueOf(request.getParameter("enrollmentdate"));
            
            if(birthdate.compareTo(enrollDate)>=0){
                session.setAttribute("editEventManager", "failDate");
                response.sendRedirect("/admin/account/eventmanager/detail/" + managerID);
                return;
            }
            
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String staffnumber = request.getParameter("staffnumber");
            String academiclevel = request.getParameter("academiclevel");
            String degree = request.getParameter("degree");
            String experience = request.getParameter("experience");
            String avatarOld = request.getParameter("avatar_old");

            String avatar = "";
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = avatarOld;
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/img/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("editEventManager", "fail");
                    response.sendRedirect("/admin/account/eventmanager/detail/" + managerID);
                }
            }

            UserProfileDAO uProfileDAO = new UserProfileDAO();
            int userProfileID = uProfileDAO.getUserProfileIDByManagerProfileID(managerID);

            UserProfile newUser = new UserProfile(firstName, lastName, avatar, gender, birthdate, address, enrollDate, email, phone);

            UserProfile user = uProfileDAO.updateUserProfileByUserProfileID(newUser, userProfileID);

            if (user == null) {
                session.setAttribute("editEventManager", "fail");
                response.sendRedirect("/admin/account/eventmanager/detail/" + managerID);
            } else {
                ManagerProfileDAO mDAO = new ManagerProfileDAO();
                ManagerProfile newManager = new ManagerProfile(staffnumber, academiclevel, degree, experience, userProfileID);
                ManagerProfile manager = mDAO.updateManagerProfileByUserProfileID(newManager, userProfileID);

                session.setAttribute("editEventManager", "success");
                response.sendRedirect("/admin/account/eventmanager/detail/" + managerID);
            }
        } else if (request.getParameter("createClubManager") != null) {
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            Date enrollDate = Date.valueOf(request.getParameter("enrollmentdate"));
            
            if(birthdate.compareTo(enrollDate)>=0){
                session.setAttribute("createClubManager", "failDate");
                response.sendRedirect("/admin/account/clubmanager/create");
                return;
            }
            
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String staffnumber = request.getParameter("staffnumber");
            String academiclevel = request.getParameter("academiclevel");
            String degree = request.getParameter("degree");
            String exprience = request.getParameter("exprience");

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
                    session.setAttribute("createClubManager", "fail");
                    response.sendRedirect("/admin/account/clubmanager");
                }
            }
            UserProfileDAO uProfileDAO = new UserProfileDAO();
            UserProfile newUser = new UserProfile(firstName, lastName, avatar, gender, birthdate, address, enrollDate, email, phone);

            UserProfile user = uProfileDAO.addUserProfile(newUser);
            if (user == null) {
                session.setAttribute("createClubManager", "fail");
                response.sendRedirect("/admin/account/clubmanager/create");
            } else {
                int id = uProfileDAO.getUserProfileIDByEmail(email);
                ManagerProfileDAO eDAO = new ManagerProfileDAO();
                ManagerProfile newEventM = new ManagerProfile(staffnumber, academiclevel, degree, exprience, id);
                ManagerProfile clubmanager = eDAO.addManagerProfile(newEventM);

                UserLoginDAO userLoginDAO = new UserLoginDAO();
                UserLogin newUserLogin = new UserLogin(email, currentTime, true, id);
                UserLogin userLogin = userLoginDAO.addUserLogin(newUserLogin);

                UserRoleDAO userRoleDAO = new UserRoleDAO();
                int clubManagerRole = 3;
                UserRole newUserRole = new UserRole(clubManagerRole, id);
                UserRole userRole = userRoleDAO.addUserRole(newUserRole);

                session.setAttribute("createClubManager", "success");
                response.sendRedirect("/admin/account/clubmanager");
            }
        } else if (request.getParameter("editClubManager") != null) {

            int managerID = Integer.parseInt(request.getParameter("rsClubManagerID"));
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String gender = request.getParameter("gender");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            Date enrollDate = Date.valueOf(request.getParameter("enrollmentdate"));
            
            if(birthdate.compareTo(enrollDate)>=0){
                session.setAttribute("editClubManager", "failDate");
                response.sendRedirect("/admin/account/clubmanager/detail/" + managerID);
                return;
            }
            
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String staffnumber = request.getParameter("staffnumber");
            String academiclevel = request.getParameter("academiclevel");
            String degree = request.getParameter("degree");
            String experience = request.getParameter("experience");
            String avatarOld = request.getParameter("avatar_old");

            String avatar = "";
            Part part = request.getPart("avatar");
            if (Paths.get(part.getSubmittedFileName()).toString().isEmpty()) {
                avatar = avatarOld;
            } else {
                try {
                    String realPath = request.getServletContext().getRealPath("/assets/img/avatar");
                    avatar = Paths.get(part.getSubmittedFileName()).toString();
                    part.write(realPath + "/" + avatar);
                } catch (Exception ex) {
                    session.setAttribute("editClubManager", "fail");
                    response.sendRedirect("/admin/account/clubmanager/detail/" + managerID);
                }
            }

            UserProfileDAO uProfileDAO = new UserProfileDAO();
            int userProfileID = uProfileDAO.getUserProfileIDByManagerProfileID(managerID);

            UserProfile newUser = new UserProfile(firstName, lastName, avatar, gender, birthdate, address, enrollDate, email, phone);

            UserProfile user = uProfileDAO.updateUserProfileByUserProfileID(newUser, userProfileID);

            if (user == null) {
                session.setAttribute("editClubManager", "fail");
                response.sendRedirect("/admin/account/clubmanager/detail/" + managerID);
            } else {
                ManagerProfileDAO mDAO = new ManagerProfileDAO();
                ManagerProfile newManager = new ManagerProfile(staffnumber, academiclevel, degree, experience, userProfileID);
                ManagerProfile manager = mDAO.updateManagerProfileByUserProfileID(newManager, userProfileID);

                session.setAttribute("editClubManager", "success");
                response.sendRedirect("/admin/account/clubmanager/detail/" + managerID);
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
                    // response.sendRedirect("/student/clubs/view");
                }
            }
            ClubDAO clubD = new ClubDAO();
            boolean signUp;
            try {
                signUp = clubD.signUpClub(logo, clubName, establishDate, description, studentProfileID);

                if (signUp) {
                    session.setAttribute("signUpClub", "success");
                    response.sendRedirect("/student/clubs/view");
                } else {
                    session.setAttribute("signUpClub", "fail");
                    response.sendRedirect("/student/clubs/view");
                }
            } catch (SQLException ex) {
                Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);

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
