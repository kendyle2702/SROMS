package DAOs;

import DB.DBConnection;
import Models.Event;
import Models.ParticipationEventDetail;
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

    public List<Event> eventList() throws SQLException {
        ArrayList<Event> listE = new ArrayList<>();
        Event event = null;
        conn = DBConnection.connect();
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
        conn = DBConnection.connect();
        String query = "SELECT COUNT(*) AS total_events FROM Event  WHERE EndTime >= CURRENT_TIMESTAMP;";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt("total_events");
        }
        return count;

    }

    public int getTotalEventTook() throws SQLException {
        int count = 0;
        conn = DBConnection.connect();
        String query = "SELECT COUNT(*) AS total_events FROM Event  WHERE EndTime < CURRENT_TIMESTAMP;";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt("total_events");
        }
        return count;
    }

    public long getTotalCost() throws SQLException {
        long count = 0;
        conn = DBConnection.connect();
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
        conn = DBConnection.connect();
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
        conn = DBConnection.connect();
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

    public void addEvent(Event event) throws SQLException {
        conn = DBConnection.connect();
        String query = "INSERT INTO [SROMS].[dbo].[Event]"
                + " (EventName,PreparationTime,HoldTime,Location,Cost,ExpectedNumber,Organization,Description, EndTime)"
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        ps = conn.prepareStatement(query);
        ps.setString(1, event.getEventName());
        ps.setTimestamp(2, event.getPreparationTime());
        ps.setTimestamp(3, event.getHoldTime());
        ps.setString(4, event.getLocation());
        ps.setInt(5, event.getCost());
        ps.setInt(6, event.getExpectedNumber());
        ps.setString(7, event.getOrganization());
        ps.setString(8, event.getDescription());
        ps.setTimestamp(9, event.getEndTime());
        ps.executeUpdate();
    }

    public int updateEvent(String name, Timestamp preTime, Timestamp holeTime, String location, int cost, int exNum, String organization, String description, String feedback, Timestamp endTime, int id) throws SQLException {
        conn = DBConnection.connect();
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
                + "       WHERE [EventID] = ?;";
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
        conn = DBConnection.connect();
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

}
