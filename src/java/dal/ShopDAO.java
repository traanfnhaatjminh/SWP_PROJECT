package dal;

import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class ShopDAO extends DBContext {

    public String getTotalProductPrice(int orderID) {
        String sql = "SELECT totalCost AS totalCost FROM orderDetail WHERE orderid = ?";
        String res = "";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            Locale locale = new Locale("vi", "VN");
            NumberFormat number = NumberFormat.getCurrencyInstance(locale);
            while (rs.next()) {
                double totalPrice = rs.getDouble("totalCost");
                res = number.format(totalPrice);
            }
        } catch (Exception ex) {
            System.out.println("Get TotalPrice: " + ex.getMessage());
        }
        return res;
    }

    public static void main(String[] args) throws Exception {
        // Tạo một đối tượng của lớp chứa phương thức getTotalProductPrice
        ShopDAO dao = new ShopDAO(); // Thay YourClass bằng tên lớp thực tế của bạn

        // Gọi phương thức getTotalProductPrice với một orderID cụ thể
        int orderID = 1; // Thay 1 bằng orderID bạn muốn kiểm thử
        String totalPrice = dao.getTotalProductPrice(orderID);

        // In ra kết quả
        System.out.println("Total price for order ID " + orderID + ": " + totalPrice);
    }

}
