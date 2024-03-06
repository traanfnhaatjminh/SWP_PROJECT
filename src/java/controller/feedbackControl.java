package controller;

import dal.CustomerDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Customer;
import model.Product;

@WebServlet(name = "feedbackControl", urlPatterns = {"/feedback"})
public class feedbackControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("accC");
        String productId = request.getParameter("productId");
        DAO dao = new DAO();
        Product p = dao.getProductByID(productId);

        if (customer != null) {
            request.setAttribute("accC", customer);
            request.setAttribute("p", p);
            request.getRequestDispatcher("Feedback.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String customerId = request.getParameter("customerId");
        String rate = request.getParameter("rate");
        String content = request.getParameter("content");
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); // Định dạng ngày
        String dateString = dateFormat.format(currentDate);
        DAO dao = new DAO();
        dao.addFeedback(customerId, content, productId, dateString, rate);
        response.sendRedirect("order");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
