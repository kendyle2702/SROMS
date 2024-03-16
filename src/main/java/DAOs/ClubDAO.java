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

    public Club getClub(int id) throws SQLException {
        Club club = null;
        String query = "SELECT * FROM [SROMS].[dbo].[Club] WHERE ClubID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            club = new Club(rs.getInt("ClubID"), rs.getString("Logo"), rs.getString("ClubName"),
                    rs.getDate("EstablishDate"), rs.getString("Description"), rs.getBoolean("IsApprove"),
                    rs.getBoolean("IsActive"), rs.getInt("StudentProfileID"));
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
                        rs.getInt(9));
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
                    rs.getInt(9));
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

    public Club getClub() {
        String sql = "select * from Club";
        Club club = null;
        try {
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                club = new Club(rs.getInt("ClubID"), rs.getString("Logo"), rs.getString("ClubName"),
                        rs.getDate("EstablishDate"),
                        rs.getString("Description"), rs.getBoolean("IsApprove"), rs.getBoolean("IsAvitve"),
                        rs.getInt("StudentProfileID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return club;
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
        PreparedStatement ps = conn.prepareStatement(
                "SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM [Club] LEFT JOIN StudentProfile ON Club.ClubID = StudentProfile.StudentProfileID \n"
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
            club = new Club(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5),
                    rs.getBoolean(6), rs.getBoolean(7), rs.getInt(8), rs.getInt(9));
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
                            rs.getInt("StudentProfileID"));
                    clubs.add(club);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex); // Or handle the exception as you
            // prefer
        }
        return clubs;
    }

    public List<Club> getMyClub(int sudentProfileID) throws SQLException {
        List<Club> listMyClub = new ArrayList<>();
        Club myClub = null;
        String sql = "SELECT* FROM [SROMS].[dbo].[Club] as c inner join [SROMS].[dbo].[ClubMember] as cm  on c.ClubID = cm.ClubID WHERE cm.StudentProfileID = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, sudentProfileID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            myClub = new Club(rs.getInt("ClubID"), rs.getString("Logo"), rs.getString("ClubName"),
                    rs.getDate("EstablishDate"), rs.getString("Description"), rs.getBoolean("IsApprove"),
                    rs.getBoolean("IsActive"), rs.getInt("ManagerProfileID"), rs.getInt("StudentProfileID"));
            listMyClub.add(myClub);
        }
        return listMyClub;
    }

    public List<Map<String, String>> getAllMembersClub(int studentProfileId, int clubId) throws SQLException {
        ResultSet rs = null;
        List<Map<String, String>> getListMember = new ArrayList<>();
        String sql = "SELECT ClubRole, RollNumber, Major, FirstName, LastName, Email, ClubRole, StudentProfile.StudentProfileID FROM [SROMS].[dbo].[ClubMember]\n"
                + " LEFT JOIN [SROMS].[dbo].[Club] ON ClubMember.ClubID = Club.ClubID\n"
                + " LEFT JOIN StudentProfile ON ClubMember.StudentProfileID = StudentProfile.StudentProfileID \n"
                + " LEFT JOIN UserProfile ON StudentProfile.UserProfileID = UserProfile.UserProfileID \n"
                + " WHERE Club.StudentProfileID = ? AND Club.ClubID = ? AND SemesterID = (SELECT MAX(SemesterID) FROM [SROMS].[dbo].[ClubMember]);";
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
            getMember.put("StudentProfileID", rs.getString("StudentProfileID"));
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
                    rs.getInt(9));
        }
        return club;
    }

    public boolean registerStudentToClub(ClubMember clubMember) throws SQLException {
        String checkQuery = "SELECT COUNT(*) FROM [SROMS].[dbo].[ClubMember] WHERE [ClubID] = ? AND [StudentProfileID] = ?";
        PreparedStatement checkPs = conn.prepareStatement(checkQuery);
        checkPs.setInt(1, clubMember.getClubID());
        checkPs.setInt(2, clubMember.getStudentProfileID());

        ResultSet rs = checkPs.executeQuery();
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

    public boolean signUpClub(String logo, String clubName, Date establishDate, String description,
            int studentProfileID) throws SQLException {
        String query = "INSERT INTO [SROMS].[dbo].[Club]\n"
                + "(Lego, ClubName, EstablishDate, Description, StudentProfileID)\n"
                + "VALUES(?, ?, ?, ?, ?);";
        ps = conn.prepareStatement(query);
        ps.setString(1, logo);
        ps.setString(2, clubName);
        ps.setDate(3, establishDate);
        ps.setString(4, description);
        ps.setInt(5, studentProfileID);
        ps.executeUpdate();
        return true;
    }

    public String getClubRoll(int studentProfileID) throws SQLException {
        String clubRole = null;
        String query = "SELECT ClubRole FROM ClubMember LEFT JOIN StudentProfile ON ClubMember.StudentProfileID = StudentProfile.StudentProfileID WHERE StudentProfile.StudentProfileID = ? AND SemesterID = (SELECT MAX(SemesterID) FROM [SROMS].[dbo].[ClubMember]);";
        ps = conn.prepareStatement(query);
        ps.setInt(1, studentProfileID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            clubRole = rs.getString("ClubRole");
        }
        return clubRole;
    }

    public List<Map<String, String>> getListEventMyclub(int clubID, int studentProfileID) throws SQLException {
        List<Map<String, String>> listEventMyClub = new ArrayList<>();
        String query = "SELECT EventName,Event.EventID,PreparationTime,HoldTime,Location,Organization,Event.Description,EndTime FROM Event LEFT JOIN ParticipationEventDetail ON Event.EventID = ParticipationEventDetail.EventID LEFT JOIN Club ON ParticipationEventDetail.StudentProfileID = Club.StudentProfileID\n"
                + "LEFT JOIN ClubMember ON Club.ClubID = ClubMember.ClubID WHERE ClubMember.ClubID = ? AND ClubMember.StudentProfileID = ? AND ClubMember.SemesterID = (SELECT MAX(SemesterID) FROM [SROMS].[dbo].[ClubMember]);";
        ps = conn.prepareStatement(query);
        ps.setInt(1, clubID);
        ps.setInt(2, studentProfileID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, String> eventMyClub = new HashMap<>();
            eventMyClub.put("EventName", rs.getString("EventName"));
            eventMyClub.put("EventID", rs.getString("EventID"));
            eventMyClub.put("PreparationTime", rs.getString("PreparationTime"));
            eventMyClub.put("HoldTime", rs.getString("HoldTime"));
            eventMyClub.put("Location", rs.getString("Location"));
            eventMyClub.put("Organization", rs.getString("Organization"));
            eventMyClub.put("Description", rs.getString("Description"));
            eventMyClub.put("EndTime", rs.getString("EndTime"));
            listEventMyClub.add(eventMyClub);
        }
        return listEventMyClub;
    }

    public int getMyClubId(int studentProfileId) throws SQLException {
        int myClubId = 0;
        String query = "SELECT [ClubID] FROM [ClubMember]  WHERE StudentProfileID = ? AND SemesterID = (SELECT MAX(SemesterID) FROM [SROMS].[dbo].[ClubMember]);";
        ps = conn.prepareStatement(query);
        ps.setInt(1, studentProfileId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            myClubId = rs.getInt("ClubID");
        }
        return myClubId;
    }

    public int updateRoleMember(String roleMember, int studdentProfileID, int clubID) throws SQLException {
        int check = 0;
        String query = "DELETE [ClubMember] WHERE StudentProfileID = ? AND ClubID= ? AND SemesterID = (SELECT MAX(SemesterID) FROM [SROMS].[dbo].[ClubMember]);";
        ps = conn.prepareStatement(query);
        ps.setInt(1, studdentProfileID);
        ps.setInt(2, clubID);
        check = ps.executeUpdate();
        return check;
    }

    public int deleteClubMember(int studentProfileID, int clubID) throws SQLException {
        int check = 0;
        String query = "UPDATE [ClubMember] SET ClubRole = null WHERE StudentProfileID = ? AND ClubID = ?;";
        ps = conn.prepareStatement(query);
        ps.setInt(1, studentProfileID);
        ps.setInt(2, clubID);
        check = ps.executeUpdate();
        return check;
    }

    public int getClubsScoreByStudentIDAndSemesterID(int studentID, int semesterID) {
        int score = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "select StudentProfileID, sum(ClubPoint) as Total from ClubMember where SemesterID = ? group by StudentProfileID\n"
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
            PreparedStatement ps = conn.prepareStatement(
                    "select StudentProfileID, count(ClubPoint) as Count from ClubMember where SemesterID = ? group by StudentProfileID\n"
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
            PreparedStatement ps = conn
                    .prepareStatement("select * from ClubMember where ClubID = ? and SemesterID = ?");
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
