/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manageProduct;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author DUONG VIET DUY
 */
@WebServlet(name = "EditProduct", urlPatterns = {"/editProduct"})
public class EditProduct extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBlog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBlog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String id_raw = request.getParameter("id");
        DAO d = new DAO();
        Product p = d.getProductByID(id_raw);
        List<Category> listC = d.getAllCategory();

        request.setAttribute("detail", p);
        request.setAttribute("listCategory", listC);
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
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
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String o_price_raw = request.getParameter("original_price");
        String s_price_raw = request.getParameter("sale_price");
        String quantity_raw = request.getParameter("quantity");
        String describe = request.getParameter("describe");
        String category_raw = request.getParameter("category");
        DAO d = new DAO();
        double original_price = Double.parseDouble(o_price_raw);
        double sale_price = Double.parseDouble(s_price_raw);
        int quantity = Integer.parseInt(quantity_raw);
        int category = Integer.parseInt(category_raw);
        int id = Integer.parseInt(id_raw);
        d.editProduct(name, original_price, sale_price, quantity, describe, image, category, id);
        request.setAttribute("success", "Edit product successfully");
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
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
