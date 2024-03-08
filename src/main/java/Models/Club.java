package Models;

import java.sql.Date;


public class Club {
    private int clubID;
    private String logo;
    private String clubName;
    private Date establishDate;
    private String description;
    private Boolean isApprove;
    private Boolean isActive;
    
    private int managerProfileID;

    public Club() {
    }

    public Club(int clubID, String clubName, Date establishDate, String description, Boolean isApprove, Boolean isActive, int managerProfileID) {
        this.clubID = clubID;
        this.clubName = clubName;
        this.establishDate = establishDate;
        this.description = description;
        this.isApprove = isApprove;
        this.isActive = isActive;
        this.managerProfileID = managerProfileID;
    }
    
    public Club(int clubID, String logo, String clubName, Date establishDate, String description, Boolean isApprove, Boolean isActive, int managerProfileID) {
        this.clubID = clubID;
        this.logo = logo;
        this.clubName = clubName;
        this.establishDate = establishDate;
        this.description = description;
        this.isApprove = isApprove;
        this.isActive = isActive;
        this.managerProfileID = managerProfileID;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public Date getEstablishDate() {
        return establishDate;
    }

    public void setEstablishDate(Date establishDate) {
        this.establishDate = establishDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getIsApprove() {
        return isApprove;
    }

    public void setIsApprove(Boolean isApprove) {
        this.isApprove = isApprove;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public int getManagerProfileID() {
        return managerProfileID;
    }

    public void setManagerProfileID(int managerProfileID) {
        this.managerProfileID = managerProfileID;
    }
}
