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
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;


 
@WebServlet(name = "ProcessControl", urlPatterns = {"/process"})
public class ProcessControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            String id_raw = request.getParameter("id");
            String num_raw = request.getParameter("num");
            int num, id, size = 0;
            DAO d = new DAO();
            List<Product> listProduct = d.getAllProduct();
            System.out.println("num" + num_raw + " id =" + id_raw);
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie c : arr) {
                    if (c.getName().equals("cart")) {
                        txt += c.getValue();
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }
            Cart cart = new Cart(txt, listProduct);
            try {
                num = Integer.parseInt(num_raw);
                id = Integer.parseInt(id_raw);
                if (num == 0) {
                    cart.removeItem(id);
                } else {
                    cart.getItemByID(id).setQuantity(num);
                }
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
            List<Item> items = cart.getList();
            txt = "";
            if (items.size() > 0) {
                txt = items.get(0).getProduct().getId() + ":"
                        + items.get(0).getQuantity();
                for (int i = 1; i < items.size(); i++) {
                    txt += "/" + items.get(i).getProduct().getId() + ":"
                            + items.get(i).getQuantity();
                }
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(7 * 60 * 60 * 24);
            response.addCookie(c);
            response.sendRedirect("cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
