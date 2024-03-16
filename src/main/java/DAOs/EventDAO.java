package DAOs;

import DB.DBConnection;
import Models.Event;
import Models.ParticipationEventDetail;
import Models.PrizeStructure;
import Models.StudentProfile;
import Models.UserProfile;
import java.sql.Connection;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class EventDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public EventDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Event> eventList() throws SQLException {
        ArrayList<Event> listE = new ArrayList<>();
        Event event = null;

        // Establish database connection
        String query = "SELECT * FROM Event"; // SQL query to retrieve events
        ps = conn.prepareStatement(query); // Prepare SQL statement
        rs = ps.executeQuery(); // Execute query and obtain result set
        while (rs.next()) { // Iterate over the result set
            // Create Event object using data from the result set and add it to the list
            event = new Event(
                    rs.getInt(1), rs.getString(2), rs.getTimestamp(3), rs.getTimestamp(4), rs.getString(5),
                    rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                    rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getInt(15), rs.getInt(16), rs.getTimestamp(17)
            );
            listE.add(event);
        }
        return listE; // Return the list of events
    }

    public String eventCatelogyName(int eventCatelogyID) throws SQLException {
        // Establish database connection
        String eventCatelogyName = null;
        String query = "SELECT EventCategoryName FROM [EventCategory]  WHERE EventCategoryID = ?"; // SQL query to retrieve events
        ps = conn.prepareStatement(query); // Prepare SQL statement
        rs = ps.executeQuery(); // Execute query and obtain result set
        if (rs.next()) {
            eventCatelogyName = rs.getString("EventCategoryName");
        }
        return eventCatelogyName;
    }

    /**
     *
     * @return @throws SQLException
     */
    public List participateEventList() throws SQLException {
        ArrayList partiList = new ArrayList<>();
        ParticipationEventDetail parti = null;
        StudentProfile student = null;
        UserProfile profile = null;
        Event event = null;
        conn = DBConnection.connect();
        String query = "SELECT* FROM [dbo].[ParticipationEventDetail]\n"
                + "LEFT JOIN [dbo].[StudentProfile] ON ParticipationEventDetail.StudentProfileID = StudentProfile.StudentProfileID \n"
                + "LEFT JOIN [dbo].[UserProfile] ON StudentProfile.UserProfileID = UserProfile.UserProfileID\n"
                + "LEFT JOIN [dbo].[Event] ON ParticipationEventDetail.EventID = [dbo].[Event].EventID;";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            parti = new ParticipationEventDetail(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4), rs.getString(5));
            profile = new UserProfile(rs.getString("FirstName"), rs.getString("LastName"));
            student = new StudentProfile(rs.getString("RollNumber"), rs.getString("Major"));
            event = new Event(rs.getString("EventName"));
            partiList.add(parti);
            partiList.add(profile);
            partiList.add(student);
            partiList.add(event);
        }
        return partiList;
    }

    public int getTotalEventTaking() throws SQLException {
        int count = 0;
        String query = "SELECT COUNT(*) AS total_events FROM Event  WHERE EndTime >= CURRENT_TIMESTAMP AND Approve ='AA'";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt("total_events");
        }
        return count;

    }

    public int getTotalEventTook() throws SQLException {
        int count = 0;
        String query = "SELECT COUNT(*) AS total_events FROM Event  WHERE EndTime < CURRENT_TIMESTAMP AND Approve ='AA'";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt("total_events");
        }
        return count;
    }

    public long getTotalCost() throws SQLException {
        long count = 0;
        String query = "SELECT SUM(Cost) AS total From Event;";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getLong("total");
        }
        return count;

    }

    public Event getEvent(int id) throws SQLException {
        Event event = null;
        String query = "SELECT [EventID],[EventName],[PreparationTime],[HoldTime],[Location],[Cost],[ExpectedNumber]\n"
                + ",[Organization],[Description],[Feedback],[Approve],[CreateBy],[EndTime]\n"
                + "FROM [SROMS].[dbo].[Event] WHERE EventID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        if (rs.next()) {
            event = new Event(rs.getInt(1), rs.getString(2), rs.getTimestamp(3), rs.getTimestamp(4),
                    rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9),
                    rs.getString(10), rs.getString(11), rs.getString(12), rs.getTimestamp(13));
        }
        return event;
    }

    public List<Map<String, Integer>> getTotalIsPresent() throws SQLException {
        List<Map<String, Integer>> totalIsPresent = new ArrayList<>();
        String query = "SELECT EventID, COUNT(*) AS TotalParticipants\n"
                + "FROM ParticipationEventDetail \n"
                + "WHERE IsPresent = 1\n"
                + "GROUP BY EventID;";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            int totalParticipants = rs.getInt("TotalParticipants");
            int eventId = rs.getInt("EventID");
            Map<String, Integer> eventData = new HashMap<>();
            eventData.put("EventID", eventId);
            eventData.put("TotalParticipants", totalParticipants);
            totalIsPresent.add(eventData);
        }
        return totalIsPresent;
    }

    public void addCompatition(String eventName, Timestamp preTime, Timestamp holdTime, String location, int cost, int expectedNumber, String organization, String description, String feedback, Timestamp endTime, String createBy, int managerProfileID, int EventCategoryID) throws SQLException {
        String query = "INSERT INTO [SROMS].[dbo].[Event]\n"
                + "(EventName,PreparationTime,HoldTime,Location,Cost,ExpectedNumber,Organization,Description,Feedback, EndTime,CreateBy,ManagerProfileID,Approve,EventCategoryID)\n"
                + "VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        ps = conn.prepareStatement(query);
        ps.setString(1, eventName);
        ps.setTimestamp(2, preTime);
        ps.setTimestamp(3, holdTime);
        ps.setString(4, location);
        ps.setInt(5, cost);
        ps.setInt(6, expectedNumber);
        ps.setString(7, organization);
        ps.setString(8, description);
        ps.setString(9, feedback);
        ps.setTimestamp(10, endTime);
        ps.setString(11, createBy);
        ps.setInt(12, managerProfileID);
        ps.setString(13, "EC");
        ps.setInt(14, EventCategoryID);
        ps.executeUpdate();
    }

    public void addPrizeStructure(int firt, int second, int third) throws SQLException {
        String query = "INSERT INTO PrizeStructure ([First],[Second],[Third]) VALUES (?,?,?);";
        ps = conn.prepareStatement(query);
        ps.setInt(1, firt);
        ps.setInt(2, second);
        ps.setInt(3, third);
        ps.executeUpdate();
    }

    public int updateEvent(String name, Timestamp preTime, Timestamp holeTime, String location, int cost, int exNum, String organization, String description, String feedback, Timestamp endTime, int id) throws SQLException {
        int check = 0;
        String query = " UPDATE [SROMS].[dbo].[Event]\n"
                + "      SET [EventName] = ?,\n"
                + "      [PreparationTime] = ?,\n"
                + "      [HoldTime] = ?,\n"
                + "      [Location] = ?,\n"
                + "      [Cost] = ?,\n"
                + "      [ExpectedNumber] = ?,\n"
                + "      [Organization] = ?,\n"
                + "      [Description] = ?,\n"
                + "	 [Feedback] = ?,\n"
                + "      [EndTime] = ?\n"
                + "      WHERE [EventID] = ?;";
        ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setTimestamp(2, preTime);
        ps.setTimestamp(3, holeTime);
        ps.setString(4, location);
        ps.setInt(5, cost);
        ps.setInt(6, exNum);
        ps.setString(7, organization);
        ps.setString(8, description);
        ps.setString(9, feedback);
        ps.setTimestamp(10, endTime);
        ps.setInt(11, id);
        check = ps.executeUpdate();
        return check;
    }

    public void deleteEvent(int eventID) throws SQLException {
        String query = "UPDATE [SROMS].[dbo].[Event] SET IsApprove = 0 WHERE EventID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, eventID);
        ps.executeUpdate();
    }

    // Method to get EventCategoryName by EventCategoryID
    public String getEventCategoryName(int eventCategoryID) {
        String categoryName = null;
        try {
            String sql = "SELECT EventCategoryName FROM EventCategory WHERE EventCategoryID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, eventCategoryID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                categoryName = rs.getString("EventCategoryName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryName;
    }

    public boolean addStudentToParticipationEventDetail(ParticipationEventDetail participationEventDetail) throws SQLException {
        conn = DBConnection.connect(); // Establish database connection

        String checkQuery = "SELECT COUNT(*) FROM [SROMS].[dbo].[ParticipationEventDetail] WHERE [EventID] = ? AND [StudentProfileID] = ?";
        PreparedStatement checkPs = conn.prepareStatement(checkQuery);
        checkPs.setInt(1, participationEventDetail.getEventID());
        checkPs.setInt(2, participationEventDetail.getStudentProfileID());

        ResultSet rs = checkPs.executeQuery();
        if (rs.next()) {
            if (rs.getInt(1) > 0) {
                // Sinh viên đã tồn tại trong sự kiện
                return false; // Trả về false nếu sinh viên đã tham gia
            }
        }

        // Insert sinh viên vào sự kiện
        String query = "INSERT INTO [SROMS].[dbo].[ParticipationEventDetail] ([EventID], [StudentProfileID], [RoleEvent], [IsPresent], [Report], [Result])"
                + " VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);

        // Set parameters and execute
        ps.setInt(1, participationEventDetail.getEventID());
        ps.setInt(2, participationEventDetail.getStudentProfileID());
        ps.setString(3, participationEventDetail.getRoleEvent());
        ps.setBoolean(4, participationEventDetail.getIsPresent());
        ps.setString(5, participationEventDetail.getReport());
        ps.setString(6, participationEventDetail.getResult());
        ps.executeUpdate();

        return true; // Trả về true khi thêm thành công
    }

    public boolean checkStudentParticipationEventDetail(int eventID, int studentProfileID) throws SQLException {
        conn = DBConnection.connect(); // Establish database connection

        String checkQuery = "SELECT COUNT(*) FROM [SROMS].[dbo].[ParticipationEventDetail] WHERE [EventID] = ? AND [StudentProfileID] = ?";
        PreparedStatement checkPs = conn.prepareStatement(checkQuery);
        checkPs.setInt(1, eventID);
        checkPs.setInt(2, studentProfileID);

        ResultSet rs = checkPs.executeQuery();
        if (rs.next()) {
            if (rs.getInt(1) > 0) {
                // Sinh viên đã tồn tại trong sự kiện
                return false; // Trả về false nếu sinh viên đã tham gia
            }
        }
        return true;
    }

    public List<Event> checkStudentParticipationEventDetail(int studentProfileID) throws SQLException {
        ArrayList<Event> listE = new ArrayList<>();
        Event event = null;

        // Establish database connection
        String query = "SELECT * FROM [SROMS].[dbo].[Event] e "
                + "INNER JOIN [SROMS].[dbo].[ParticipationEventDetail] ped "
                + "ON e.[EventID] = ped.[EventID] WHERE ped.[StudentProfileID] = ?"; // SQL query to retrieve events
        ps = conn.prepareStatement(query); // Prepare SQL statement
        ps.setInt(1, studentProfileID);
        rs = ps.executeQuery(); // Execute query and obtain result set
        while (rs.next()) { // Iterate over the result set
            // Create Event object using data from the result set and add it to the list
            event = new Event(
                    rs.getInt(1), rs.getString(2), rs.getTimestamp(3), rs.getTimestamp(4), rs.getString(5),
                    rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
                    rs.getString(12), rs.getInt(13), rs.getInt(14), rs.getInt(15), rs.getInt(16), rs.getTimestamp(17)
            );
            listE.add(event);
        }
        return listE; // Return the list of events
    }

    public int checkAttendance(boolean check, int profileID, int eventID) throws SQLException {
        int count = 0;
        String query = "UPDATE [ParticipationEventDetail] SET IsPresent = ? WHERE StudentProfileID = ? AND EventID = ?;";
        ps = conn.prepareStatement(query);
        ps.setBoolean(1, check);
        ps.setInt(2, profileID);
        ps.setInt(3, eventID);
        count = ps.executeUpdate();
        return count;
    }

    public int evaluateStudent(String evaluate, int profileID, int eventID) throws SQLException {
        int count = 0;
        String query = "UPDATE [ParticipationEventDetail] SET Report = ? WHERE StudentProfileID = ? AND EventID = ?;";
        ps = conn.prepareStatement(query);
        ps.setString(1, evaluate);
        ps.setInt(2, profileID);
        ps.setInt(3, eventID);
        count = ps.executeUpdate();
        return count;
    }

    public int updateEvent(String name, Timestamp preTime, Timestamp holeTime, String location, int cost, int exNum, String organization, String description, String feedback, Timestamp endTime, int cetegotyID, int id) throws SQLException {
        int check = 0;
        String query = "UPDATE [SROMS].[dbo].[Event]\n"
                + "SET [EventName] = ?,\n"
                + "[PreparationTime] = ?,\n"
                + "[HoldTime] = ?,\n"
                + "[Location] = ?,\n"
                + "[Cost] = ?,\n"
                + "[ExpectedNumber] = ?,\n"
                + "[Organization] = ?,\n"
                + "[Description] = ?,\n"
                + "[Feedback] = ?,\n"
                + "[EndTime] = ?,\n"
                + "[EventCategoryID] = ?\n"
                + "WHERE [EventID] = ?;";
        ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setTimestamp(2, preTime);
        ps.setTimestamp(3, holeTime);
        ps.setString(4, location);
        ps.setInt(5, cost);
        ps.setInt(6, exNum);
        ps.setString(7, organization);
        ps.setString(8, description);
        ps.setString(9, feedback);
        ps.setTimestamp(10, endTime);
        ps.setInt(11, cetegotyID);
        ps.setInt(12, id);
        check = ps.executeUpdate();
        return check;
    }

    public int updateCompatition(PrizeStructure prize) throws SQLException {
        int check = 0;
        String query = "UPDATE PrizeStructure \n"
                + "SET PrizeStructure.First = ?,\n"
                + "PrizeStructure.Second = ?,\n"
                + "Third = ?,\n"
                + "Encouragement = ?\n"
                + "WHERE PrizeStructureID = ?;";
        ps = conn.prepareStatement(query);
        ps.setInt(1, prize.getFirst());
        ps.setInt(2, prize.getSecond());
        ps.setInt(3, prize.getThird());
        ps.setInt(4, prize.getEncouragement());
        ps.setInt(5, prize.getPrizeStructureID());
        check = ps.executeUpdate();
        return check;
    }

    public int addPrizeStructure(int firt, int second, int third, int encouragement) throws SQLException {
        int count = 0;
        String query = "INSERT INTO PrizeStructure ([First],[Second],[Third],[Encouragement]) VALUES (?,?,?,?);";
        ps = conn.prepareStatement(query);
        ps.setInt(1, firt);
        ps.setInt(2, second);
        ps.setInt(3, third);
        ps.setInt(4, encouragement);
        count = ps.executeUpdate();
        return count;
    }

    public int addCompatition(String eventName, Timestamp preTime, Timestamp holdTime, String location, int cost, int expectedNumber, String organization, String description, String feedback, Timestamp endTime, String createBy, int managerProfileID, int EventCategoryID, int PrizeStructureID) throws SQLException {
        int count = 0;
        String query = "INSERT INTO [SROMS].[dbo].[Event]\n"
                + "(EventName,PreparationTime,HoldTime,Location,Cost,ExpectedNumber,Organization,Description,Feedback, EndTime,CreateBy,ManagerProfileID,Approve,EventCategoryID, PrizeStructureID)\n"
                + "VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        ps = conn.prepareStatement(query);
        ps.setString(1, eventName);
        ps.setTimestamp(2, preTime);
        ps.setTimestamp(3, holdTime);
        ps.setString(4, location);
        ps.setInt(5, cost);
        ps.setInt(6, expectedNumber);
        ps.setString(7, organization);
        ps.setString(8, description);
        ps.setString(9, feedback);
        ps.setTimestamp(10, endTime);
        ps.setString(11, createBy);
        ps.setInt(12, managerProfileID);
        ps.setString(13, "EC");
        ps.setInt(14, EventCategoryID);
        ps.setInt(15, PrizeStructureID);
        count = ps.executeUpdate();
        return count;
    }

    public int getMaxPrizeStructureID() throws SQLException {
        int count = 0;
        String query = "SELECT MAX(PrizeStructureID)+1 AS MaxPrizeStructureID FROM PrizeStructure;";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt("MaxPrizeStructureID");
        }
        return count;
    }

    public int addEvent(String eventName, Timestamp preTime, Timestamp holdTime, String location, int cost, int expectedNumber, String organization, String description, String feedback, Timestamp endTime, String createBy, int managerProfileID, int EventCategoryID) throws SQLException {
        int count = 0;
        String query = "INSERT INTO [SROMS].[dbo].[Event]\n"
                + "(EventName,PreparationTime,HoldTime,Location,Cost,ExpectedNumber,Organization,Description,Feedback, EndTime,CreateBy,ManagerProfileID,Approve,EventCategoryID)\n"
                + "VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        ps = conn.prepareStatement(query);
        ps.setString(1, eventName);
        ps.setTimestamp(2, preTime);
        ps.setTimestamp(3, holdTime);
        ps.setString(4, location);
        ps.setInt(5, cost);
        ps.setInt(6, expectedNumber);
        ps.setString(7, organization);
        ps.setString(8, description);
        ps.setString(9, feedback);
        ps.setTimestamp(10, endTime);
        ps.setString(11, createBy);
        ps.setInt(12, managerProfileID);
        ps.setString(13, "EC");
        ps.setInt(14, EventCategoryID);
        count = ps.executeUpdate();
        return count;
    }

    public int checkRequestCreate(String approve, int eventID) throws SQLException {
        int count = 0;
        String query = "UPDATE Event SET Approve = ? WHERE EventID = ?;";
        ps = conn.prepareStatement(query);
        ps.setString(1, approve);
        ps.setInt(2, eventID);
        count = ps.executeUpdate();
        return count;
    }

    public List<Map<String, String>> getListAttendant(int eventID) throws SQLException {
        List<Map<String, String>> listAttendant = new ArrayList<>();
        String query = "SELECT Event.EventName, FirstName, LastName, Avatar, Major,Email,RollNumber,StudentProfile.StudentProfileID,Event.EventID,ParticipationEventDetail.IsPresent,ParticipationEventDetail.Report\n"
                + "FROM [ParticipationEventDetail] LEFT JOIN Event ON ParticipationEventDetail.EventID = Event.EventID \n"
                + "LEFT JOIN StudentProfile ON ParticipationEventDetail.StudentProfileID = StudentProfile.StudentProfileID\n"
                + "LEFT JOIN UserProfile ON StudentProfile.UserProfileID = UserProfile.UserProfileID WHERE Event.EventID = ?;";
        ps = conn.prepareStatement(query);
        ps.setInt(1, eventID);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, String> attendantDetails = new HashMap<>();
            attendantDetails.put("EventName", rs.getString("EventName"));
            attendantDetails.put("FirstName", rs.getString("FirstName"));
            attendantDetails.put("LastName", rs.getString("LastName"));
            attendantDetails.put("Avatar", rs.getString("Avatar"));
            attendantDetails.put("Major", rs.getString("Major"));
            attendantDetails.put("Email", rs.getString("Email"));
            attendantDetails.put("RollNumber", rs.getString("RollNumber"));
            attendantDetails.put("StudentProfileID", rs.getString("StudentProfileID"));
            attendantDetails.put("EventID", rs.getString("EventID"));
            attendantDetails.put("IsPresent", rs.getString("IsPresent"));
            attendantDetails.put("Report", rs.getString("Report"));
            listAttendant.add(attendantDetails);
        }
        return listAttendant;
    }

    public Map<String, String> getDetailEventByEventManager(int id) throws SQLException {
        Map<String, String> detailEvent = new HashMap<>(); // Initialize the map
        String query = "SELECT  Event.EventID, EventName, PreparationTime, HoldTime, Location, Cost, ExpectedNumber, Organization, Event.Description, Feedback, Approve, CreateBy, RollNumber ,StaffNumber, EndTime, EventCategoryName,\n"
                + "First,Second,Third, Encouragement, PrizeStructure.PrizeStructureID  FROM [SROMS].[dbo].[Event] LEFT JOIN EventCategory ON Event.EventCategoryID = EventCategory.EventCategoryID \n"
                + "LEFT JOIN StudentProfile ON [Event].StudentProfileID = StudentProfile.StudentProfileID LEFT JOIN PrizeStructure ON Event.PrizeStructureID = PrizeStructure.PrizeStructureID \n"
                + "LEFT JOIN ManagerProfile ON Event.ManagerProfileID = ManagerProfile.ManagerProfileID WHERE Event.EventID = ?;"; // corrected SQL query
        ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        if (rs.next()) {
            detailEvent.put("EventID", rs.getString("EventID")); // corrected usage and conversion
            detailEvent.put("EventName", rs.getString("EventName"));
            detailEvent.put("PreparationTime", rs.getString("PreparationTime")); // corrected usage and conversion
            detailEvent.put("HoldTime", rs.getString("HoldTime")); // corrected usage and conversion
            detailEvent.put("Location", rs.getString("Location"));
            detailEvent.put("Cost", rs.getString("Cost")); // corrected usage and conversion
            detailEvent.put("ExpectedNumber", rs.getString("ExpectedNumber")); // corrected usage and conversion
            detailEvent.put("Organization", rs.getString("Organization"));
            detailEvent.put("Description", rs.getString("Description"));
            detailEvent.put("Feedback", rs.getString("Feedback"));
            detailEvent.put("Approve", rs.getString("Approve"));
            detailEvent.put("CreateBy", rs.getString("CreateBy"));
            detailEvent.put("RollNumber", rs.getString("RollNumber"));
            detailEvent.put("StaffNumber", rs.getString("StaffNumber")); // corrected usage and conversio
            detailEvent.put("EndTime", rs.getString("EndTime")); // corrected usage and conversion
            detailEvent.put("EventCategoryName", rs.getString("EventCategoryName"));
            detailEvent.put("First", rs.getString("First"));
            detailEvent.put("Second", rs.getString("Second"));
            detailEvent.put("Third", rs.getString("Third"));
            detailEvent.put("Encouragement", rs.getString("Encouragement"));
            detailEvent.put("PrizeStructureID", rs.getString("PrizeStructureID"));

        }
        return detailEvent;
    }

    public int getTotalEventNotStarted() throws SQLException {
        int count = 0;
        String query = "  SELECT COUNT(*) AS total_events FROM Event  WHERE EndTime > CURRENT_TIMESTAMP AND HoldTime >  CURRENT_TIMESTAMP   AND Approve ='AA';";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt("total_events");
        }
        return count;
    }

    public int addEventForMyClub(String eventName, Timestamp preTime, Timestamp holdTime, String location, int cost, int expectedNumber, String organization, String description, String feedback, Timestamp endTime, String createBy, int studentProfileID, int EventCategoryID) throws SQLException {
        int count = 0;
        String query = "INSERT INTO [SROMS].[dbo].[Event]\n"
                + "(EventName,PreparationTime,HoldTime,Location,Cost,ExpectedNumber,Organization,Description,Feedback, EndTime,CreateBy,StudentProfileID,Approve,EventCategoryID)\n"
                + "VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        ps = conn.prepareStatement(query);
        ps.setString(1, eventName);
        ps.setTimestamp(2, preTime);
        ps.setTimestamp(3, holdTime);
        ps.setString(4, location);
        ps.setInt(5, cost);
        ps.setInt(6, expectedNumber);
        ps.setString(7, organization);
        ps.setString(8, description);
        ps.setString(9, feedback);
        ps.setTimestamp(10, endTime);
        ps.setString(11, createBy);
        ps.setInt(12, studentProfileID);
        ps.setString(13, "SC");
        ps.setInt(14, EventCategoryID);
        count = ps.executeUpdate();
        return count;
    }

    public int addCompatitionForMyCLub(String eventName, Timestamp preTime, Timestamp holdTime, String location, int cost, int expectedNumber, String organization, String description, String feedback, Timestamp endTime, String createBy, int studentProfileID, int EventCategoryID, int PrizeStructureID) throws SQLException {
        int count = 0;
        String query = "INSERT INTO [SROMS].[dbo].[Event]\n"
                + "(EventName,PreparationTime,HoldTime,Location,Cost,ExpectedNumber,Organization,Description,Feedback, EndTime,CreateBy,StudentProfileID,Approve,EventCategoryID, PrizeStructureID)\n"
                + "VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        ps = conn.prepareStatement(query);
        ps.setString(1, eventName);
        ps.setTimestamp(2, preTime);
        ps.setTimestamp(3, holdTime);
        ps.setString(4, location);
        ps.setInt(5, cost);
        ps.setInt(6, expectedNumber);
        ps.setString(7, organization);
        ps.setString(8, description);
        ps.setString(9, feedback);
        ps.setTimestamp(10, endTime);
        ps.setString(11, createBy);
        ps.setInt(12, studentProfileID);
        ps.setString(13, "SC");
        ps.setInt(14, EventCategoryID);
        ps.setInt(15, PrizeStructureID);
        count = ps.executeUpdate();
        return count;
    }
}
