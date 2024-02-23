/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Users;

/**
 *
 * @author nguye
 */
public class UserEditDAO extends DBContext {

    public void addNewUser(Users u) throws SQLException {
        String sql = "INSERT INTO Users(userName, gender, email, mobile,\n"
                + "                avatar, [address], pass, roleID) \n"
                + "VALUES (?, ?, ?, ?,\n"
                + "        ?, ?, ?, ?);";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, u.getUserName());
            st.setString(2, u.getGender());
            st.setString(3, u.getEmail());
            st.setString(4, u.getMobile());
            st.setString(5, u.getAvatar());
            st.setString(6, u.getAddress());
            st.setString(7, u.getPassword());
            st.setInt(8, u.getRoleID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("error add user" + e.getMessage());
        }
    }

    public void updateUserAdmin(Users u) throws SQLException {

        try {
            if (connection != null) {
                String sql = "UPDATE Users SET userName = ?, gender = ?, email = ?, mobile = ?, avatar = ?, [address] = ?, roleID = ? WHERE userID = ?";
                PreparedStatement st;
                st = connection.prepareStatement(sql);
                st.setString(1, u.getUserName());
                st.setString(2, u.getGender());
                st.setString(3, u.getEmail());
                st.setString(4, u.getMobile());
                st.setString(5, u.getAvatar());
                st.setString(6, u.getAddress());
                st.setInt(7, u.getRoleID());
                st.setInt(8, u.getUserID());
                st.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("loi" + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
    try {
        // Tạo một đối tượng Users mới với thông tin cần cập nhật
        Users usersToUpdate = new Users(2,"ngu", "lon", "ngu@gmail.com", "0333201787", "a", "hanoi", 2);
        
        // Tạo một đối tượng UserEditDAO để thực hiện cập nhật
        UserEditDAO userEditDAO = new UserEditDAO();
        
        // Gọi phương thức updateUserAdmin để cập nhật thông tin của người dùng
        userEditDAO.updateUserAdmin(usersToUpdate);
        
        // Thông báo cập nhật thành công
        System.out.println("Cập nhật thông tin người dùng thành công!");
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu có lỗi xảy ra
        System.out.println("Lỗi khi cập nhật thông tin người dùng: " + e.getMessage());
    }
}

}
