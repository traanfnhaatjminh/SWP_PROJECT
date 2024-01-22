/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DUONG VIET DUY
 */
@WebServlet(name = "Customer", urlPatterns = {"/customer"})
public class Customer extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action.equals("login")) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (action.equals("checkLogin")) {
            String customer_email = request.getParameter("c_email");
            String customer_pass = request.getParameter("c_pass");
            String remember = request.getParameter("remember");
            dal.CustomerDAO dao = new dal.CustomerDAO();
            model.Customer customer = dao.Login(customer_email, customer_pass);
            if (customer == null) {
                request.setAttribute("error", "Account does not exist or wrong password!");
                request.getRequestDispatcher("customer?action=login").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("customer", customer);
                Cookie email = new Cookie("email", customer_email);
                Cookie pass = new Cookie("pass", customer_pass);
                Cookie rem = new Cookie("rememeber", remember);
                if (remember != null) {
                    email.setMaxAge(60 * 60 * 24 * 30);
                    pass.setMaxAge(60 * 60 * 24 * 30);
                    rem.setMaxAge(60 * 60 * 24 * 30);
                } else {
                    email.setMaxAge(0);
                    pass.setMaxAge(0);
                    rem.setMaxAge(0);
                }

                response.addCookie(email);
                response.addCookie(pass);
                response.addCookie(rem);
                response.sendRedirect("home");

            }

        }
        if (action.equals("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("customer");
            response.sendRedirect("home");
        }
        if (action.equals("updateinfor")) {
            try {
                HttpSession session = request.getSession();
                model.Customer customer = (model.Customer) session.getAttribute("customer");
                if (customer != null) {
                    String customer_name = request.getParameter("fullName");
                    String customer_gender = request.getParameter("gender");
                    String customer_phone = request.getParameter("phone");
                    String customer_address = request.getParameter("address");
                    String customer_avatar = request.getParameter("avatar");
                    int customer_id = customer.getCustomerID();
                    CustomerDAO dao = new CustomerDAO();
                    dao.updateInfor(customer_name, customer_gender, customer_phone, customer_address, customer_avatar, customer_id);
                    model.Customer customer1 = new model.Customer(
                            customer.getCustomerID(),
                            customer_name,
                            customer_gender,
                            customer_phone,
                            customer.getEmail(),
                            customer.getPassword(),
                            customer_address,
                            customer_avatar);
                    session.setAttribute("customer", customer1);
                    request.setAttribute("messageinfor", "update success");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                } else {
                    response.sendRedirect("customer?action=login");
                }
            } catch (Exception e) {
            }
        }
        if (action.equals("changepassword")) {
            try {
                String customer_email = request.getParameter("email");
                String customer_opass = request.getParameter("oldpass");
                String customer_npass = request.getParameter("newpass");
                CustomerDAO dao = new CustomerDAO();
                model.Customer customer = dao.check(customer_email, customer_opass);
                if (customer == null) {
                    String ms = "old password incorrect";
                    request.setAttribute("ms", ms);
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);
                } else {
                    dao.changePass(customer_npass, customer_email);
                    model.Customer customer1 = new model.Customer(
                            customer.getCustomerID(),
                            customer.getFullName(),
                            customer.getGender(),
                            customer.getPhone(),
                            customer_email,
                            customer_npass,
                            customer.getAddress(),
                            customer.getAvatar());

                    HttpSession session = request.getSession();
                    session.setAttribute("customer", customer1);
                    request.setAttribute("mess", "change password success");
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);
                }
            } catch (Exception e) {
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
        processRequest(request, response);
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
