
package Models;


public class ClubMember {
    private int studentProfileID;
    private int clubID;
    private int semesterID;
    private String clubRole;
    private int clubPoint;
    private String report;

    public ClubMember(int studentProfileID, int clubID, int semesterID, String clubRole, int clubPoint, String report) {
        this.studentProfileID = studentProfileID;
        this.clubID = clubID;
        this.semesterID = semesterID;
        this.clubRole = clubRole;
        this.clubPoint = clubPoint;
        this.report = report;
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

   
}
