/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author minh1
 */
public class Users {

    private int userID;
    private String userName;
    private String gender;
    private String email;
    private String mobile;
    private String avatar;
    private String address;
    private String password;
    private int roleID;
    private double userPoint;

    public Users() {
    }

    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, String password, int roleID, double userPoint) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.password = password;
        this.roleID = roleID;
        this.userPoint = userPoint;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public double getUserPoint() {
        return userPoint;
    }

    public void setUserPoint(double userPoint) {
        this.userPoint = userPoint;
    }

}
