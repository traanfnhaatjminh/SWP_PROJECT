/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customer;

/**
 *
 * @author DUONG VIET DUY
 */
public class CustomerDAO extends DBContext {

    public Customer Login(String email, String pass) {
        String sql = "select * from Customer\n"
                + "where [email] = ? AND [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateInfor(String fullName, String gender, String phone, String address, String avatar, int customerID) {
        String sql = "update Customer set fullName = ?, gender=?,phone=?,[address]=?,avatar=? where customerID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, gender);
            st.setString(3, phone);
            st.setString(4, address);
            st.setString(5, avatar);
            st.setInt(6, customerID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Customer check(String email, String password) {
        String sql = "  select * from Customer where [email] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void changePass(String pass, String email) {
        String sql = "update Customer set [password] = ? where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Customer getCustomerbyId(String cid) {
        String sql = "  select * from Customer where [customerID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Customer checkAccount(String email) {
        String sql = "select * from Customer\n"
                + "where [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer register(String fullName, String gender, String phone, String email, String password, String address) {
        String sql = "INSERT INTO Customer\n"
                + "VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullName);
            st.setString(2, gender);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, password);
            st.setString(6, address);
            st.setString(7, "");
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
