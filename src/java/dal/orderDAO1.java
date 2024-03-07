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
                if(rs.next()) {
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

    public ArrayList<Order> getOrderBySalePage(int index, int sid) throws SQLException {
        ArrayList<Order> dataOrders = new ArrayList<>();
        int id = (index - 1) * 5;
        try {
            if (connection != null) {
                String sql = "SELECT * FROM [Order]\n"
                        + "WHERE sellerID = ?\n"
                        + "ORDER BY orderID ASC\n"
                        + "OFFSET ?  ROWS\n"
                        + "FETCH NEXT 5 ROWS ONLY;";

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sid);
                st.setInt(2, id);
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
                    dataOrders.add(new Order(idO, idC, order_name, order_discount, order_date, order_note, order_address, order_phone, order_status, total_cost, idS, productName));
                }
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return dataOrders;
    }

    public List<String> getListNameProductForSale(int sid) throws SQLException {
        List<String> productNames = new ArrayList<>();

        try {
            if (connection != null) {
                String sql = "SELECT DISTINCT p.name\n"
                        + "FROM product p\n"
                        + "INNER JOIN orderDetail od ON p.id = od.productID\n"
                        + "INNER JOIN [Order] o ON o.orderID = od.orderID\n"
                        + "WHERE p.id IN (SELECT id FROM orderDetail)\n"
                        + "  AND o.sellerID = ?";

                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sid);
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

    public ArrayList<Order> getSearchOrderIdForSale(int sId, int searchValue) throws SQLException {
        ArrayList<Order> data = new ArrayList<>();
        try {
            if (connection != null) {
                String sql = "select * from [Order] \n"
                        + "where sellerID = ?\n"
                        + "and orderID = ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sId);
                st.setInt(2, searchValue);
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

    public ArrayList<Order> getSearchOrderByCustomerforSale(int sid, String value) throws SQLException {
        ArrayList<Order> data = new ArrayList<>();
        try {
            if (connection != null) {
                String sql = "select * from [Order]\n"
                        + "where sellerID = ?\n"
                        + "and orderName like ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sid);
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
            }
        } catch (SQLException e) {
            System.out.println("loi" + e.getMessage());
        }
        return data;
    }

    public ArrayList<Order> getOrdersByDateRangeBySale(int sId, String startDateStr, String endDateStr) throws SQLException {
        ArrayList data = new ArrayList();
        try {
            if (connection != null) {
                String sql = "select * from [Order]\n"
                        + "where sellerID = ?\n"
                        + "and orderDate between ? and ?";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, sId);
                st.setString(2, startDateStr);
                st.setString(3, endDateStr);
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

    public static void main(String[] args) throws SQLException, SQLException, SQLException {
        // Tạo một đối tượng DAO để gọi hàm getOrderBySalePage
        orderDAO1 dao = new orderDAO1();
        // In ra kết quả
        int orderIdToRetrieve = 1;
        
        Order order = dao.getOrderByid(orderIdToRetrieve);
        boolean success = dao.changeStatusSentOrder(1);
        ArrayList<Order> orders = dao.getOrderBySalePage(1, 1);
        List<OrderDetail> list = dao.getListProductByOrder(1); // Thay 1, 1 bằng giá trị thích hợp của sellerID và orderStatusID
        List<String> productNames = dao.getListNameProductForSale(1);
        System.out.println("Danh sach san pham");
        // Gọi phương thức để lấy danh sách sản phẩm của đơn hàng
        List<OrderDetail> productList = dao.getListProductByOrder(1);
        // Gọi phương thức để lấy thông tin khách hàng của đơn hàng
        Customer customer = dao.getInforCustomerByOrder(1);
        // Kiểm tra xem thông tin khách hàng có tồn tại không
       for (String productName : productNames) {
                System.out.println(productName);
            }
    }   
}
