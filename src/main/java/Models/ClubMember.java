/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class ClubMember {
    private int studentProfileID;
    private int clubID;
    private int semesterID;
    private String clubRole;
    private int clubPoint;
    private String report;
    private Boolean status;

    public ClubMember(int studentProfileID, int clubID, int semesterID, String clubRole, Integer clubPoint, String report, Boolean status) {
        this.studentProfileID = studentProfileID;
        this.clubID = clubID;
        this.semesterID = semesterID;
        this.clubRole = clubRole;
        this.clubPoint = clubPoint;
        this.report = report;
        this.status = status;
    }

    public int getStudentProfileID() {
        return studentProfileID;
    }

    public void setStudentProfileID(int studentProfileID) {
        this.studentProfileID = studentProfileID;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public int getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(int semesterID) {
        this.semesterID = semesterID;
    }

    public String getClubRole() {
        return clubRole;
    }

    public void setClubRole(String clubRole) {
        this.clubRole = clubRole;
    }

    public int getClubPoint() {
        return clubPoint;
    }

    public void setClubPoint(int clubPoint) {
        this.clubPoint = clubPoint;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

}
