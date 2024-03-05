/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class UserProfile {

    private int userProfileID;
    private String firstName;
    private String lastName;
    private String avatar;
    private String gender;
    private Date dateOfBirth;
    private String address;
    private Date enrollmentDate;
    private String email;
    private String phone;

    public UserProfile(int userProfileID, String firstName, String lastName, String avatar, String gender, Date dateOfBirth, String address, Date enrollmentDate, String email, String phone) {
        this.userProfileID = userProfileID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.enrollmentDate = enrollmentDate;
        this.email = email;
        this.phone = phone;
    }

    public UserProfile(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public int getUserProfileID() {
        return userProfileID;
    }

    public void setUserProfileID(int userProfileID) {
        this.userProfileID = userProfileID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getEnrollmentDate() {
        return enrollmentDate;
    }

    public void setEnrollmentDate(Date enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
