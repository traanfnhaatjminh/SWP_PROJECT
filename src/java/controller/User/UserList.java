/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.User;

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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Roles;
import model.Users;

/**
 *
 * @author nguye
 */
@WebServlet(name = "UserList", urlPatterns = {"/userlist"})
public class UserList extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            // get from data and constructor   
            String userContent = request.getParameter("user_content");
            userDAO_1 userDao = new userDAO_1();
            userRoleDAO userRoleDao = new userRoleDAO();

            // create list
            List<Users> listUser = new ArrayList<>();
            List<Users> listUserDisplay = new ArrayList<>();
            listUser = userDao.getAllUserDetail();
            List<Roles> listUserRole = userRoleDao.getAllUserRole();

            // Get Data from userList.jsp
            String search = request.getParameter("search");
            String filter = request.getParameter("filter");

            // Extract data get from jsp
            if (search != null) {
                listUser = userDao.getAllUserBySearch(search);
            }
            if(filter != null && filter.isEmpty() == false){
                switch(filter){
                    case "default":
                        listUser = userDao.getAllUserDetail();
                        break;
                    case "male":
                        listUser = userDao.getAllUserByGender("male");
                        break; 
                    case "female":
                        listUser = userDao.getAllUserByGender("female");
                        break;    
                    case "other":
                        listUser = userDao.getAllUserByGender("other");
                        break;
                    default:
                        listUser = userDao.getAllUserByRole(filter);
                        break;    
                }
            }

            if (search == null && filter == null) {
                listUser = userDao.getAllUserDetail();
            }

            // Sort
            String sort = request.getParameter("sort") != null ? request.getParameter("sort") : "1";
            switch (sort) {
                case "1":
                    break;
                case "2":
                    userDao.sortUserByFullnameAsc(listUser);
                    break;
                case "3":
                    userDao.sortUserByFullnameDesc(listUser);
                    break;
                case "4":
                    userDao.sortUserByGender(listUser);
                    break;
                case "5":
                    userDao.sortUserByEmailAsc(listUser);
                    break;
                case "6":
                    userDao.sortUserByFullnameDesc(listUser);
                    break;
                case "7":
                    userDao.sortUserByPhoneDesc(listUser);
                    break;
                case "8": // By Role Name
                    break;
                case "9": // By Role Name
                    break;
            }

            int userPerPage = 6;
            try {
                userPerPage = Integer.parseInt(request.getParameter("userPerPage"));
            } catch (Exception e) {
            }

            // Number of page
            int numOfPage = listUser.size() / userPerPage + (listUser.size() % userPerPage == 0 ? 0 : 1);
            int currPage = 1;
            // get to try catch
            try {
                currPage = Integer.parseInt(request.getParameter("currPage"));
            } catch (NumberFormatException e) {
            }
            if (currPage > numOfPage) {
                currPage = numOfPage;
            }
            int start = userPerPage * currPage - userPerPage;
            int end = userPerPage * currPage - 1;
            if (!listUser.isEmpty()) {
                for (int i = start; i <= end; i++) {
                    if (i == listUser.size()) {
                        break;
                    }
                    listUserDisplay.add(listUser.get(i));
                }
            }

            // send data request
            request.setAttribute("userContent", userContent);
            request.setAttribute("sort", sort);
            request.setAttribute("filter", filter);
            request.setAttribute("listUser", listUser);
            request.setAttribute("listUserRole", listUserRole);
            request.setAttribute("listUserDisplay", listUserDisplay);
            request.setAttribute("userPerPage", userPerPage);
            request.setAttribute("numOfPage", numOfPage);
            request.setAttribute("currPage", currPage);
            request.setAttribute("search", search);

            request.getRequestDispatcher("userList.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
            Logger.getLogger(UserList.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UserList.class.getName()).log(Level.SEVERE, null, ex);
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
