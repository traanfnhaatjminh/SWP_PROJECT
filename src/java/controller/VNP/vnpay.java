/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.VNP;

import com.google.gson.JsonObject;
import controller.Excel.Config;
import dal.OrderDAO;
import dal.ShopDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;
import model.Customer;
import model.Users;
import org.apache.catalina.User;

/**
 *
 * @author CTT VNPAY
 */
@WebServlet(name = "VNPay", urlPatterns = {"/vnpay"})
public class vnpay extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);

        OrderDAO da = new OrderDAO();
        Customer user = (Customer) session.getAttribute("accC");
        int orderid = da.getOrderItemIDbyUser(user.getCustomerID());
        ShopDAO dao = new ShopDAO();
        String option = req.getParameter("paymentMethod");
        String total = "";
        ServletContext sc = req.getServletContext();
        sc.setAttribute("option", option);
        sc.setAttribute("orderID", orderid);
        if (option.equals("1")) {
            req.getRequestDispatcher("success.jsp").forward(req, resp);
        } else if (option.equals("2")) {
            if (!dao.getTotalProductPrice(orderid).isEmpty()) {

                total = dao.getTotalProductPrice(orderid);
                vnpayExecute(req, resp, total, orderid);
            } else {
                req.getRequestDispatcher("home").forward(req, resp);
            }
        }

    }

    public static int convertVnPriceToInt(String priceVn) {
        Locale localeVn = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getInstance(localeVn);
        try {
            Number priceNumber = numberFormat.parse(priceVn);
            return priceNumber.intValue();
        } catch (ParseException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void vnpayExecute(HttpServletRequest req, HttpServletResponse resp, String total, int orderID) throws ServletException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "sale";
        long amount = convertVnPriceToInt(total) * 100;
        String bankCode = req.getParameter("bankCode");

        String vnp_TxnRef = "A" + orderID;
        String vnp_IpAddr = Config.getIpAddress(req);
        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);

//        Gson gson = new Gson();
//        resp.getWriter().write(gson.toJson(job));
//        resp.getWriter().write(paymentUrl);
        resp.getWriter().write(paymentUrl);
        resp.sendRedirect(paymentUrl);

    }
}