package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {

    public static Connection connect() throws SQLException {
        String server = "DESKTOP-7UI977G\\SQLEXPRESS";
        String port = "1433";
        String database = "SROMS";
        String user = "sa";
        String password = "123456";
        Connection conn = null;
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            conn = DriverManager.getConnection("jdbc:sqlserver://" + server + ":" + port
                    + ";databaseName=" + database + ";user=" + user + ";password=" + password
                    + ";encrypt=true;trustServerCertificate=true;");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return conn;
    }
}
