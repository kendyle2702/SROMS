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
            club = new Club(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getBoolean(6), rs.getBoolean(7), rs.getInt(8));
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

    /**
     * Retrieve the semester name based on clubID
     *
     * @param clubID the ID of the club
     * @return the name of the semester associated with the club, or null if not
     * found
     */
    public String getSemesterNameByClubID(int clubID) {
        String semesterName = null;
        try {
            String sql = "SELECT s.semesterName "
                    + "FROM Club c "
                    + "INNER JOIN ClubMember cm ON c.clubID = cm.clubID "
                    + "INNER JOIN Semester s ON cm.semesterID = s.semesterID "
                    + "WHERE c.clubID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, clubID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                semesterName = rs.getString("semesterName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return semesterName;
    }

    public List<Club> getMyClubs(int userProfileID) {
        List<Club> clubList = new ArrayList<>();
        try {
            String sql = "SELECT c.* "
                    + "FROM Club c "
                    + "JOIN ClubMember cm ON c.clubID = cm.clubID "
                    + "JOIN StudentProfile sp ON cm.studentProfileID = sp.studentProfileID "
                    + "WHERE sp.userProfileID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userProfileID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club(
                        rs.getInt("clubID"),
                        rs.getString("clubName"),
                        rs.getDate("establishDate"),
                        rs.getString("description"),
                        rs.getBoolean("isApprove"),
                        rs.getBoolean("isActive"),
                        rs.getInt("managerProfileID")
                );
                clubList.add(club);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubList;
    }
}
