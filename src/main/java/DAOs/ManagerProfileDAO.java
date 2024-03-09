/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.ManagerProfile;
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
public class ManagerProfileDAO {
    private Connection conn;

    public ManagerProfileDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ManagerProfile getManagerProfileByEmail(String email) {
        ManagerProfile managerProfile = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from ManagerProfile as s inner join UserProfile as u on s.UserProfileID = u.UserProfileID \n"
                    + "  where LOWER(u.Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                managerProfile = new ManagerProfile(rs.getInt("ManagerProfileID"), rs.getString("StaffNumber"), rs.getString("AcademicLevel"), rs.getString("Degree"), rs.getString("Experience"), rs.getInt("UserProfileID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return managerProfile;
    }
}
