
package Models;


public class Semester {

    private int semesterID;
    private String semesterName;
    private String semesterCode;
    private String description;

    public Semester(int semesterID, String semesterName, String semesterCode, String description) {
        this.semesterID = semesterID;
        this.semesterName = semesterName;
        this.semesterCode = semesterCode;
        this.description = description;
    }

    public int getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(int semesterID) {
        this.semesterID = semesterID;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }

    public String getSemesterCode() {
        return semesterCode;
    }

    public void setSemesterCode(String semesterCode) {
        this.semesterCode = semesterCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
