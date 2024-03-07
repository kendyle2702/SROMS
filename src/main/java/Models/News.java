
package Models;

import java.sql.Date;


public class News {

    private int newsID;
    private String title;
    private String content;
    private Date createAt;
    private int adminProfileID;

    public News(int newsID, String title, String content, Date createAt, int adminProfileID) {
        this.newsID = newsID;
        this.title = title;
        this.content = content;
        this.createAt = createAt;
        this.adminProfileID = adminProfileID;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public int getAdminProfileID() {
        return adminProfileID;
    }

    public void setAdminProfileID(int adminProfileID) {
        this.adminProfileID = adminProfileID;
    }

}
