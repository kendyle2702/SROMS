/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.StudentProfile;
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
public class StudentProfileDAO {
    private Connection conn;

    public StudentProfileDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public StudentProfile getStudentProfileByEmail(String email){
        StudentProfile studentProfile = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from StudentProfile as s inner join UserProfile as u on s.UserProfileID = u.UserProfileID where LOWER(u.Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                studentProfile = new StudentProfile(rs.getInt("StudentProfileID"),rs.getString("RollNumber"),rs.getString("MemberCode"),rs.getString("Major"),rs.getString("Mode"),rs.getInt("UserProfileID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentProfile;
    }
}
