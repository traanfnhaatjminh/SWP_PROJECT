/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Users;

/**
 *
 * @author nguye
 */
public class orderDAO1 extends DBContext {

    public ArrayList<model.Order> getSearchbyStatusForSale(int sId, String value) {
        ArrayList<model.Order> data = new ArrayList<>();
        String sql = "select * from [Order] where [sellerID] = ? and [orderStatus] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sId);
            st.setString(2, value);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idO = rs.getInt(1);
                int idC = rs.getInt(2);
                String order_name = rs.getString("orderName");
                int order_discount = rs.getInt(4);
                String order_date = rs.getString("orderDate");
                String order_note = rs.getString("notes");
                String order_address = rs.getString("orderAddress");
                int order_phone = rs.getInt("orderPhone");
                String order_status = rs.getString("orderStatus");
                float total_cost = rs.getFloat("totalCost");
                int idS = rs.getInt(11);
                List<String> productName = getListProductByOrder1(idO);
                data.add(new Order(idO, idC, order_name, order_discount, order_date, order_note, order_address, order_phone, order_status, total_cost, idS, productName));
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return data;
    }

    public Customer getInforCustomerByOrder(int iod) {
        String sql = "SELECT *\n"
                + "FROM [Order] o\n"
                + "INNER JOIN Customer c ON o.customerID = c.customerID\n"
                + "WHERE o.orderID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, iod);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt("customerID"),
                        rs.getString("fullName"),
                        rs.getString("gender"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("avatar"));
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return null;
    }

