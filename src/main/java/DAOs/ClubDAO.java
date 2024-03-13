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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClubDAO {

    private Connection conn;
    private PreparedStatement ps = null;

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
                            rs.getInt("StudentProfileID"),
                            rs.getInt("ClubID"),
                            rs.getInt("SemesterID"),
                            rs.getString("ClubRole"),
                            rs.getInt("ClubPoint"),
                            rs.getString("Report")
                    );
                    clubs.add(club);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);  // Or handle the exception as you prefer
        }
        return clubs;
    }

    public List<Club> getMyClub(int sudentProfileID) throws SQLException {
        List<Club> listMyClub = new ArrayList<>();
        Club myClub = null;
        String sql = "SELECT* FROM [Club] WHERE StudentProfileID = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, sudentProfileID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            myClub = new Club(rs.getInt("ClubID"), rs.getString("Logo"), rs.getString("ClubName"), rs.getDate("EstablishDate"), rs.getString("Description"), rs.getBoolean("IsApprove"), rs.getBoolean("IsActive"), rs.getInt("ManagerProfileID"), rs.getInt("StudentProfileID"));
            listMyClub.add(myClub);
        }
        return listMyClub;
    }

    public List<Map<String, String>> getAllMembersClub(int studentProfileId, int clubId) throws SQLException {
        ResultSet rs = null;
        List<Map<String, String>> getListMember = new ArrayList<>();
        String sql = "SELECT ClubRole, RollNumber, Major, FirstName, LastName, Email, ClubRole FROM [SROMS].[dbo].[ClubMember] \n"
                + "LEFT JOIN [SROMS].[dbo].[Club] ON ClubMember.ClubID = Club.ClubID \n"
                + "LEFT JOIN StudentProfile ON ClubMember.StudentProfileID = StudentProfile.StudentProfileID \n"
                + "LEFT JOIN UserProfile ON StudentProfile.UserProfileID = UserProfile.UserProfileID \n"
                + "WHERE Club.StudentProfileID = ? AND Club.ClubID = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, studentProfileId);
        ps.setInt(2, clubId);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, String> getMember = new HashMap<>(); // Tạo một map mới cho mỗi hàng dữ liệu
            getMember.put("ClubRole", rs.getString("ClubRole"));
            getMember.put("RollNumber", rs.getString("RollNumber"));
            getMember.put("Major", rs.getString("Major"));
            getMember.put("FirstName", rs.getString("FirstName"));
            getMember.put("LastName", rs.getString("LastName"));
            getMember.put("Email", rs.getString("Email"));
            getMember.put("ClubRole", rs.getString("ClubRole"));
            getListMember.add(getMember);
        }
        return getListMember;
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

    public void registerStudentToClub(ClubMember clubMember) throws SQLException {
        String sql = "INSERT INTO [SROMS].[dbo].[ClubMember] (StudentProfileID, ClubID, SemesterID, ClubRole, ClubPoint, Report) VALUES (?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, clubMember.getStudentProfileID());
        ps.setInt(2, clubMember.getClubID());
        ps.setInt(3, clubMember.getSemesterID());
        ps.setString(4, clubMember.getClubRole());
        ps.setInt(5, clubMember.getClubPoint());
        ps.setString(6, clubMember.getReport());
        ps.executeUpdate();
    }
}
