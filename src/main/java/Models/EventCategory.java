/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class EventCategory {
    private int eventCategoryID;
    private String eventCategoryName;
    private int point;
    private String description;

    public EventCategory(int eventCategoryID, String eventCategoryName, int point, String description) {
        this.eventCategoryID = eventCategoryID;
        this.eventCategoryName = eventCategoryName;
        this.point = point;
        this.description = description;
    }

    public int getEventCategoryID() {
        return eventCategoryID;
    }

    public void setEventCategoryID(int eventCategoryID) {
        this.eventCategoryID = eventCategoryID;
    }

    public String getEventCategoryName() {
        return eventCategoryName;
    }

    public void setEventCategoryName(String eventCategoryName) {
        this.eventCategoryName = eventCategoryName;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
