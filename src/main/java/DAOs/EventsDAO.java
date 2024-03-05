/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author khuy
 */
public class EventsDAO {

    private Connection conn;

    public EventsDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Event> getAllEventsForStudent() {
        List<Event> eventList = new ArrayList<>();
        try {
            String sql = "SELECT e.EventID, e.EventName, e.HoldTime, e.Location, e.Description, e.EventCategoryID "
                    + "FROM Event e ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Event event = new Event(
                        rs.getInt("EventID"),
                        rs.getString("EventName"),
                        rs.getTimestamp("HoldTime"),
                        rs.getString("Location"),
                        rs.getString("Description"),
                        rs.getInt("EventCategoryID")
                );
                eventList.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eventList;
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
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryName;
    }
}
