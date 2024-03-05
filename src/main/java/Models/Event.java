/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Event {

    private int eventID;
    private String eventName;
    private Timestamp preparationTime;
    private Timestamp holdTime;
    private String location;
    private int cost;
    private int expectedNumber;
    private String organization;
    private String description;
    private String feedback;
    private Boolean isApprove;
    private String createdBy;
    private int eventCategoryID;
    private int adminProfileID;
    private int managerProfileID;
    private int studentProfileID;

    public Event(int eventID, String eventName, Timestamp preparationTime, Timestamp holdTime, String location, int cost, int expectedNumber, String organization, String description, String feedback, Boolean isApprove, String createdBy, int eventCategoryID, int adminProfileID, int managerProfileID, int studentProfileID) {
        this.eventID = eventID;
        this.eventName = eventName;
        this.preparationTime = preparationTime;
        this.holdTime = holdTime;
        this.location = location;
        this.cost = cost;
        this.expectedNumber = expectedNumber;
        this.organization = organization;
        this.description = description;
        this.feedback = feedback;
        this.isApprove = isApprove;
        this.createdBy = createdBy;
        this.eventCategoryID = eventCategoryID;
        this.adminProfileID = adminProfileID;
        this.managerProfileID = managerProfileID;
        this.studentProfileID = studentProfileID;
    }
    
    public Event(int eventID, String eventName, Timestamp holdTime, String location, String description, int eventCategoryID) {
        this.eventID = eventID;
        this.eventName = eventName;
        this.holdTime = holdTime;
        this.location = location;
        this.description = description;
        this.eventCategoryID = eventCategoryID;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public Timestamp getPreparationTime() {
        return preparationTime;
    }

    public void setPreparationTime(Timestamp preparationTime) {
        this.preparationTime = preparationTime;
    }

    public Timestamp getHoldTime() {
        return holdTime;
    }

    public void setHoldTime(Timestamp holdTime) {
        this.holdTime = holdTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getExpectedNumber() {
        return expectedNumber;
    }

    public void setExpectedNumber(int expectedNumber) {
        this.expectedNumber = expectedNumber;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Boolean getIsApprove() {
        return isApprove;
    }

    public void setIsApprove(Boolean isApprove) {
        this.isApprove = isApprove;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public int getEventCategoryID() {
        return eventCategoryID;
    }

    public void setEventCategoryID(int eventCategoryID) {
        this.eventCategoryID = eventCategoryID;
    }

    public int getAdminProfileID() {
        return adminProfileID;
    }

    public void setAdminProfileID(int adminProfileID) {
        this.adminProfileID = adminProfileID;
    }

    public int getManagerProfileID() {
        return managerProfileID;
    }

    public void setManagerProfileID(int managerProfileID) {
        this.managerProfileID = managerProfileID;
    }

    public int getStudentProfileID() {
        return studentProfileID;
    }

    public void setStudentProfileID(int studentProfileID) {
        this.studentProfileID = studentProfileID;
    }

}
