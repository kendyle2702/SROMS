/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.StudentProfile;
import Models.UserLogin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuocCu
 */
public class StudentProfileDAO {

    private Connection conn;

    public StudentProfileDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getStudentProfileMoreByID(int id) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("  select * from StudentProfile as s \n"
                    + "  inner join UserProfile as u on s.UserProfileID = u.UserProfileID \n"
                    + "  inner join UserLogin as ul on u.UserProfileID = ul.UserProfileID\n"
                    + "  where s.StudentProfileID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public StudentProfile getStudentProfileByEmail(String email) {
        StudentProfile studentProfile = null;
        try {
            PreparedStatement ps = conn.prepareStatement("  select * from StudentProfile as s \n"
                    + "  inner join UserProfile as u on s.UserProfileID = u.UserProfileID \n"
                    + "  inner join UserLogin as ul on u.UserProfileID = ul.UserProfileID\n"
                    + "  where LOWER(u.Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                studentProfile = new StudentProfile(rs.getInt("StudentProfileID"), rs.getString("RollNumber"), rs.getString("MemberCode"), rs.getString("Major"), rs.getString("Mode"), rs.getInt("UserProfileID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentProfile;
    }

    public ResultSet getAllStudents() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from UserProfile as u inner join StudentProfile as s on u.UserProfileID = s.UserProfileID inner join UserLogin as us on us.UserProfileID = u.UserProfileID");
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public StudentProfile addStudentProfile(StudentProfile studentProfile) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [StudentProfile] values(?,?,?,?,?)");
            ps.setString(1, studentProfile.getRollNumber());
            ps.setString(2, studentProfile.getMemberCode());
            ps.setString(3, studentProfile.getMajor());
            ps.setString(4, studentProfile.getMode());
            ps.setInt(5, studentProfile.getUserProfileID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (count == 0) ? null : studentProfile;
    }
}
