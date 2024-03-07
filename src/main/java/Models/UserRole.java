
package Models;


public class UserRole {

    private int roleID;
    private int userLoginID;

    public UserRole(int roleID, int userLoginID) {
        this.roleID = roleID;
        this.userLoginID = userLoginID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getUserLoginID() {
        return userLoginID;
    }

    public void setUserLoginID(int userLoginID) {
        this.userLoginID = userLoginID;
    }

    
}