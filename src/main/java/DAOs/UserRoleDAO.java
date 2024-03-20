/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.UserRole;
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
public class UserRoleDAO {
    private Connection conn;

    public UserRoleDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(UserRoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public UserRole addUserRole(UserRole userrole){
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [UserRole] values(?,?)");
            ps.setInt(1, userrole.getRoleID());
            ps.setInt(2, userrole.getUserLoginID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserRoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (count == 0) ? null : userrole;
    }
    public int countStudent(){
        int count = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(UserLoginID) as Count from UserRole where RoleID = 4");
            while(rs.next()){
              count = rs.getInt("Count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    public int countAdmin(){
        int count = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(UserLoginID) as Count from UserRole where RoleID = 1");
            while(rs.next()){
              count = rs.getInt("Count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    public int countEventManager(){
        int count = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(UserLoginID) as Count from UserRole where RoleID = 2");
            while(rs.next()){
              count = rs.getInt("Count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    public int countClubManager(){
        int count = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select count(UserLoginID) as Count from UserRole where RoleID = 3");
            while(rs.next()){
              count = rs.getInt("Count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
