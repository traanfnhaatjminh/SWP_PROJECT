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
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Category;
import model.Customer;
import model.Item;
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
        String methodPayment = request.getParameter("payment");
        String totalCost_raw = request.getParameter("totalCost");
        float totalCost = Float.parseFloat(totalCost_raw);
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
        // Your existing email sending code...

        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            OrderDAO odb = new OrderDAO();
            odb.addOrder(name, phone, address, email, gender, notes, cart, customer, "1", totalCost, 1);
            String textPayment = (methodPayment.equals("cash")) ? " <div class=\"form-group\">\n"
                    + " <label for=\"cash\">Payment on delivery</label> </div>"
                    : "<div  id=\"qr\">\n"
                    + "               <img\n"
                    + "                  src=\"https://firebasestorage.googleapis.com/v0/b/shop-f6d2b.appspot.com/o/qr.png?alt=media&token=08c1bfcb-7290-4a4a-8a99-2af6032df2bf\"\n"
                    + "                  alt=\"alt\" />\n"
                    + "            </div>\n";
            String productCart = "";
            for (Item i : cart.getList()) {
                productCart += "<tr>"
                        + "            <td>" + i.getProduct().getId() + "</td>"
                        + "            <td style='display: flex;'>"
                        + "               <div style='display: flex; align-items: center;'>"
                        + "                  <img src=" + i.getProduct().getImage() + " width='200' height='auto'"
                        + "                  <div>"
                        + i.getProduct().getName()
                        + "                  </div>"
                        + "               </div>"
                        + "            </td>"
                        + "            <td>"
                        + i.getQuantity()
                        + "            </td>"
                        + "            <td class=\"d-flex flex-column\">"
                        + i.getProduct().getSale_price()
                        + "            </td>"
                        + "            <td class=\"font-weight-bold\">"
                        + (i.getQuantity() * i.getProduct().getSale_price())
                        + "            </td>"
                        + "         </tr>";
            }
            String to = email;// change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session sessionEmail = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("nguyentahoang15012003@gmail.com", "mghv pppx pilc yujr");// Put your email
                    // id and
                    // password here
                }
            });
            try {
                MimeMessage message = new MimeMessage(sessionEmail);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Order placed successfully");
                String text = "<!DOCTYPE html>\n"
                        + "<html lang=\"en\">\n"
                        + "<head>\n"
                        + "   <meta charset=\"UTF-8\">\n"
                        + "   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                        + "   <style>\n"
                        + "      table {\n"
                        + "         width: 100%;\n"
                        + "         border-collapse: collapse;\n"
                        + "      }\n"
                        + "\n"
                        + "      th,\n"
                        + "      td {\n"
                        + "         padding: 8px;\n"
                        + "         text-align: left;\n"
                        + "      }\n"
                        + "\n"
                        + "      th {\n"
                        + "         background-color: #ddd;\n"
                        + "      }\n"
                        + "\n"
                        + "      tr:nth-child(even) {\n"
                        + "         background-color: #f2f2f2;\n"
                        + "      }\n"
                        + "\n"
                        + "      tr:hover {\n"
                        + "         background-color: #ddd;\n"
                        + "      }\n"
                        + "\n"
                        + "      .img-container {\n"
                        + "         display: flex;\n"
                        + "         align-items: center;\n"
                        + "      }\n"
                        + "\n"
                        + "      .img-container img {\n"
                        + "         max-width: 200px;\n"
                        + "         max-height: 200px;\n"
                        + "         margin-right: 10px;\n"
                        + "      }\n"
                        + "\n"
                        + "      .total {\n"
                        + "         font-weight: bold;\n"
                        + "      }\n"
                        + "\n"
                        + "      .order-form {"
                        + "         max-width: 80%;"
                        + "         margin: 0 auto;"
                        + "         padding: 20px;"
                        + "         border: 1px solid #ddd;"
                        + "         border-radius: 5px;"
                        + "      }"
                        + "      .form-signup {"
                        + "         display: flex;"
                        + "         flex-wrap: wrap;"
                        + "      }"
                        + "\n"
                        + "      .form-row {"
                        + "         display: flex;"
                        + "         justify-content: space-between;"
                        + "         width: 100%;"
                        + "      }"
                        + "\n"
                        + "      .form-group {"
                        + "         width: 100%;"
                        + "         margin-bottom: 15px;"
                        + "      }"
                        + "\n"
                        + "      label {"
                        + "         display: block;"
                        + "         margin-bottom: 5px;"
                        + "      }"
                        + "      input[type=\"tex t\"],"
                        + "      input[type=\"email\"],"
                        + "      select,"
                        + "      textarea {"
                        + "         width: 90%;"
                        + "         padding: 8px;"
                        + "         border: 1px solid #ddd;"
                        + "         border-radius: 4px;"
                        + "      }"
                        + "      input[type=\"radio\"] {"
                        + "         margin-right: 5px;"
                        + "      }"
                        + "\n"
                        + "      textarea {"
                        + "         resize: vertical;"
                        + "      }"
                        + "\n"
                        + "      .pay {"
                        + "         margin-top: 20px;"
                        + "      }"
                        + "\n"
                        + "      #qr {"
                        + "         text-align: center;"
                        + "      }"
                        + "\n"
                        + "      #qr img {"
                        + "         max-width: 200px;"
                        + "      }"
                        + "   </style>"
                        + "</head>"
                        + "<body>"
                        + "<h1> Order successful</h1>"
                        + "   <table>"
                        + "      <thead>"
                        + "         <tr>"
                        + "            <th>ID</th>\n"
                        + "            <th>Title</th>\n"
                        + "            <th>Quantity</th>\n"
                        + "            <th> price each</th>\n"
                        + "            <th>total</th>\n"
                        + "         </tr>"
                        + "      </thead>"
                        + "      <tbody>"
                        + productCart
                        + "      </tbody>"
                        + "   </table>"
                        + "<h1> Subtotal: "
                        + cart.getTotalMoney()
                        + "$</h1>"
                        + "</body>"
                        + "</html>";
                message.setContent(text, "text/html;charset = UTF-8");
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
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
