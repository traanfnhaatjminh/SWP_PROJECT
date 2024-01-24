package controller;

import dal.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author 
 */
@WebServlet(name = "BuyProduct", urlPatterns = {"/buyProduct"})
public class BuyProduct extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String quantity = request.getParameter("num");
        DAO d = new DAO();
        List<Product> list = d.getAllProduct();
        Cookie[] c = request.getCookies();
        String txt = "";
        if (c != null) {
            for (Cookie o : c) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        if (txt.isEmpty()) {
            txt += productId + ":" + quantity;
        } else {
            txt += "/" + productId + ":" + quantity;
        }
        Cookie cookie = new Cookie("cart", txt);
        cookie.setMaxAge(7 * 60 * 60 * 24);
        response.addCookie(cookie);
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getList();
        request.setAttribute("size", listItem.size());
//        String url = request.getRequestURI();
//        System.out.println(url);
        HttpSession session = request.getSession();
        String url = (String) session.getAttribute("prevUrl");
        response.sendRedirect(url);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
}
