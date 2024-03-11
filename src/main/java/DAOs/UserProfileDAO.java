/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.UserProfile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuocCu
 */
public class UserProfileDAO {

    private Connection conn;

    public UserProfileDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public UserProfile getUserProfileByEmail(String email) {
        UserProfile userProfile = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from UserProfile where LOWER(Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userProfile = new UserProfile(rs.getInt("UserProfileID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Avatar"), rs.getString("Gender"), rs.getDate("DateOfBirth"), rs.getString("Address"), rs.getDate("EnrollmentDate"), rs.getString("Email"), rs.getString("Phone"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userProfile;
    }

    public UserProfile updateUserProfile(UserProfile user) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(""
                    + "update UserProfile set FirstName =?, LastName=?, Avatar=?, Gender=?, DateOfBirth=?,"
                    + "Address=?,Phone=? where UserProfileID =?");

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAvatar());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getDateOfBirth());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getPhone());
            ps.setInt(8, user.getUserProfileID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : user;
    }

    public UserProfile addUserProfile(UserProfile user) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [UserProfile] values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAvatar());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getDateOfBirth());
            ps.setString(6, user.getAddress());
            ps.setDate(7, user.getEnrollmentDate());
            ps.setString(8,user.getEmail() );
            ps.setString(9, user.getPhone());
            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (count == 0) ? null : user;
    }
    public int getUserProfileIDByEmail(String email){
        int id = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from UserProfile where LOWER(Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("UserProfileID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (id == 0) ? null : id;
    }
    
    
    public UserProfile updateUserProfileByUserProfileID(UserProfile user,int userProfileID){
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update UserProfile set FirstName =?, LastName=?, Avatar=?, Gender=?, DateOfBirth=?,"
                    + "Address=?,EnrollmentDate = ?, Email =?, Phone=? where UserProfileID =?");
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAvatar());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getDateOfBirth());
            ps.setString(6, user.getAddress());
            ps.setDate(7, user.getEnrollmentDate());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getPhone());
            ps.setInt(10, userProfileID);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : user;
    }
    public int getUserProfileIDByStudentProfileID(int studentID){
        int id = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from StudentProfile where StudentProfileID = ?");
            ps.setInt(1, studentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("UserProfileID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (id == 0) ? null : id;
    }
}
