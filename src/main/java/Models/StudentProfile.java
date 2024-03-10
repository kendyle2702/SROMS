package Models;

public class StudentProfile {

    private int studentProfileID;
    private String rollNumber;
    private String memberCode;
    private String major;
    private String mode;
    private int userProfileID;

    public StudentProfile(String rollNumber, String memberCode, String major, String mode, int userProfileID) {
        this.rollNumber = rollNumber;
        this.memberCode = memberCode;
        this.major = major;
        this.mode = mode;
        this.userProfileID = userProfileID;
    }

    public StudentProfile(int studentProfileID, String rollNumber, String memberCode, String major, String mode, int userProfileID) {
        this.studentProfileID = studentProfileID;
        this.rollNumber = rollNumber;
        this.memberCode = memberCode;
        this.major = major;
        this.mode = mode;
        this.userProfileID = userProfileID;
    }

    public StudentProfile(String rollNumber, String major) {
        this.rollNumber = rollNumber;
        this.major = major;
    }

    public int getStudentProfileID() {
        return studentProfileID;
    }

    public void setStudentProfileID(int studentProfileID) {
        this.studentProfileID = studentProfileID;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getMemberCode() {
        return memberCode;
    }

    public void setMemberCode(String memberCode) {
        this.memberCode = memberCode;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public int getUserProfileID() {
        return userProfileID;
    }

    public void setUserProfileID(int userProfileID) {
        this.userProfileID = userProfileID;
    }

}
