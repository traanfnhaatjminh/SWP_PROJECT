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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.BlogCategory;
import model.Category;

/**
 *
 * @author minh1
 */
@WebServlet(name = "searchBlog", urlPatterns = {"/searchBlog"})
public class searchBlog extends HttpServlet {

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
            out.println("<title>Servlet searchBlog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchBlog at " + request.getContextPath() + "</h1>");
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
        String search = request.getParameter("searchBlog");
        if (search == null || search.equals("")) {
            DAO d = new DAO();
            List<Blog> listB = d.getAllBlog();
            List<Category> listC = d.getAllCategory();
            List<BlogCategory> listBC = d.getAllBlogCategory();
            Blog b = new Blog();
            b = d.getLatestBlog();
            request.setAttribute("listBlog", listB);
            request.setAttribute("listC", listC);
            request.setAttribute("listBlogCategory", listBC);
            request.setAttribute("latestBlog", b);
            request.setAttribute("error", "Please input to search!!!");
        } else {
            DAO d = new DAO();
            List<Blog> listB = d.getAllBlogSearch(search);
            if (listB.isEmpty()) {
                List<Category> listC = d.getAllCategory();
                List<BlogCategory> listBC = d.getAllBlogCategory();
                Blog b = new Blog();
                b = d.getLatestBlog();
                request.setAttribute("listC", listC);
                request.setAttribute("listBlogCategory", listBC);
                request.setAttribute("latestBlog", b);
                request.setAttribute("searchValue", search);
                request.setAttribute("error", "No found result!!!");
            } else {
                List<Category> listC = d.getAllCategory();
                List<BlogCategory> listBC = d.getAllBlogCategory();
                Blog b = new Blog();
                b = d.getLatestBlog();
                request.setAttribute("listBlog", listB);
                request.setAttribute("listC", listC);
                request.setAttribute("listBlogCategory", listBC);
                request.setAttribute("latestBlog", b);
                request.setAttribute("searchValue", search);
            }
        }
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
