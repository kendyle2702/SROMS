
package DAOs;

import DB.DBConnection;
import Models.Club;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ClubDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Club> listClub() throws SQLException {
        List<Club> listC = new ArrayList<>();
        Club club = null;
        conn = DBConnection.connect();
        String ex = "select* from Club";
        ps = conn.prepareStatement(ex);
        rs = ps.executeQuery();
        while (rs.next()) {
            club = new Club(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getBoolean(5), rs.getBoolean(6), rs.getInt(7));
            listC.add(club);
        }
        return listC;
    }

    public int getTotalClub() throws SQLException {
        conn = DBConnection.connect();
        String ex = "select COUNT(*) as TotalClub from Club;";
        ps = conn.prepareStatement(ex);
        rs = ps.executeQuery();
        int totalClub = 0;
        if (rs.next()) {
            totalClub = rs.getInt("TotalClub");
        }
        return totalClub;
    }

    public void delete(int clubID) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE Club SET IsActive = 0 Where ClubID = ?");
            ps.setInt(1, clubID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
//    public int getNumberOfMember(){
//        conn = DBConnection.connect();
//        String query = 
//    }
}