    // orderDetail
    private String getProductImgByID(int productID) throws SQLException {
        String productIMG = "";
        try {
            if (connection != null) {
                String sql = "select image from product where id = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, productID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    productIMG = rs.getString("image");
                }
            }
        } catch (Exception e) {
            System.out.println("loi" + e.getMessage());
        }
        return productIMG;
    }

    public String getProductNameByID(int productId) throws SQLException {
        String productName = "";
        try {
            if (connection != null) {
                String sql = "select [name] from product where id = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, productId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    productName = rs.getString("name");
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return productName;
    }

    private int getProductCateIDByID(int productId) throws SQLException {
        int productCate = 0;
        try {
            if (connection != null) {
                String sql = "select cid from product where id = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, productId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    productCate = rs.getInt("cid");
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return productCate;
    }

    private String getCategoryNameByID(int categoryID) throws SQLException {
        String categoryName = "";
        try {
            if (connection != null) {
                String sql = "select * from Category where cid = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, categoryID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    categoryName = rs.getString("cname");
                }
            }
        } catch (Exception e) {
        }
        return categoryName;
    }

    public List<model.OrderDetail> getListProductByOrder(int oid) {
        ArrayList<model.OrderDetail> dataProduct = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM [orderDetail]\n"
                + "WHERE orderID = ?\n"
                + "ORDER BY detailID;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                int productID = rs.getInt(2);
                double productPrice = rs.getDouble(3);
                float totalCost = rs.getFloat(4);
                int quantity = rs.getInt(5);
                String product_img = getProductImgByID(productID);
                String product_name = getProductNameByID(productID);
                int cate = getProductCateIDByID(productID);
                String cateName = getCategoryNameByID(cate);
                dataProduct.add(new OrderDetail(orderID, productID, productPrice, quantity, totalCost, product_img, product_name, cateName));
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return dataProduct;
    }

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

    public ArrayList<Order> getOrderBySalePage(int index) throws SQLException {
        ArrayList<Order> dataOrders = new ArrayList<>();
        int id = (index - 1) * 5;
        try {
            if (connection != null) {
                String sql = "SELECT * \n"
                        + "FROM [Order]\n"
                        + "ORDER BY orderID ASC\n"
                        + "OFFSET ? ROWS\n"
                        + "FETCH NEXT 5 ROWS ONLY";

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, id);
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
            System.out.println("loi" + e.getMessage());
        }
        return dataOrders;
    }

    public List<String> getListNameProductForSale() throws SQLException {
        List<String> productNames = new ArrayList<>();

        try {
            if (connection != null) {
                String sql = "SELECT DISTINCT p.name\n"
                        + "FROM product p\n"
                        + "INNER JOIN orderDetail od ON p.id = od.productID\n"
                        + "INNER JOIN [Order] o ON o.orderID = od.orderID\n"
                        + "WHERE p.id IN (SELECT id FROM orderDetail)";

                PreparedStatement st = connection.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    String nameProduct = rs.getString("name");
                    productNames.add(nameProduct);
                }
            }
        } catch (SQLException e) {
            System.out.println("loi getListNameProduct: " + e.getMessage());
        }
        return productNames;
    }

    public boolean changeStatusSentOrder(int oid) throws SQLException {
        try {
            if (connection != null) {
                String sql = "UPDATE [Order]\n"
                        + "SET orderStatus = CASE  \n"
                        + "    WHEN orderStatus = '1' THEN '2'\n"
                        + "    ELSE orderStatus\n"
                        + "END\n"
                        + "WHERE orderID = ?;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid);
                int row = st.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println("loi changeStatusSussess" + e.getMessage());
        }
        return false;
    }

    public ArrayList<Order> getSearchbyNameProductForSale(int sid, String groupby) throws SQLException {
        ArrayList<Order> data = new ArrayList<>();

        try {
            if (connection != null) {
                String sql = "SELECT *\n"
                        + "FROM orderDetail AS od\n"
                        + "INNER JOIN product AS p ON od.productID = p.id\n"
                        + "INNER JOIN [Order] AS o ON o.orderID = od.orderID\n"
                        + "WHERE sellerID = ? AND p.name LIKE ?";

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sid);
                st.setString(2, "%" + groupby + "%");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int idO = rs.getInt(1);
                    int idC = rs.getInt(2);
                    String order_name = rs.getString("orderName");
                    int order_discount = rs.getInt(4);
                    String order_date = rs.getString("orderDate");
                    String order_note = rs.getString("notes");
                    String order_address = rs.getString("orderAddress");
                    int order_phone = rs.getInt("orderPhone");
                    String order_status = rs.getString("orderStatus");
                    float total_cost = rs.getFloat("totalCost");
                    int idS = rs.getInt(11);
                    List<String> productName = getListProductByOrder1(idO);
                    data.add(new Order(idO, idC, order_name, order_discount, order_date, order_note, order_address, order_phone, order_status, total_cost, idS, productName));
                };
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Order> getSearchOrderIdForSale(int searchValue) throws SQLException {
        ArrayList<Order> data = new ArrayList<>();
        try {
            if (connection != null) {
                String sql = "SELECT *\n"
                        + "FROM [Order]\n"
                        + "Where orderID = ?;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, searchValue);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int idO = rs.getInt(1);
                    int idC = rs.getInt(2);
                    String order_name = rs.getString("orderName");
                    int order_discount = rs.getInt(4);
                    String order_date = rs.getString("orderDate");
                    String order_note = rs.getString("notes");
                    String order_address = rs.getString("orderAddress");
                    int order_phone = rs.getInt("orderPhone");
                    String order_status = rs.getString("orderStatus");
                    float total_cost = rs.getFloat("totalCost");
                    int idS = rs.getInt(11);
                    List<String> productName = getListProductByOrder1(idO);
                    data.add(new Order(idO, idC, order_name, order_discount, order_date, order_note, order_address, order_phone, order_status, total_cost, idS, productName));
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return data;
    }

    public ArrayList<Order> getSearchOrderByCustomerforSale(String value) throws SQLException {
        ArrayList<Order> data = new ArrayList<>();
        try {
            if (connection != null) {
                String sql = "SELECT *\n"
                        + "FROM [Order]\n"
                        + "where orderName LIKE ?;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, value);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int idO = rs.getInt(1);
                    int idC = rs.getInt(2);
                    String order_name = rs.getString("orderName");
                    int order_discount = rs.getInt(4);
                    String order_date = rs.getString("orderDate");
                    String order_note = rs.getString("notes");
                    String order_address = rs.getString("orderAddress");
                    int order_phone = rs.getInt("orderPhone");
                    String order_status = rs.getString("orderStatus");
                    float total_cost = rs.getFloat("totalCost");
                    int idS = rs.getInt(11);
                    List<String> productName = getListProductByOrder1(idO);
                    data.add(new Order(idO, idC, order_name, order_discount, order_date, order_note, order_address, order_phone, order_status, total_cost, idS, productName));
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return data;
    }

    public ArrayList<Order> getOrdersByDateRangeBySale(String startDateStr, String endDateStr) throws SQLException {
        ArrayList data = new ArrayList();
        try {
            if (connection != null) {
                String sql = "SELECT *\n"
                        + "FROM [Order]\n"
                        + "where orderDate BETWEEN ? AND ?;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, startDateStr);
                st.setString(2, endDateStr);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int idO = rs.getInt(1);
                    int idC = rs.getInt(2);
                    String order_name = rs.getString("orderName");
                    int order_discount = rs.getInt(4);
                    String order_date = rs.getString("orderDate");
                    String order_note = rs.getString("notes");
                    String order_address = rs.getString("orderAddress");
                    int order_phone = rs.getInt("orderPhone");
                    String order_status = rs.getString("orderStatus");
                    float total_cost = rs.getFloat("totalCost");
                    int idS = rs.getInt(11);
                    List<String> productName = getListProductByOrder1(idO);
                    data.add(new Order(idO, idC, order_name, order_discount, order_date, order_note, order_address, order_phone, order_status, total_cost, idS, productName));
                }
            }
        } catch (Exception e) {
        }
        return data;
    }

    public boolean changeStatusSussess(int oid) throws SQLException {
        try {
            if (connection != null) {
                String sql = "UPDATE [Order]\n"
                        + "SET orderStatus = CASE\n"
                        + "    WHEN orderStatus = '2' THEN '3'\n"
                        + "    ELSE orderStatus\n"
                        + "END\n"
                        + "WHERE orderID = ?;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid);
                int row = st.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return false;
    }

    public void changeStatusCancel1(int oid, List<OrderDetail> list) throws SQLException {
        try {
            if (connection != null) {
                String sql = "UPDATE [Order]\n"
                        + "SET orderStatus = CASE  \n"
                        + "    WHEN orderStatus = '1' OR orderStatus = '2' THEN '4'\n"
                        + "    ELSE orderStatus\n"
                        + "END\n"
                        + "WHERE orderID = ?;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid);
                st.executeUpdate();
                for (OrderDetail orderDetail : list) {
                    String updateProductQuantitySql = "select * from product\n"
                            + "UPDATE product \n"
                            + "SET quantity = quantity + ? \n"
                            + "WHERE id = ?";
                    try ( PreparedStatement updateProductQuantity = connection.prepareStatement(updateProductQuantitySql)) {
                        updateProductQuantity.setInt(1, orderDetail.getQuantity());
                        updateProductQuantity.setInt(2, orderDetail.getProductID());
                        updateProductQuantity.executeUpdate();
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
    }

    // phan cua orderDetail
    public Order getOrderByid(int oid) throws SQLException {
        try {
            if (connection != null) {
                String sql = "select * from [Order] \n"
                        + "where orderID = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    return new Order(
                            rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getInt(8),
                            rs.getString(9),
                            rs.getFloat(10),
                            rs.getInt(11));

                }
            }
        } catch (Exception e) {
            System.out.println("loi" + e.getMessage());
        }
        return null;
    }

    public boolean changeStaffForOrders(int oid, int idS) throws SQLException {
        try {
            if (connection != null) {
                String sql = "UPDATE [Order]\n"
                        + "SET sellerID = ?\n"
                        + "WHERE orderID = ?;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid);
                st.setInt(1, idS);
                int row = st.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return false;
    }

    public String getfullnameStaffByOrder(int oid) throws SQLException {
        String fullname = "";
        try {
            if (connection != null) {
                String sql = "SELECT s.userName\n"
                        + "FROM Users s\n"
                        + "INNER JOIN [Order] o ON o.sellerID = s.userID\n"
                        + "WHERE o.orderID = ? AND s.roleID = 1;";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, oid);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    fullname = rs.getString(1);
                }
            }
        } catch (Exception e) {
        }
        return fullname;
    }

    public int getNumberPage() {
        String sql = "select  count(*) from [Order]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;

                countPage = total / 5;
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<model.Users> getListNameStaff() throws SQLException {
        List<Users> staffList = new ArrayList<>();
        try {
            String sql = "SELECT userID, userName\n"
                    + "FROM Users\n"
                    + "WHERE roleID = 1;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int staffId = rs.getInt("userID");
                String staffName = rs.getString("userName");
                Users staffInfo = new Users(staffId, staffName);
                staffList.add(staffInfo);
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return staffList;
    }

    public static void main(String[] args) throws SQLException {
        orderDAO1 orderDAO = new orderDAO1();
//        try {
//            // Gọi phương thức getOrderBySalePage với index là 1
//            ArrayList<Order> orders = orderDAO.getOrderBySalePage(1);
//
//            // In ra thông tin các đơn hàng
//            for (Order order : orders) {
//                System.out.println("Order ID: " + order.getOrderID());
//                System.out.println("Order Name: " + order.getOrderName());
//                System.out.println("Order Discount: " + order.getOrderDiscount());
//                System.out.println("Order Date: " + order.getOrderDate());
//                System.out.println("Order Address: " + order.getOrderAddress());
//                System.out.println("Order Phone: " + order.getOrderPhone());
//                System.out.println("Order Status: " + order.getOrderStatus());
//                System.out.println("Total Cost: " + order.getTotalCost());
//                System.out.println("-----------------------------------");
//            }
//        } catch (SQLException e) {
//            System.out.println("Error: " + e.getMessage());
//        }

        int orderId = 123; // Thay thế bằng orderId cụ thể bạn muốn kiểm thử
        String fullname = orderDAO.getfullnameStaffByOrder(2);
        System.out.println("Fullname of the staff associated with order ID " + orderId + ": " + fullname);
    }
}
