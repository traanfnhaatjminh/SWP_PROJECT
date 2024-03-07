/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.User;

import dal.UserEditDAO;
import dal.userDAO_1;

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
import model.Roles;
import model.Users;
import org.apache.catalina.User;

/**
 *
 * @author nguye
 */
@WebServlet(name="userEdit", urlPatterns={"/userEdit"})
public class userEdit extends HttpServlet {
   
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
            // lay du lieu tu jsp
            String userId = request.getParameter("userIdEdit");

            // Xu ly co so du lieu
            List<Roles> listUserRole = new ArrayList<>();
            userRoleDAO userRoleDao = new userRoleDAO();
            listUserRole = userRoleDao.getAllUserRole();
            Users user = new Users();
            userDAO_1 userDao = new userDAO_1();
            user = userDao.getUserDetailByID(userId);

            // Xu ly dieu huong
            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("user", user);
            request.getRequestDispatcher("userEdit.jsp").forward(request, response);
        } catch (ServletException | IOException | SQLException e) {
            System.out.println("error when edit user method get");
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
            // Get data from jsp
            int userId = Integer.parseInt(request.getParameter("userId"));
            String userFullname = request.getParameter("userFullname");
            String userGender = request.getParameter("userGender");
            String userEmail = request.getParameter("userEmail");
            String userMobile = request.getParameter("userMobile");          
            String userAvatar = request.getParameter("userAvatar");
            String userAddress = request.getParameter("userAddress");
            int userRole= Integer.parseInt(request.getParameter("userRole"));
            int userStatus = Integer.parseInt(request.getParameter("userStatus"));
            
        
           

            // Work with Database
            Users user = new Users(userId, userFullname, userGender, userEmail, userMobile, userAvatar, userAddress, userRole, userStatus);
            UserEditDAO userEditDAO = new UserEditDAO();
            userEditDAO.updateUserAdmin(user);
            List<Roles> listUserRole = new ArrayList<>();
            userRoleDAO userRoleDao = new userRoleDAO();
            listUserRole = userRoleDao.getAllUserRole();
            
            // Xu ly dieu huong
            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("user", user);
            request.setAttribute("message", "Edit user successful !!!");
            request.getRequestDispatcher("userEdit.jsp").forward(request, response);
        } catch (NumberFormatException | SQLException e) {
            System.out.println("error when edit user method post " + e.getMessage());
        } 
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
