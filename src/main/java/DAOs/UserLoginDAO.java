
package DAOs;

import Models.UserLogin;
import Models.UserProfile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UserLoginDAO {

    private Connection conn;

    public UserLoginDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public UserProfile getUserProfileByUsername(String username) {
        UserProfile userProfile = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from UserProfile as up inner join UserLogin as ul on up.UserProfileID = ul.UserProfileID where LOWER(ul.Username) = ?");
            ps.setString(1, username.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userProfile = new UserProfile(rs.getInt("UserProfileID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Avatar"), rs.getString("Gender"), rs.getDate("DateOfBirth"), rs.getString("Address"), rs.getDate("EnrollmentDate"), rs.getString("Email"), rs.getString("Phone"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userProfile;
    }

    public boolean loginWithGoogleByUsernameAndRole(String username, String role) {
        try {
            PreparedStatement ps = conn.prepareStatement("  select * from UserProfile as up inner join UserLogin as ul \n"
                    + "  on up.UserProfileID = ul.UserProfileID inner join UserRole as ur \n"
                    + "  on ul.UserLoginID = ur.UserLoginID inner join Role as r\n"
                    + "  on ur.RoleID = r.RoleID where LOWER(ul.Username) = ? and r.RoleName = ?");
            ps.setString(1, username.toLowerCase());
            ps.setString(2, role.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public UserLogin addUserLogin(UserLogin user) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [UserLogin] values(?,?,?,?)");
            ps.setString(1, user.getUsername());
            ps.setTimestamp(2, user.getCreateAt());
            ps.setInt(3, 1);
            ps.setInt(4, user.getUserProfileID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (count == 0) ? null : user;
    }
}
