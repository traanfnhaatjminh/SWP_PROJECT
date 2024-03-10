package controller.Order;

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

@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String searchDate = "";
        if(startDate != null && endDate != null){
            searchDate = "[orderDate] between '"+ startDate+"' AND '"+endDate+"'";
        }
        OrderDAO orderDao = new OrderDAO();
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("accC");
        if (customer != null) {
            ArrayList<Order> listOrder = orderDao.getOrdersByCustomerId(customer.getCustomerID(), searchDate);
            ArrayList<OrderDetail> listOrderDetail = orderDao.getOrderDetailByCustomerID(customer.getCustomerID());
            if(listOrderDetail != null){
                for(OrderDetail oi : listOrderDetail){
                    Product p = dao.getProductByID(oi.getProductID()+"");
                    oi.setProduct(p);
                }
                    System.out.println(listOrderDetail);
            }
            request.setAttribute("listOrder", listOrder);
            request.setAttribute("listOrderDetail", listOrderDetail);
            request.getRequestDispatcher("myorder.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
