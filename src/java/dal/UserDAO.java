/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customer;
import model.Users;

/**
 *
 * @author minh1
 */
public class UserDAO extends DBContext {

    public Users login(String email, String pass) {
        String sql = "select * from Users\n"
                + "where email = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Users(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//
//    public Users loginAdmin(String email, String pass) {
//        String sql = "select * from Users\n"
//                + "where email = ? and pass = ? and roleID = 2";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, email);
//            st.setString(2, pass);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new Users(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getInt(9),
//                        rs.getInt(10));
//
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }

    public void changePass(String pass, String email) {
        String sql = "update Users\n"
                + "set email = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getSid(String email, String password) {
        int sid = -1;
        String sql = "select userID from Users where email = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sid = rs.getInt(1);
                System.out.println("sid " + sid);
            }
        } catch (Exception e) {
            System.out.println("Error in getSid: " + e.getMessage());
        }
        return sid;
    }

}
