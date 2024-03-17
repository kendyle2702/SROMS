
package Models;


public class ManagerProfile {

    private int managerProfileID;
    private String staffNumber;
    private String academicLevel;
    private String degree;
    private String experience;
    private int userProfileID;
    
    public ManagerProfile(){
        
    }

    public ManagerProfile(String staffNumber, String academicLevel, String degree, String experience, int userProfileID) {
        this.staffNumber = staffNumber;
        this.academicLevel = academicLevel;
        this.degree = degree;
        this.experience = experience;
        this.userProfileID = userProfileID;
    }

  
    

    public ManagerProfile(int managerProfileID, String staffNumber, String academicLevel, String degree, String experience, int userProfileID) {
        this.managerProfileID = managerProfileID;
        this.staffNumber = staffNumber;
        this.academicLevel = academicLevel;
        this.degree = degree;
        this.experience = experience;
        this.userProfileID = userProfileID;
    }

    public int getManagerProfileID() {
        return managerProfileID;
    }

    public void setManagerProfileID(int managerProfileID) {
        this.managerProfileID = managerProfileID;
    }

    public String getStaffNumber() {
        return staffNumber;
    }

    public void setStaffNumber(String staffNumber) {
        this.staffNumber = staffNumber;
    }

    public String getAcademicLevel() {
        return academicLevel;
    }

    public void setAcademicLevel(String academicLevel) {
        this.academicLevel = academicLevel;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public int getUserProfileID() {
        return userProfileID;
    }

    public void setUserProfileID(int userProfileID) {
        this.userProfileID = userProfileID;
    }

}
