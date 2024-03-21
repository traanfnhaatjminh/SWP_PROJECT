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
        String detailID_raw = request.getParameter("detailID");
        String productId = request.getParameter("productId");
        DAO dao = new DAO();
        Product p = dao.getProductByID(productId);
        try {
            int detailID = Integer.parseInt(detailID_raw);
            if (customer != null) {
                request.setAttribute("accC", customer);
                request.setAttribute("p", p);
                request.setAttribute("detailID", detailID);
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String detailID_raw = request.getParameter("detailID");
        String customerId = request.getParameter("customerId");
        String rate = request.getParameter("rate");
        String content = request.getParameter("content");
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); // Định dạng ngày
        String dateString = dateFormat.format(currentDate);
        DAO dao = new DAO();
        Product p = dao.getProductByID(productId);
        try {
            int detailID = Integer.parseInt(detailID_raw);
            if (content == null || content.equals("")) {
                request.setAttribute("fail", "Please input content before send feedback!!!");
                request.setAttribute("p", p);
            } else {
                dao.addFeedback(customerId, content, productId, dateString, rate);
                dao.isFeedback(detailID);
                request.setAttribute("p", p);
                request.setAttribute("success", "Send feedback successfully.");
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
