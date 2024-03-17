/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.saleN;

import dal.orderDAO1;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "FilterOrderForSaleServlet", urlPatterns = {"/filterOrderForSaleServlet"})
public class FilterOrderForSaleServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String groupby = request.getParameter("groupby");
            orderDAO1 dao = new orderDAO1();
            ArrayList<model.Order> listOrders;
            ArrayList<model.Order> listOrderByProductName;
            HttpSession session = request.getSession();
            int sId = (int) session.getAttribute("sId");
            switch (groupby) {
                case "1":
                    request.setAttribute("curMenu", "Management Orders");
                    request.getRequestDispatcher("pageOrdersServletBySale").forward(request, response);
                    break;
                case "2":
                    listOrders = dao.getSearchbyStatusForSale("1");
                    request.setAttribute("listOrders", listOrders);
                    request.setAttribute("curMenu", "Management Orders");
                    RequestDispatcher rd = request.getRequestDispatcher("table-data-saleNormal.jsp");
                    rd.forward(request, response);
                    break;
                case "3":
                    listOrders = dao.getSearchbyStatusForSale("2");
                    request.setAttribute("listOrders", listOrders);
                    request.setAttribute("curMenu", "Management Orders");
                    request.getRequestDispatcher("table-data-saleNormal.jsp").forward(request, response);

                    break;
                case "4":
                    listOrders = dao.getSearchbyStatusForSale("3");
                    request.setAttribute("listOrders", listOrders);
                    request.setAttribute("curMenu", "Management Orders");
                    request.getRequestDispatcher("table-data-saleNormal.jsp").forward(request, response);

                    break;
                case "5":
                    listOrders = dao.getSearchbyStatusForSale("4");
                    request.setAttribute("listOrders", listOrders);
                    request.setAttribute("curMenu", "Management Orders");
                    request.getRequestDispatcher("table-data-saleNormal.jsp").forward(request, response);

                    break;
                case "6":
                    listOrders = dao.getSearchbyStatusForSale("5");
                    request.setAttribute("listOrders", listOrders);
                    request.setAttribute("curMenu", "Management Orders");
                    request.getRequestDispatcher("table-data-saleNormal.jsp").forward(request, response);

                    break;
                default:
                    listOrderByProductName = dao.getSearchbyNameProductForSale(groupby);
                    request.setAttribute("listOrders", listOrderByProductName);
                    request.setAttribute("curMenu", "Management Orders");
                    request.getRequestDispatcher("table-data-saleNormal.jsp").forward(request, response);
                    break;

            }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FilterOrderForSaleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FilterOrderForSaleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
