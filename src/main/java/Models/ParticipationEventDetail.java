
package Models;


public class ParticipationEventDetail {

    private int eventID;
    private int studentProfileID;
    private String roleEvent;
    private Boolean isPresent;
    private String report;
    private String result;

    public ParticipationEventDetail(int eventID, int studentProfileID, String roleEvent, Boolean isPresent, String report) {
        this.eventID = eventID;
        this.studentProfileID = studentProfileID;
        this.roleEvent = roleEvent;
        this.isPresent = isPresent;
        this.report = report;
    }

    
    public ParticipationEventDetail(int eventID, int studentProfileID, String roleEvent, Boolean isPresent, String report, String result) {
        this.eventID = eventID;
        this.studentProfileID = studentProfileID;
        this.roleEvent = roleEvent;
        this.isPresent = isPresent;
        this.report = report;
        this.result = result;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public int getStudentProfileID() {
        return studentProfileID;
    }

    public void setStudentProfileID(int studentProfileID) {
        this.studentProfileID = studentProfileID;
    }

    public String getRoleEvent() {
        return roleEvent;
    }

    public void setRoleEvent(String roleEvent) {
        this.roleEvent = roleEvent;
    }

    public Boolean getIsPresent() {
        return isPresent;
    }

    public void setIsPresent(Boolean isPresent) {
        this.isPresent = isPresent;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

   

}
