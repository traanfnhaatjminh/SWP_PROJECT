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

/**
 *
 * @author minh1
 */
@WebServlet(name = "FilterPost", urlPatterns = {"/filterPost"})
public class FilterPost extends HttpServlet {

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
            out.println("<title>Servlet FilterPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterPost at " + request.getContextPath() + "</h1>");
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
        String[] selectedCategories = request.getParameterValues("categories");
        String[] selectedStatus = request.getParameterValues("status");
        DAO d = new DAO();
        int currentPage = 1;
        List<Blog> filteredBlogs = null;
        List<BlogCategory> listBC = d.getAllBlogCategory();

        if (selectedStatus != null && selectedStatus.length > 1) {
            int endIndex = d.getAllBlogByStatusFilter(
                    selectedStatus[0],
                    selectedStatus[1]
            ).size() / 6;
            if (d.getAllBlogByStatusFilter(
                    selectedStatus[0],
                    selectedStatus[1]
            ).size() % 6 != 0) {
                endIndex++;
            }
            filteredBlogs = d.getAllBlogPageByStatusFilter(
                    selectedStatus[0], // Truyền giá trị status thứ nhất
                    selectedStatus[1], // Truyền giá trị status thứ hai
                    currentPage
            );
            request.setAttribute("selectedStatusAll", "selectedStatusAll");
            request.setAttribute("endIndex", endIndex);
        } else if (selectedStatus != null && selectedStatus.length == 1) {
            int endIndex = d.getAllBlogByStatusFilter(
                    selectedStatus[0],
                    ""
            ).size() / 6;
            if (d.getAllBlogByStatusFilter(
                    selectedStatus[0],
                    ""
            ).size() % 6 != 0) {
                endIndex++;
            }
            filteredBlogs = d.getAllBlogPageByStatusFilter(
                    selectedStatus[0], // Truyền giá trị status thứ nhất
                    "", // Truyền giá trị status thứ hai
                    currentPage
            );
            request.setAttribute("endIndex", endIndex);
            request.setAttribute("selectedStatus", selectedStatus[0]);
        }

        if (selectedCategories != null && selectedCategories.length > 1) {
            if (selectedCategories.length == 2) {
                int endIndex = d.getAllBlogByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1], "", ""
                ).size() / 6;
                if (d.getAllBlogByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1], "", ""
                ).size() % 6 != 0) {
                    endIndex++;
                }
                filteredBlogs = d.getAllBlogPageByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1], "", "",
                        currentPage
                );
//                request.setAttribute("selectedStatusAll", "selectedStatusAll");
                request.setAttribute("endIndex", endIndex);
            } else if (selectedCategories.length == 3) {
                int endIndex = d.getAllBlogByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1],
                        selectedCategories[2], ""
                ).size() / 6;
                if (d.getAllBlogByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1],
                        selectedCategories[2], ""
                ).size() % 6 != 0) {
                    endIndex++;
                }
                filteredBlogs = d.getAllBlogPageByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1],
                        selectedCategories[2], "",
                        currentPage
                );
//                request.setAttribute("selectedStatusAll", "selectedStatusAll");
                request.setAttribute("endIndex", endIndex);
            } else if (selectedCategories.length == 4) {
                int endIndex = d.getAllBlogByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1],
                        selectedCategories[2], selectedCategories[3]
                ).size() / 6;
                if (d.getAllBlogByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1],
                        selectedCategories[2], selectedCategories[3]
                ).size() % 6 != 0) {
                    endIndex++;
                }
                filteredBlogs = d.getAllBlogPageByCategoryFilter(
                        selectedCategories[0],
                        selectedCategories[1],
                        selectedCategories[2], selectedCategories[3],
                        currentPage
                );
//                request.setAttribute("selectedStatusAll", "selectedStatusAll");
                request.setAttribute("endIndex", endIndex);
            }
        } else if (selectedCategories != null && selectedCategories.length == 1) {
            int endIndex = d.getAllBlogByCategoryFilter(
                    selectedCategories[0],
                    "", "", ""
            ).size() / 6;
            if (d.getAllBlogByCategoryFilter(
                    selectedCategories[0],
                    "", "", ""
            ).size() % 6 != 0) {
                endIndex++;
            }
            filteredBlogs = d.getAllBlogPageByCategoryFilter(
                    selectedCategories[0],
                    "", "", "",
                    currentPage
            );
//                request.setAttribute("selectedStatusAll", "selectedStatusAll");
            request.setAttribute("endIndex", endIndex);
        }
        request.setAttribute("listBlog", filteredBlogs);
        request.setAttribute("listBlogCategory", listBC);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("menu", "post");
        request.getRequestDispatcher("post.jsp").forward(request, response);
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
