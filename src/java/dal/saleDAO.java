/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author nguye
 */
public class saleDAO extends DBContext {

    public List<String> getListProductByOrder1(int oid) throws SQLException {
        List<String> productNames = new ArrayList<>();
        try {
            if (connection != null) {
                String sql = "SELECT p.[name] \n"
                        + "FROM [orderDetail] od \n"
                        + "INNER JOIN product p ON od.productID = p.id\n"
                        + "WHERE od.orderID = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    String nameProduct = rs.getString("name");
                    productNames.add(nameProduct);
                }
            }
        } catch (SQLException e) {
            System.out.println("loi getListProductByOrder " + e.getMessage());
        }
        return productNames;
    }

    public List<String> getListNameProductForSale(int sId) throws SQLException {
        List<String> productNames = new ArrayList<>();

        try {
            if (connection != null) {
                String sql = "SELECT DISTINCT p.name\n"
                        + "FROM product p\n"
                        + "INNER JOIN orderDetail od ON p.id = od.productID\n"
                        + "INNER JOIN [Order] o ON o.orderID = od.orderID\n"
                        + "Where p.id in (select id from orderDetail)\n"
                        + "and sellerID = ?";

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sId);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    String nameProduct = rs.getString("name");
                    productNames.add(nameProduct);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getListNameProduct: " + e.getMessage());
        }
        return productNames;
    }

    public ArrayList<Order> getOrderBySalepage(int index, int sid) throws SQLException {
        ArrayList<Order> dataOrders = new ArrayList<>();
        int id = (index - 1) * 5;
        try {
            if (connection != null) {
                String sql = "SELECT *\n"
                        + "FROM [Order]\n"
                        + "where sellerID = ?\n"
                        + "ORDER BY orderID ASC\n"
                        + "OFFSET ? ROWS\n"
                        + "FETCH NEXT 5 ROWS ONLY";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sid);
                st.setInt(2, id);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int idO = rs.getInt("orderID");
                    int idC = rs.getInt("customerID");
                    String order_name = rs.getString("orderName");
                    int order_discount = rs.getInt(4);
                    String order_date = rs.getString("orderDate");
                    String order_note = rs.getString("notes");
                    String order_address = rs.getString("orderAddress");
                    int order_phone = rs.getInt("orderPhone");
                    String order_status = rs.getString("orderStatus");
                    float total_cost = rs.getFloat("totalCost");
                    int idS = rs.getInt("sellerID");
                    List<String> productName = getListProductByOrder1(idO);
                    dataOrders.add(new Order(idO, idC, order_name, order_discount, order_date, order_note, order_address, order_phone, order_status, total_cost, idS, productName));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
        }
        return dataOrders;
    }

}
