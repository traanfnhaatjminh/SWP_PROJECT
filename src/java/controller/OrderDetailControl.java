package controller;

import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;

@WebServlet(name = "OrderDetailControl", urlPatterns = {"/orderDetail"})
public class OrderDetailControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderID");
        OrderDAO orderDao = new OrderDAO();
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("accC");
        if (customer != null) {
            Order o = orderDao.getOrdersByOrderId(orderId);
            ArrayList<OrderDetail> listOrderDetail = orderDao.getOrderDetailByOrderID(orderId);
            if (listOrderDetail != null) {
                for (OrderDetail oi : listOrderDetail) {
                    Product p = dao.getProductByID(oi.getProductID() + "");
                    oi.setProduct(p);
                }
                System.out.println(listOrderDetail);
            }
            request.setAttribute("order", o);
            request.setAttribute("accC",customer);
            request.setAttribute("listOrderDetail", listOrderDetail);
            request.getRequestDispatcher("OrderDetail_1.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
