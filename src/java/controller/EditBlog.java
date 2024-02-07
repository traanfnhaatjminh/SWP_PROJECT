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
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Blog;

/**
 *
 * @author minh1
 */
@WebServlet(name = "EditBlog", urlPatterns = {"/editBlog"})
public class EditBlog extends HttpServlet {

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
        try {
            int blogID = Integer.parseInt(id_raw);
            DAO d = new DAO();
            Blog blog = new Blog();
            blog = d.getBlogDetailByID(blogID);
            request.setAttribute("blog", blog);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("EditBlog.jsp").forward(request, response);
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
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        String date1 = request.getParameter("date");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        String status = request.getParameter("status");
        String blogCateID_raw = request.getParameter("blogCateID");
        try {
            int blogCateID = Integer.parseInt(blogCateID_raw);
            int id = Integer.parseInt(id_raw);
            DAO d = new DAO();
            d.editBlog(title, image, date1, content, author, status, blogCateID, id);
            request.setAttribute("success", "Edit blog successfully");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Please enter number in blogCateID from 1 to 4!!!Enter again.");
            System.out.println(e);
        }
        request.getRequestDispatcher("EditBlog.jsp").forward(request, response);
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
