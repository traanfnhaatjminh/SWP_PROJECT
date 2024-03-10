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
    private String user_role_name;
    private int roleID;
    private float userPoint;
    private int user_status;
    
    public Users() {
    }

    public Users(int userID, String userName) {
        this.userID = userID;
        this.userName = userName;
    }

    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, int roleID, int user_status) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.roleID = roleID;
        this.user_status = user_status;
    }

    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, String user_role_name, int user_status) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.user_role_name = user_role_name;
        this.user_status = user_status;
    }
    
    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, String password, int roleID, float userPoint, int user_status) {
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
        this.user_status = user_status;
    }
    
    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, String password, String user_role_name, int roleID, float userPoint) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.password = password;
        this.user_role_name = user_role_name;
        this.roleID = roleID;
        this.userPoint = userPoint;
    }

    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, String user_role_name) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.user_role_name = user_role_name;
    }
    
    
    public Users(String userName, String gender, String email, String mobile, String avatar, String address, String password, int roleID) {
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.password = password;
        this.roleID = roleID;
    }

    public Users(int userID, String userName, String gender, String email, String mobile, String address, String user_role_name) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
        this.user_role_name = user_role_name;
    }

    public String getUser_role_name() {
        return user_role_name;
    }

    public void setUser_role_name(String user_role_name) {
        this.user_role_name = user_role_name;
    }

    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, String password, int roleID, float userPoint) {
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

    public Users(String userName, String gender, String email, String mobile, String avatar, String address, int roleID) {
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.roleID = roleID;
    }

    public Users(int userID, String userName, String gender, String email, String mobile, String avatar, String address, int roleID) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.avatar = avatar;
        this.address = address;
        this.roleID = roleID;
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

    public float getUserPoint() {
        return userPoint;
    }

    public void setUserPoint(float userPoint) {
        this.userPoint = userPoint;
    }

    public int getUser_status() {
        return user_status;
    }

    public void setUser_status(int user_status) {
        this.user_status = user_status;
    }
    
}
