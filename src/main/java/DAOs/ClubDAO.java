package DAOs;

import Models.ClubMember;
import Models.Club;
import Models.UserProfile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClubDAO {

    private Connection conn;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ClubDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Club getClub(int id) throws SQLException {
        Club club = null;
        String query = "SELECT * \n"
                + "FROM [SROMS].[dbo].[Club] WHERE ClubID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        if (rs.next()) {
            club = new Club(rs.getInt("ClubID"), rs.getString("Logo"), rs.getString("ClubName"), rs.getDate("EstablishDate"), rs.getString("Description"), rs.getBoolean("IsApprove"), rs.getBoolean("IsActive"), rs.getInt("StudentProfileID"));
        }
        return club;
    }

    public Club getClubByLatestEstablishDate() {
        Club club = null;
        try {
            String sql = "SELECT TOP 1 * FROM Club ORDER BY EstablishDate DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                club = new Club(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getInt(8),
                        rs.getInt(9)
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return club;
    }

    public List<Club> getAllClubs() throws SQLException {
        List<Club> clubsList = new ArrayList<>();
        Club club = null;
        String sql = "SELECT * FROM Club";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            club = new Club(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDate(4),
                    rs.getString(5),
                    rs.getBoolean(6),
                    rs.getBoolean(7),
                    rs.getInt(8),
                    rs.getInt(9)
            );
            clubsList.add(club);
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
            club = new Club(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDate(4),
                    rs.getString(5),
                    rs.getBoolean(6),
                    rs.getBoolean(7),
                    rs.getInt(8),
                    rs.getInt(9));
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

    public String getSemesterNameByClubID(int clubID, int studentProfileID) {
        String semesterName = null;
        try {
            String sql = "SELECT s.SemesterName\n"
                    + "FROM ClubMember cm\n"
                    + "JOIN Semester s ON cm.SemesterID = s.SemesterID\n"
                    + "WHERE cm.ClubID = ? AND cm.StudentProfileID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, clubID);
            ps.setInt(2, studentProfileID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                semesterName = rs.getString("SemesterName"); // Đã sửa thành "SemesterName"
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return semesterName;
    }

    public List<ClubMember> getClubMemberByStudentProfileID(int studentProfileID) {
        List<ClubMember> clubs = new ArrayList<>();
        ClubMember club = null;
        try {
            String sql = "SELECT CM.*\n"
                    + "FROM [SROMS].[dbo].[ClubMember] CM\n"
                    + "JOIN [SROMS].[dbo].[Club] C ON CM.ClubID = C.ClubID\n"
                    + "WHERE CM.StudentProfileID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentProfileID);
            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    club = new ClubMember(
                            rs.getInt("ClubID"),
                            rs.getInt("SemesterID"),
                            rs.getString("ClubRole"),
                            rs.getInt("ClubPoint"),
                            rs.getString("Report"),
                            rs.getInt("StudentProfileID")
                    );
                    clubs.add(club);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);  // Or handle the exception as you prefer
        }
        return clubs;
    }

    public Club getClubByClubID(int clubID) throws SQLException {
        Club club = null;
        String sql = "SELECT * FROM [SROMS].[dbo].[Club] WHERE ClubID = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, clubID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            club = new Club(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDate(4),
                    rs.getString(5),
                    rs.getBoolean(6),
                    rs.getBoolean(7),
                    rs.getInt(8),
                    rs.getInt(9)
            );
        }
        return club;
    }

    public boolean registerStudentToClub(ClubMember clubMember) throws SQLException {
        String checkQuery = "SELECT COUNT(*) FROM [SROMS].[dbo].[ClubMember] WHERE [ClubID] = ? AND [StudentProfileID] = ?";
        PreparedStatement checkPs = conn.prepareStatement(checkQuery);
        checkPs.setInt(1, clubMember.getClubID());
        checkPs.setInt(2, clubMember.getStudentProfileID());

        rs = checkPs.executeQuery();
        if (rs.next()) {
            if (rs.getInt(1) > 0) {
                // Sinh viên đã tồn tại trong sự kiện
                return false; // Trả về false nếu sinh viên đã tham gia
            }
        }

        String sql = "INSERT INTO [SROMS].[dbo].[ClubMember] (ClubID, SemesterID, ClubRole, ClubPoint, Report, StudentProfileID) VALUES (?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, clubMember.getClubID());
        ps.setInt(2, clubMember.getSemesterID());
        ps.setString(3, clubMember.getClubRole());
        ps.setInt(4, clubMember.getClubPoint());
        ps.setString(5, clubMember.getReport());
        ps.setInt(6, clubMember.getStudentProfileID());
        ps.executeUpdate();
        return true;
    }
}
