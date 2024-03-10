package dal;

import java.util.Date;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Cart;
import model.Customer;
import model.Item;
import model.Order;
import model.OrderDetail;
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
                    st2.setDouble(5, i.getPrice() * i.getQuantity());
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

    public ArrayList<Order> getOrdersByCustomerId(int customerId,String searchDate) {
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT  [orderID]\n"
                + "      ,[customerID]\n"
                + "      ,[orderName]\n"
                + "      ,[orderDiscount]\n"
                + "      ,[orderDate]\n"
                + "      ,[notes]\n"
                + "      ,[orderAddress]\n"
                + "      ,[orderPhone]\n"
                + "      ,[orderStatus]\n"
                + "      ,[totalCost]\n"
                + "      ,[sellerID]\n"
                + "  FROM [Swp_Project].[dbo].[Order]\n"
                + "  WHERE customerID = ?";
        if(!searchDate.equals("")){
            sql += " AND "+ searchDate;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getFloat(10), rs.getInt(11));
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Order getOrdersByOrderId(String orderId) {
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT  [orderID]\n"
                + "      ,[customerID]\n"
                + "      ,[orderName]\n"
                + "      ,[orderDiscount]\n"
                + "      ,[orderDate]\n"
                + "      ,[notes]\n"
                + "      ,[orderAddress]\n"
                + "      ,[orderPhone]\n"
                + "      ,[orderStatus]\n"
                + "      ,[totalCost]\n"
                + "      ,[sellerID]\n"
                + "  FROM [Swp_Project].[dbo].[Order]\n"
                + "  WHERE orderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, orderId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order o = new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getFloat(10), rs.getInt(11));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<OrderDetail> getOrderDetailByCustomerID(int customerId) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT od.orderID\n"
                + "      ,[productID]\n"
                + "      ,[productPrice]\n"
                + "      ,[quantity]\n"
                + "      ,od.totalCost\n"
                + "  FROM [Swp_Project].[dbo].[orderDetail] od\n"
                + "  JOIN [Order] o ON o.orderID = od.orderID\n"
                + "  WHERE o.customerID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getInt(4), rs.getDouble(5));
                list.add(od);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public ArrayList<OrderDetail> getOrderDetailByOrderID(String orderId) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            if (connection != null) {
                String sql = "SELECT od.orderID\n"
                        + "      ,[productID]\n"
                        + "      ,[productPrice]\n"
                        + "      ,[quantity]\n"
                        + "      ,od.totalCost\n"
                        + "  FROM [Swp_Project].[dbo].[orderDetail] od\n"
                        + "  JOIN [Order] o ON o.orderID = od.orderID\n"
                        + "  WHERE od.orderID = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, orderId);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    OrderDetail od = new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getInt(4), rs.getDouble(5));
                    list.add(od);
                }
                return list;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public static void main(String[] args) {
        // Tạo một đối tượng của lớp có phương thức getOrderDetailByOrderID
        OrderDAO main = new OrderDAO();

        // Gọi phương thức getOrderDetailByOrderID và in kết quả
        ArrayList<OrderDetail> orderDetails = main.getOrderDetailByOrderID("3");
        if (orderDetails != null) {
            for (OrderDetail orderDetail : orderDetails) {
                System.out.println("ten san pham " + orderDetail.getTotalCost());
            }
        } else {
            System.out.println("Không có chi tiết đơn hàng được trả về.");
        }
    }
}
