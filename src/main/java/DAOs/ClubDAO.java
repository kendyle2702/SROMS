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

    private Connection conn;

    public ClubDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Club getClubByLatestEstablishDate() {
        Club club = null;
        try {
            String sql = "SELECT TOP 1 * FROM Club ORDER BY EstablishDate DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                club = new Club(
                        rs.getInt("ClubID"),
                        rs.getString("ClubName"),
                        rs.getDate("EstablishDate"),
                        rs.getString("Description"),
                        rs.getBoolean("IsApprove"),
                        rs.getBoolean("IsActive"),
                        rs.getInt("ManagerProfileID")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return club;
    }

    public List<Club> getAllClubs() {
        List<Club> clubsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Club";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club(
                        rs.getInt("ClubID"),
                        rs.getString("ClubName"),
                        rs.getDate("EstablishDate"),
                        rs.getString("Description"),
                        rs.getBoolean("IsApprove"),
                        rs.getBoolean("IsActive"),
                        rs.getInt("ManagerProfileID")
                );
                clubsList.add(club);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubsList;
    }

    public List<Club> listClub() throws SQLException {
        List<Club> listC = new ArrayList<>();
        Club club = null;
        String ex = "select * from Club";
        PreparedStatement ps = conn.prepareStatement(ex);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            club = new Club(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getBoolean(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9));
            listC.add(club);
        }
        return listC;
    }

    public int getTotalClub() throws SQLException {
        String ex = "select COUNT(*) as TotalClub from Club;";
        PreparedStatement ps = conn.prepareStatement(ex);
        ResultSet rs = ps.executeQuery();
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

    public String getFullName(int clubID, int studentProfileID) throws SQLException {
        String fullName = null;
        ResultSet rs = null;
        PreparedStatement ps = conn.prepareStatement("SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM [Club] LEFT JOIN StudentProfile ON Club.ClubID = StudentProfile.StudentProfileID \n"
                + "LEFT JOIN UserProfile ON StudentProfile.UserProfileID = UserProfile.UserProfileID WHERE ClubID = ? AND StudentProfile.StudentProfileID = ?;");
        ps.setInt(1, clubID);
        ps.setInt(2, studentProfileID);
        rs = ps.executeQuery();
        if (rs.next()) {
            fullName = rs.getString("FullName");
        }
        return fullName;
    }

    public int checkRequestCreate(int IsApprove, int clubID) throws SQLException {
        int count = 0;
        PreparedStatement ps = conn.prepareStatement("UPDATE [Club] SET IsApprove = ? where ClubID = ?;");
        ps.setInt(1, IsApprove);
        ps.setInt(2, clubID);
        count = ps.executeUpdate();
        return count;
    }

    public List<Club> listCheckRequest() throws SQLException {
        List<Club> listC = new ArrayList<>();
        Club club = null;
        String ex = "SELECT * FROM [Club] WHERE IsApprove IS NULL;";
        PreparedStatement ps = conn.prepareStatement(ex);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            club = new Club(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getBoolean(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9));
            listC.add(club);
        }
        return listC;
    }
}
