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
import model.Category;
import model.Item;
import model.Product;
import model.Users;

/**
 *
 * @author
 */
@WebServlet(name = "Cart", urlPatterns = {"/cart"})
public class Cart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = request.getRequestURI();
        System.out.println(url);
        session.setAttribute("prevUrl", url);
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
        String listCategory = "";
        List<Product> listNewP;
        if (cart.getList().size() > 0) {
            listCategory = "(";
            for (int i = 0; i < cart.getList().size(); i++) {
                if (i == cart.getList().size() - 1) {
                    listCategory += cart.getList().get(i).getProduct().getCid();
                } else {
                    listCategory += cart.getList().get(i).getProduct().getCid() + ",";
                }

            }
            listCategory += ")";
        }
        if (listCategory.equals("")) {
            listNewP = d.getTopProduct();
        } else {
            listNewP = d.getProductSameCategoryID(listCategory);
        }

        List<Category> listC = d.getAllCategory();
        request.setAttribute("listNewP", listNewP);
        request.setAttribute("cart", cart);
        request.setAttribute("size", cart.getList().size());
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
