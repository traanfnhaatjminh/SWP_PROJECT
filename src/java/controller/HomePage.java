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
import model.Blog;
import model.Category;
import model.Post;
import model.Product;
import model.Slider;

/**
 *
 * @author minh1
 */
@WebServlet(name = "HomePage", urlPatterns = {"/home"})
public class HomePage extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        DAO d = new DAO();
//        List<Category> listC = d.getAllCategory();
//        List<Product> listNewP = d.getTopProduct();
//        List<Post> listP = d.getTopPost();
//        List<Slider> listS = d.getTopSlider(1, 3);
//        List<Blog> listB = d.getAllBlog();
//        request.setAttribute("listC", listC);
//        request.setAttribute("listNewP", listNewP);
//        request.setAttribute("listB", listB);
//        request.setAttribute("listTopPost", listP);
//        request.setAttribute("listTopSlider", listS);
//        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        DAO d = new DAO();
        HttpSession session = request.getSession();
        String url = request.getRequestURI();
        System.out.println(url);
        session.setAttribute("prevUrl", url);
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
        List<Product> listNewP = d.getTopProduct();
        List<Post> listP = d.getTopPost();
        List<Slider> listS = d.getTopSlider(1, 3);
        List<Blog> listB = d.getAllBlog();
        request.setAttribute("size", cart.getList().size());
        request.setAttribute("listC", listC);
        request.setAttribute("listNewP", listNewP);
        request.setAttribute("listB", listB);
        request.setAttribute("listTopPost", listP);
        request.setAttribute("listTopSlider", listS);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
