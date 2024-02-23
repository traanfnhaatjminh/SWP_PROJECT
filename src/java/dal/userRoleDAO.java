/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Roles;

/**
 *
 * @author nguye
 */
public class userRoleDAO extends DBContext{
    public List<Roles> getAllUserRole() throws SQLException {
        List<Roles> list = new ArrayList<>();
        String sql = "select * from Roles";
        try {
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Roles roles = new Roles(
                        rs.getInt(1),
                        rs.getString(2));
                list.add(roles);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
