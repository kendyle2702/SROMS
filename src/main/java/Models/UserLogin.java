
package Models;

import java.sql.Timestamp;


public class UserLogin {

    private int userLoginID;
    private String username;
    private Timestamp createAt;
    private Boolean isActive;
    private int userProfileID;

    public UserLogin(int userLoginID, String username, Timestamp createAt, Boolean isActive, int userProfileID) {
        this.userLoginID = userLoginID;
        this.username = username;
        this.createAt = createAt;
        this.isActive = isActive;
        this.userProfileID = userProfileID;
    }

    public UserLogin(String username, Timestamp createAt, Boolean isActive, int userProfileID) {
        this.username = username;
        this.createAt = createAt;
        this.isActive = isActive;
        this.userProfileID = userProfileID;
    }

    public int getUserLoginID() {
        return userLoginID;
    }

    public void setUserLoginID(int userLoginID) {
        this.userLoginID = userLoginID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public int getUserProfileID() {
        return userProfileID;
    }

    public void setUserProfileID(int userProfileID) {
        this.userProfileID = userProfileID;
    }


}
