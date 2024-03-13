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
import java.sql.Statement;
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

    public int getManagerProfileIdByEmail(String email) {
        int managerProfileID = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from ManagerProfile as s inner join UserProfile as u on s.UserProfileID = u.UserProfileID \n"
                    + "  where LOWER(u.Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                managerProfileID = rs.getInt("ManagerProfileID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return managerProfileID;
    }

    public ResultSet getManagerProfileMoreByID(int id) {
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from ManagerProfile as m \n"
                    + " inner join UserProfile as u on m.UserProfileID = u.UserProfileID \n"
                    + " inner join UserLogin as ul on u.UserProfileID = ul.UserProfileID\n"
                    + " where m.ManagerProfileID = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ManagerProfile addManagerProfile(ManagerProfile managerProfile) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [ManagerProfile] values(?,?,?,?,?)");
            ps.setString(1, managerProfile.getStaffNumber());
            ps.setString(2, managerProfile.getAcademicLevel());
            ps.setString(3, managerProfile.getDegree());
            ps.setString(4, managerProfile.getExperience());
            ps.setInt(5, managerProfile.getUserProfileID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (count == 0) ? null : managerProfile;
    }

    public ResultSet getAllEventManager() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from UserProfile as u \n"
                    + "inner join ManagerProfile as m on u.UserProfileID = m.UserProfileID \n"
                    + "inner join UserLogin as us on us.UserProfileID = u.UserProfileID\n"
                    + "inner join UserRole as ur on us.UserLoginID = ur.UserLoginID\n"
                    + "where RoleID = 2");
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
     public ResultSet getAllClubManager() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from UserProfile as u \n"
                    + "inner join ManagerProfile as m on u.UserProfileID = m.UserProfileID \n"
                    + "inner join UserLogin as us on us.UserProfileID = u.UserProfileID\n"
                    + "inner join UserRole as ur on us.UserLoginID = ur.UserLoginID\n"
                    + "where RoleID = 3");
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
      public ManagerProfile updateManagerProfileByUserProfileID(ManagerProfile user,int userProfileID){
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update ManagerProfile set StaffNumber =?, AcademicLevel=?, Degree=?, Experience=? where UserProfileID =?");
            ps.setString(1, user.getStaffNumber());
            ps.setString(2, user.getAcademicLevel());
            ps.setString(3, user.getDegree());
            ps.setString(4, user.getExperience());
            ps.setInt(5, userProfileID);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : user;
    }
}
