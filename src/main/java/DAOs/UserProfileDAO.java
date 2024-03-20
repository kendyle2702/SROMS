/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.UserProfile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QuocCu
 */
public class UserProfileDAO {

    private Connection conn;

    public UserProfileDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public UserProfile getUserProfileByEmail(String email) {
        UserProfile userProfile = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from UserProfile where LOWER(Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userProfile = new UserProfile(rs.getInt("UserProfileID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Avatar"), rs.getString("Gender"), rs.getDate("DateOfBirth"), rs.getString("Address"), rs.getDate("EnrollmentDate"), rs.getString("Email"), rs.getString("Phone"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userProfile;
    }

    public UserProfile updateUserProfile(UserProfile user) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(""
                    + "update UserProfile set FirstName =?, LastName=?, Avatar=?, Gender=?, DateOfBirth=?,"
                    + "Address=?,Phone=? where UserProfileID =?");

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAvatar());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getDateOfBirth());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getPhone());
            ps.setInt(8, user.getUserProfileID());
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : user;
    }

    public UserProfile addUserProfile(UserProfile user) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into [UserProfile] values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAvatar());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getDateOfBirth());
            ps.setString(6, user.getAddress());
            ps.setDate(7, user.getEnrollmentDate());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getPhone());
            count = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return (count == 0) ? null : user;
    }

    public int getUserProfileIDByEmail(String email) {
        int id = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from UserProfile where LOWER(Email) = ?");
            ps.setString(1, email.toLowerCase());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("UserProfileID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (id == 0) ? null : id;
    }

    public UserProfile updateUserProfileByUserProfileID(UserProfile user, int userProfileID) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("update UserProfile set FirstName =?, LastName=?, Avatar=?, Gender=?, DateOfBirth=?,"
                    + "Address=?,EnrollmentDate = ?, Email =?, Phone=? where UserProfileID =?");
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAvatar());
            ps.setString(4, user.getGender());
            ps.setDate(5, user.getDateOfBirth());
            ps.setString(6, user.getAddress());
            ps.setDate(7, user.getEnrollmentDate());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getPhone());
            ps.setInt(10, userProfileID);
            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : user;
    }

    public int getUserProfileIDByStudentProfileID(int studentID) {
        int id = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from StudentProfile where StudentProfileID = ?");
            ps.setInt(1, studentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("UserProfileID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (id == 0) ? null : id;
    }

    public int getUserProfileIDByManagerProfileID(int managerID) {
        int id = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from ManagerProfile where ManagerProfileID = ?");
            ps.setInt(1, managerID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("UserProfileID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (id == 0) ? null : id;
    }

    public List<Map.Entry<String, Integer>> getTop5StudentBySemester(int semesterID) throws SQLException {
        HashMap<String, Integer> studentMap = new HashMap<>();
        StudentProfileDAO stDAO = new StudentProfileDAO();
        EventDAO eventDAO = new EventDAO();
        ClubDAO clubDAO = new ClubDAO();
        ResultSet rsStudent = stDAO.getAllStudents();
        while (rsStudent.next()) {
            int pointClubs = clubDAO.getClubsScoreByStudentIDAndSemesterID(rsStudent.getInt("StudentProfileID"), semesterID);
            int pointEvensNormal = eventDAO.getEventsScoreByStudentIDAndSemesterID(rsStudent.getInt("StudentProfileID"), semesterID);
            int pointEvensCompetition = eventDAO.getEventsScoreCompetitionByStudentIDAndSemesterID(rsStudent.getInt("StudentProfileID"), semesterID);
            int total = (pointClubs >= 30 ? 30 : pointClubs) + ((pointEvensNormal + pointEvensCompetition) >= 60 ? 60 : (pointEvensNormal + pointEvensCompetition)) + 60;
            studentMap.put(rsStudent.getString("MemberCode"), total);
        }

        Comparator<Map.Entry<String, Integer>> comparator = new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> entry1, Map.Entry<String, Integer> entry2) {
                return entry2.getValue().compareTo(entry1.getValue());
            }
        };

        PriorityQueue<Map.Entry<String, Integer>> pq = new PriorityQueue<>(comparator);

        for (Map.Entry<String, Integer> entry : studentMap.entrySet()) {
            pq.offer(entry);
        }

        List<Map.Entry<String, Integer>> result = new ArrayList<>();

        for (int i = 0; i < 5; i++) {
            result.add(pq.poll());
        }
       
        return result;
    }

    public  List<Map.Entry<String, Integer>> getTop5ClubBySemester(int semesterID) throws SQLException {
        HashMap<String, Integer> clubMap = new HashMap<>();
        ClubDAO clubDAO = new ClubDAO();
        EventDAO eventDAO = new EventDAO();
        ResultSet rs = clubDAO.getAllCLubReturnResultSet();
        while (rs.next()) {
            ArrayList<Integer> listIDStudent = clubDAO.getAllStudentInClub(rs.getInt("ClubID"), semesterID);
            int totalScore = 0;
            int totalEventNormal = 0;
            int totalEventCompetition = 0;
            for (Integer studentID : listIDStudent) {
                totalEventNormal += eventDAO.getEventsScoreByStudentIDAndSemesterID(studentID, semesterID);
                totalEventCompetition += eventDAO.getEventsScoreCompetitionByStudentIDAndSemesterID(studentID, semesterID);
            }
            totalScore = totalEventNormal + totalEventCompetition;
            clubMap.put(rs.getString("ClubName"),totalScore);
        }
        
        Comparator<Map.Entry<String, Integer>> comparator = new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> entry1, Map.Entry<String, Integer> entry2) {
                return entry2.getValue().compareTo(entry1.getValue());
            }
        };

        PriorityQueue<Map.Entry<String, Integer>> pq = new PriorityQueue<>(comparator);

        for (Map.Entry<String, Integer> entry : clubMap.entrySet()) {
            pq.offer(entry);
        }

        List<Map.Entry<String, Integer>> result = new ArrayList<>();

        for (int i = 0; i < 5; i++) {
            result.add(pq.poll());
        }
        
        return result;
    }
}
