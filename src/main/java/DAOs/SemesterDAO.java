/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.News;
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
public class SemesterDAO {
    private Connection conn;

    public SemesterDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(SemesterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int getSemesterIDBySemesterName(String sem){
        int id = 0;
        try {
            String sql = "Select * from Semester where LOWER(SemesterName) = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sem.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("SemesterID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SemesterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
}
