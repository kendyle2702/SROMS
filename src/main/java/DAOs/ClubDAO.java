package DAOs;

import Models.ClubMember;
import Models.Club;
import Models.UserProfile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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

    public int getClubsScoreByStudentIDAndSemesterID(int studentID, int semesterID) {
        int score = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select StudentProfileID, sum(ClubPoint) as Total from ClubMember where SemesterID = ? group by StudentProfileID\n"
                    + "  having StudentProfileID = ?");
            ps.setInt(1, semesterID);
            ps.setInt(2, studentID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                score = rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return score;
    }

    public int countClubsByStudentIDAndSemesterID(int studentID, int semesterID) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select StudentProfileID, count(ClubPoint) as Count from ClubMember where SemesterID = ? group by StudentProfileID\n"
                    + "  having StudentProfileID = ?");
            ps.setInt(1, semesterID);
            ps.setInt(2, studentID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("Count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public ResultSet getAllCLubReturnResultSet() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from Club");
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public ArrayList<Integer> getAllStudentInClub(int clubID, int semesterID) {
        ArrayList<Integer> listStudent = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("select * from ClubMember where ClubID = ? and SemesterID = ?");
            ps.setInt(1, clubID);
            ps.setInt(2, semesterID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int studentID = rs.getInt("StudentProfileID");
                listStudent.add(studentID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listStudent;
    }
}
