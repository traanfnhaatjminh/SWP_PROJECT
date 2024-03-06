package controller;

import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Customer;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;

@WebServlet(name = "ReBuyControl", urlPatterns = {"/re-buy"})
public class ReBuyControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        OrderDAO orderDao = new OrderDAO();
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            Order o = orderDao.getOrdersByOrderId(orderId);
            ArrayList<OrderDetail> listOrderDetail = orderDao.getOrderDetailByOrderID(orderId);
            model.Cart cart = new model.Cart();
            if (listOrderDetail != null) {
                for (OrderDetail oi : listOrderDetail) {
                    Product p = dao.getProductByID(oi.getProductID() + "");
                    Item i = new Item(p,oi.getQuantity(),oi.getProductPrice());
                    cart.addItem(i);
                }
            }
            request.setAttribute("order", o);
            request.setAttribute("cart", cart);
            request.setAttribute("customer", customer);
            request.setAttribute("listOrderDetail", listOrderDetail);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
