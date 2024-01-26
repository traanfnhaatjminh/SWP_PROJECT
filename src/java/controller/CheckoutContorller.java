/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Customer;
import model.Order;
import model.Product;
import model.Users;

@WebServlet(name = "CheckoutContorller", urlPatterns = {"/checkout"})
public class CheckoutContorller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
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
            List<Product> listNewP = d.getTopProduct();
            List<Category> listC = d.getAllCategory();
            request.setAttribute("listNewP", listNewP);
            request.setAttribute("cart", cart);
            request.setAttribute("customer", customer);
            request.setAttribute("listC", listC);
            request.setAttribute("size", cart.getList().size());
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String notes = request.getParameter("notes");
        System.out.println(gender);
        DAO d = new DAO();
        String txt = "";
        Cookie[] c = request.getCookies();
        if (c != null) {
            for (Cookie o : c) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        List<Product> list = d.getAllProduct();
        model.Cart cart = new model.Cart(txt, list);

        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            OrderDAO odb = new OrderDAO();
            odb.addOrder(name, phone, address, email, gender, notes, cart, customer);
//            for (Item item : cart.getList()) {
//                int id = item.getProduct().getId();
//                int quantity = item.getQuantity();
//                d.buyProduct(quantity, id);
//            }
        } else {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("email", email);
        request.setAttribute("gender", gender);
        request.setAttribute("notes", notes);
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

}
