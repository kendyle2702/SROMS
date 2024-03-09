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
    public UserProfile getUserProfileByEmail(String email){
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
}
