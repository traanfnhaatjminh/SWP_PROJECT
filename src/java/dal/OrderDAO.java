package dal;

import java.util.Date;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.Cart;
import model.Customer;
import model.Item;
import model.Users;

/**
 *
 * @author DELL
 */
public class OrderDAO extends DBContext {

    public void addOrder(String name, String phone, String address, String email,
            String gender, String notes, Cart cart, Customer customer,
            String orderStatus, float totalCost, int sellerID) {
        System.out.println(phone);
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        System.out.println(timestamp);
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([customerID]\n"
                    + "           ,[orderName]\n"
                    + "           ,[orderDiscount]\n"
                    + "           ,[orderDate]\n"
                    + "           ,[notes]\n"
                    + "           ,[orderAddress]\n"
                    + "           ,[orderPhone]\n"
                    + "           ,[orderStatus]\n"
                    + "           ,[totalCost]"
                    + "           ,[sellerID])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement stOrder = connection.prepareStatement(sql);
            stOrder.setInt(1, customer.getCustomerID());
            stOrder.setString(2, name);
            stOrder.setInt(3, 0);
            stOrder.setTimestamp(4, timestamp);
            stOrder.setString(5, notes);
            stOrder.setString(6, address);
            stOrder.setString(7, phone);
            stOrder.setString(8, orderStatus);
            stOrder.setFloat(9, totalCost);
            stOrder.setInt(10, sellerID);
            stOrder.executeUpdate();
            // 
        } catch (SQLException e) {
            System.out.println(e);
        }

        //Lay ra id cua order vua add
        String sql1 = "select top 1 orderID from [dbo].[Order]\n order by orderID desc";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //Add vao bang orderline

            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getList()) {
                    String sql2 = "INSERT INTO [dbo].[orderDetail]\n"
                            + "           ([orderID]\n"
                            + "           ,[productID]\n"
                            + "           ,[productPrice]\n"
                            + "           ,[quantity]\n"
                            + "           ,[totalCost])\n"
                            + "     VALUES\n"
                            + "           (?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setDouble(3, i.getProduct().getSale_price());
                    st2.setInt(4, i.getQuantity());
                    st2.setDouble(5, i.getPrice());
                    st2.executeUpdate();
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        try {
            //update so luong trong bang Product sau khi ban
            String sql3 = "update product set quantity = quantity - ? "
                    + "where id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getList()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
