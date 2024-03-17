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
            String sql = "SELECT * FROM News ORDER BY CreateAT DESC";
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

    public String getNameAuthor(int newsID) {
        String name = null;
        try {
            String sql = "select CONCAT(LastName, ' ', FirstName) AS FullName\n"
                    + "from UserProfile as u \n"
                    + "join AdminProfile as a on u.UserProfileID = a.UserProfileID\n"
                    + "join News as n on n.AdminProfileID = a.AdminProfileID \n"
                    + "where n.NewsID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newsID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("FullName");
            }
        } catch (Exception e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return name;
    }

    public News getNewsByID(int newsID) {
        News news = null;
        try {
            String sql = "select * from News where NewsID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newsID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                news = new News(rs.getInt("newsID"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getDate("createAt"),
                        rs.getInt("adminProfileID")
                );
            }
        } catch (Exception e) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return news;
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

    public ResultSet getAllNewsMoreByID(int id) {
        ResultSet rs = null;
        try {
            String sql = "  SELECT * FROM News as n \n"
                    + "  inner join AdminProfile as a on n.AdminProfileID = a.AdminProfileID \n"
                    + "  inner join UserProfile as u on u.UserProfileID = a.UserProfileID\n"
                    + "  where n.NewsID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public News addNews(News news) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [News] values(?,?,?,?)");
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setDate(3, news.getCreateAt());
            ps.setInt(4, news.getAdminProfileID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (count == 0) ? null : news;
    }

    public News updateNews(News news) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(""
                    + "update News set Title =?, Content=? where NewsID =?");

            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setInt(3, news.getNewsID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : news;
    }
}
