/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.User;

import dal.SendEmail;
import dal.UserEditDAO;
import dal.userRoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.Roles;
import model.Users;

/**
 *
 * @author nguye
 */
@WebServlet(name="addUser", urlPatterns={"/addUser"})
public class addUser extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addUser at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            // Generate list and set attribute
            List<Roles> listUserRole = new ArrayList<>();
            userRoleDAO userRoleDao = new userRoleDAO();
            listUserRole = userRoleDao.getAllUserRole();
            request.setAttribute("listUserRole", listUserRole);
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        } catch (ServletException | IOException | SQLException e) {
            System.out.println("Error when add user method get");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            SendEmail sendPass = new SendEmail();

            //  Random random = new Random();
            String userPassword = generateRandomPassword(8); // Độ dài mật khẩu là 8 ký tự            
            String userName = request.getParameter("userFullname");
            String userUsername = request.getParameter("userUsername");
            String userGender = request.getParameter("userGender");
            String userAvatar = request.getParameter("userAvatar");
            String userEmail = request.getParameter("userEmail");
            String userMobile = request.getParameter("userMobile");
            int userRole = Integer.parseInt(request.getParameter("userRole"));
            String userAddress = request.getParameter("userAddress");
            int userStatus = Integer.parseInt(request.getParameter("userStatus"));

            // work with database
            Users user = new Users(userRole, userName, userGender, userEmail, userMobile, userAvatar, userAddress, userPassword, userRole, userRole);
            UserEditDAO userEditDao = new UserEditDAO();
            userEditDao.addNewUser(user);
            boolean test = sendPass.sendPassAddUser(userEmail, userPassword);
            List<Roles> listUserRole = new ArrayList<>();
            userRoleDAO userRoleDao = new userRoleDAO();
            listUserRole = userRoleDao.getAllUserRole();

            // xu ly dieu huong
            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("message", "Create new user successful !!!");
            request.getRequestDispatcher("addUser.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            System.out.println("error when create new user method post");
        }
    }

    private String generateRandomPassword(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomPassword = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            randomPassword.append(characters.charAt(index));
        }

        return randomPassword.toString();
    }  

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
