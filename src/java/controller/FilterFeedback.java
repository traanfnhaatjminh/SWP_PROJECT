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
@WebServlet(name = "FilterFeedback", urlPatterns = {"/filterFeedback"})
public class FilterFeedback extends HttpServlet {

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
            out.println("<title>Servlet FilterFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterFeedback at " + request.getContextPath() + "</h1>");
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
        String[] selectedStar = request.getParameterValues("ratedstar");
        String[] selectedStatus = request.getParameterValues("status");
        DAO d = new DAO();
        int currentPage = 1;
        List<Feedback> filteredFeedback = null;
        if (selectedStatus != null && selectedStatus.length == 1) {
            int endIndex = d.getAllFeedbackByStatusFilter(selectedStatus[0], "", "", "").size() / 6;
            if (d.getAllFeedbackByStatusFilter(selectedStatus[0], "", "", "").size() % 6 != 0) {
                endIndex++;
            }
            filteredFeedback = d.getAllFeedbackByStatusFilterPage(selectedStatus[0], "", "", "", currentPage);
            request.setAttribute("endIndex", endIndex);
            request.setAttribute("selectedStatus", selectedStatus[0]);
        } else if (selectedStatus != null && selectedStatus.length > 1) {
            if (selectedStatus.length == 2) {
                int endIndex = d.getAllFeedbackByStatusFilter(selectedStatus[0], selectedStatus[1], "", "").size() / 6;
                if (d.getAllFeedbackByStatusFilter(selectedStatus[0], selectedStatus[1], "", "").size() % 6 != 0) {
                    endIndex++;
                }
                filteredFeedback = d.getAllFeedbackByStatusFilterPage(selectedStatus[0], selectedStatus[1], "", "", currentPage);
                request.setAttribute("endIndex", endIndex);
            } else if (selectedStatus.length == 3) {
                int endIndex = d.getAllFeedbackByStatusFilter(selectedStatus[0], selectedStatus[1], selectedStatus[2], "").size() / 6;
                if (d.getAllFeedbackByStatusFilter(selectedStatus[0], selectedStatus[1], selectedStatus[2], "").size() % 6 != 0) {
                    endIndex++;
                }
                filteredFeedback = d.getAllFeedbackByStatusFilterPage(selectedStatus[0], selectedStatus[1], selectedStatus[2], "", currentPage);
                request.setAttribute("endIndex", endIndex);
            } else if (selectedStatus.length == 4) {
                int endIndex = d.getAllFeedbackByStatusFilter(selectedStatus[0], selectedStatus[1], selectedStatus[2], selectedStatus[3]).size() / 6;
                if (d.getAllFeedbackByStatusFilter(selectedStatus[0], selectedStatus[1], selectedStatus[2], selectedStatus[3]).size() % 6 != 0) {
                    endIndex++;
                }
                filteredFeedback = d.getAllFeedbackByStatusFilterPage(selectedStatus[0], selectedStatus[1], selectedStatus[2], selectedStatus[3], currentPage);
                request.setAttribute("selectedStatusAll", "selectedStatusAll");
                request.setAttribute("endIndex", endIndex);
            }

        }

        if (selectedStar != null && selectedStar.length == 1) {
            int endIndex = d.getAllFeedbackByRateStarFilter(selectedStar[0], "", "", "", "").size() / 6;
            if (d.getAllFeedbackByRateStarFilter(selectedStar[0], "", "", "", "").size() % 6 != 0) {
                endIndex++;
            }
            filteredFeedback = d.getAllFeedbackByRateStarFilterPage(selectedStar[0], "", "", "", "", currentPage);
            request.setAttribute("endIndex", endIndex);
            request.setAttribute("selectedStar", selectedStar[0]);
        } else if (selectedStar != null && selectedStar.length > 1) {
            if (selectedStar.length == 2) {
                int endIndex = d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], "", "", "").size() / 6;
                if (d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], "", "", "").size() % 6 != 0) {
                    endIndex++;
                }
                filteredFeedback = d.getAllFeedbackByRateStarFilterPage(selectedStar[0], selectedStar[1], "", "", "", currentPage);
                request.setAttribute("endIndex", endIndex);
            } else if (selectedStar.length == 3) {
                int endIndex = d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], selectedStar[2], "", "").size() / 6;
                if (d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], selectedStar[2], "", "").size() % 6 != 0) {
                    endIndex++;
                }
                filteredFeedback = d.getAllFeedbackByRateStarFilterPage(selectedStar[0], selectedStar[1], selectedStar[2], "", "", currentPage);
                request.setAttribute("endIndex", endIndex);
            } else if (selectedStar.length == 4) {
                int endIndex = d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], selectedStar[2], selectedStar[3], "").size() / 6;
                if (d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], selectedStar[2], selectedStar[3], "").size() % 6 != 0) {
                    endIndex++;
                }
                filteredFeedback = d.getAllFeedbackByRateStarFilterPage(selectedStar[0], selectedStar[1], selectedStar[2], selectedStar[3], "", currentPage);
                request.setAttribute("endIndex", endIndex);
            } else if (selectedStar.length == 5) {
                int endIndex = d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], selectedStar[2], selectedStar[3], selectedStar[4]).size() / 6;
                if (d.getAllFeedbackByRateStarFilter(selectedStar[0], selectedStar[1], selectedStar[2], selectedStar[3], selectedStar[4]).size() % 6 != 0) {
                    endIndex++;
                }
                filteredFeedback = d.getAllFeedbackByRateStarFilterPage(selectedStar[0], selectedStar[1], selectedStar[2], selectedStar[3], selectedStar[4], currentPage);
                request.setAttribute("selectedStarAll", "selectedStarAll");
                request.setAttribute("endIndex", endIndex);
            }
        }
        request.setAttribute("listFeedback", filteredFeedback);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("menu", "feedbackList");
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
