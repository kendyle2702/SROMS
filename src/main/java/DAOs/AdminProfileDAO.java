/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.AdminProfile;
import Models.ManagerProfile;
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
public class AdminProfileDAO {
    private Connection conn;

    public AdminProfileDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(AdminProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public AdminProfile getAdminProfileByEmail(String email) {
        AdminProfile adminProfile = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from AdminProfile as s inner join UserProfile as u on s.UserProfileID = u.UserProfileID \n"
                    + "  where LOWER(u.Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                adminProfile = new AdminProfile(rs.getInt("AdminProfileID"), rs.getString("StaffNumber"), rs.getString("AcademicLevel"), rs.getString("Degree"), rs.getString("Experience"), rs.getInt("UserProfileID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adminProfile;
    }
}
