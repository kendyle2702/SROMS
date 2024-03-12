package DAOs;

import Models.News;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author khuy
 */
public class NewsDAO {

    private Connection conn;

    public NewsDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM News";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News news = new News(
                        rs.getInt("newsID"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getDate("createAt"),
                        rs.getInt("adminProfileID")
                );
                newsList.add(news);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newsList;
    }

    public News getLatestNews() {
        News latestNews = null;
        try {
            String sql = "SELECT TOP 1 * FROM news ORDER BY createAt DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                latestNews = new News(
                        rs.getInt("newsID"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getDate("createAt"),
                        rs.getInt("adminProfileID")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return latestNews;
    }
    public ResultSet getAllNewsReturnResultSet() {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM News";
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
           
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
}
