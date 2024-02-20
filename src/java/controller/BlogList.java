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
import java.util.List;
import model.Blog;
import model.BlogCategory;
import model.Category;
import model.Product;

/**
 *
 * @author minh1
 */
@WebServlet(name = "BlogList", urlPatterns = {"/blog"})
public class BlogList extends HttpServlet {

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
            out.println("<title>Servlet BlogList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogList at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        String active = request.getParameter("menu");
        int currentPage = 1;
        DAO d = new DAO();
        List<Category> listC = d.getAllCategory();
        List<BlogCategory> listBC = d.getAllBlogCategory();
        List<Blog> listB = d.getAllBlogPageByStatus(currentPage, "Public");
        int endIndex = d.getAllBlogByStatus("Public").size() / 6;
        if (d.getAllBlogByStatus("Public").size() % 6 != 0) {
            endIndex++;
        }
        Blog b = new Blog();
        b = d.getLatestBlog();
        List<Product> list = d.getAllProduct();
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
        request.setAttribute("listBlogCategory", listBC);
        request.setAttribute("listBlog", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("latestBlog", b);
        request.setAttribute("menu", active);
        request.setAttribute("endIndex", endIndex);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("size", cart.getList().size());
        request.getRequestDispatcher("blog.jsp").forward(request, response);
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
