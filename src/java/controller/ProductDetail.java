/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Feedback;
import model.Product;

/**
 *
 * @author DUONG VIET DUY
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/detail"})
public class ProductDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int currentPage = 1;
        String id = request.getParameter("pid");
        String url = request.getRequestURI() + "?pid=" + id;
        System.out.println(url);
        session.setAttribute("prevUrl", url);
        DAO d = new DAO();
        List<Feedback> f = d.getAllFeedbackByPidPage(id, currentPage);
        if (f == null || f.isEmpty()) {
            request.setAttribute("noFeedback", "There are no feedback for this product!");
        } else {
            int endIndex = d.getAllFeedbackByPid(id).size() / 6;
            if (d.getAllFeedbackByPid(id).size() % 6 != 0) {
                endIndex++;
            }
            request.setAttribute("endIndex", endIndex);
        }

        List<Product> list = d.getAllProduct();
        List<Product> listLast = d.getLatestProduct();
        Cookie[] c = request.getCookies();
        String txt = "";
        if (c != null) {
            for (Cookie o : c) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        model.Cart cart = new model.Cart(txt, list);
        Product p = d.getProductByID(id);
        List<Category> listC = d.getAllCategory();
        request.setAttribute("size", cart.getList().size());
        request.setAttribute("detail", p);
        request.setAttribute("listF", f);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("listC", listC);
        request.setAttribute("listLast", listLast);
        request.setAttribute("cateID", d.getCidByPid(id));
        request.setAttribute("menu", "");
        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
