
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuocCu
 */
public class DBConnection {

    public static Connection connect() throws SQLException {
        String server = "KHUY";
        String port = "1433";
        String database = "SROMS";
        String user = "sa";
        String password = "111111";

        Connection conn = null;

        try {
            // Đảm bảo driver đã được tạo
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Tạo đối tượng Connection
            conn = DriverManager.getConnection("jdbc:sqlserver://" + server + ":" + port
                    + ";databaseName=" + database + ";user=" + user + ";password=" + password
                    + ";encrypt=true;trustServerCertificate=true;");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return conn;
    }
}
