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
import model.Product;

/**
 *
 * @author minh1
 */
@WebServlet(name = "CategoryDetail", urlPatterns = {"/categoryDetail"})
public class CategoryDetail extends HttpServlet {

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
            out.println("<title>Servlet CategoryDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryDetail at " + request.getContextPath() + "</h1>");
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
        String cid_raw = request.getParameter("cid");
        String menu = request.getParameter("menu");
        try {
            HttpSession session = request.getSession();

            String url = request.getRequestURI() + "?cid=" + cid_raw;
            System.out.println(url);
            session.setAttribute("prevUrl", url);

            DAO d = new DAO();
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
            List<Category> listC = d.getAllCategory();
            request.setAttribute("size", cart.getList().size());
            int cid = Integer.parseInt(cid_raw);

            List<Product> listP = d.getProductByCid(cid);
            request.setAttribute("listC", listC);
            request.setAttribute("listP", listP);
            request.setAttribute("cateID", cid);
            request.setAttribute("menu", menu);
            request.getRequestDispatcher("categoryDetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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
