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
@WebServlet(name = "changeStatusFeedback", urlPatterns = {"/changeStatusF"})
public class changeStatusFeedback extends HttpServlet {

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
            out.println("<title>Servlet changeStatusFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeStatusFeedback at " + request.getContextPath() + "</h1>");
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
        String sort = request.getParameter("statusF");
        String fid_raw = request.getParameter("fid");
        int fid = Integer.parseInt(fid_raw);
        DAO d = new DAO();
        int currentPage = 1;
        request.setAttribute("menu", "feedbackList");
        request.setAttribute("currentPage", currentPage);
        if (sort.equals("1")) {
            d.editFeedbackStatus("1", fid);
            List<Feedback> listF = d.getAllFeedbackPage(currentPage);
            int endIndex = d.getAllFeedback().size() / 6;
            if (d.getAllFeedback().size() % 6 != 0) {
                endIndex++;
            }
            request.setAttribute("listFeedback", listF);
            request.setAttribute("endIndex", endIndex);
        }

        if (sort.equals("2")) {
            d.editFeedbackStatus("2", fid);
            List<Feedback> listF = d.getAllFeedbackPage(currentPage);
            int endIndex = d.getAllFeedback().size() / 6;
            if (d.getAllFeedback().size() % 6 != 0) {
                endIndex++;
            }
            request.setAttribute("listFeedback", listF);
            request.setAttribute("endIndex", endIndex);
        }

        if (sort.equals("3")) {
            d.editFeedbackStatus("3", fid);
            List<Feedback> listF = d.getAllFeedbackPage(currentPage);
            int endIndex = d.getAllFeedback().size() / 6;
            if (d.getAllFeedback().size() % 6 != 0) {
                endIndex++;
            }
            request.setAttribute("listFeedback", listF);
            request.setAttribute("endIndex", endIndex);
        }

        if (sort.equals("4")) {
            d.editFeedbackStatus("4", fid);
            List<Feedback> listF = d.getAllFeedbackPage(currentPage);
            int endIndex = d.getAllFeedback().size() / 6;
            if (d.getAllFeedback().size() % 6 != 0) {
                endIndex++;
            }
            request.setAttribute("listFeedback", listF);
            request.setAttribute("endIndex", endIndex);
        }

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
