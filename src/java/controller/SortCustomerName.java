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
import model.Feedback;

/**
 *
 * @author minh1
 */
@WebServlet(name = "SortCustomerName", urlPatterns = {"/sortCustomerName"})
public class SortCustomerName extends HttpServlet {

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
            out.println("<title>Servlet SortCustomerName</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortCustomerName at " + request.getContextPath() + "</h1>");
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
        String sort = request.getParameter("sortSelect");
        DAO d = new DAO();
        int currentPage = 1;
        request.setAttribute("menu", "feedbackList");
        request.setAttribute("currentPage", currentPage);
        if (sort.equals("atoz")) {
            List<Feedback> listF = d.getCustomerNameAscPage(currentPage);
            int endIndex = d.getAllCustomerNameAsc().size() / 6;
            if (d.getAllCustomerNameAsc().size() % 6 != 0) {
                endIndex++;
            }
            request.setAttribute("listFeedback", listF);
            request.setAttribute("endIndex", endIndex);
        }

        if (sort.equals("ztoa")) {
            List<Feedback> listF = d.getCustomerNameDescPage(currentPage);
            int endIndex = d.getAllCustomerNameDesc().size() / 6;
            if (d.getAllCustomerNameDesc().size() % 6 != 0) {
                endIndex++;
            }
            request.setAttribute("listFeedback", listF);
            request.setAttribute("endIndex", endIndex);
        }
//
//        if (sort.equals("1")) {
//            int cid = Integer.parseInt(sort);
//            List<Blog> listB = d.getBlogByCidPage(cid, currentPage);
//            int endIndex = d.getAllBlogByCid(cid).size() / 6;
//            if (d.getAllBlogByCid(cid).size() % 6 != 0) {
//                endIndex++;
//            }
//            request.setAttribute("listBlog", listB);
//            request.setAttribute("endIndex", endIndex);
//        }
//
//        if (sort.equals("2")) {
//            int cid = Integer.parseInt(sort);
//            List<Blog> listB = d.getBlogByCidPage(cid, currentPage);
//            int endIndex = d.getAllBlogByCid(cid).size() / 6;
//            if (d.getAllBlogByCid(cid).size() % 6 != 0) {
//                endIndex++;
//            }
//            request.setAttribute("listBlog", listB);
//            request.setAttribute("endIndex", endIndex);
//        }
//
//        if (sort.equals("3")) {
//            int cid = Integer.parseInt(sort);
//            List<Blog> listB = d.getBlogByCidPage(cid, currentPage);
//            int endIndex = d.getAllBlogByCid(cid).size() / 6;
//            if (d.getAllBlogByCid(cid).size() % 6 != 0) {
//                endIndex++;
//            }
//            request.setAttribute("listBlog", listB);
//            request.setAttribute("endIndex", endIndex);
//        }
//
//        if (sort.equals("4")) {
//            int cid = Integer.parseInt(sort);
//            List<Blog> listB = d.getBlogByCidPage(cid, currentPage);
//            int endIndex = d.getAllBlogByCid(cid).size() / 6;
//            if (d.getAllBlogByCid(cid).size() % 6 != 0) {
//                endIndex++;
//            }
//            request.setAttribute("listBlog", listB);
//            request.setAttribute("endIndex", endIndex);
//        }
//
//        if (sort.equals("Public")) {
//            List<Blog> listB = d.getAllBlogPageByStatus(currentPage, sort);
//            int endIndex = d.getAllBlogByStatus(sort).size() / 6;
//            if (d.getAllBlogByStatus(sort).size() % 6 != 0) {
//                endIndex++;
//            }
//            request.setAttribute("listBlog", listB);
//            request.setAttribute("endIndex", endIndex);
//        }
//
//        if (sort.equals("Private")) {
//            List<Blog> listB = d.getAllBlogPageByStatus(currentPage, sort);
//            int endIndex = d.getAllBlogByStatus(sort).size() / 6;
//            if (d.getAllBlogByStatus(sort).size() % 6 != 0) {
//                endIndex++;
//            }
        request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
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
