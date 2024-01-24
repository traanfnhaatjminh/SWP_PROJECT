
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (email != null && !email.equals("")) {
            // Check if the email exists in the database
            Connection connection = null;
            try {
                // Establish the database connection
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Swp_Project;", "sa", "0901234");

                String checkEmailQuery = "SELECT * FROM Customer WHERE email = ?";
                try ( PreparedStatement checkEmailStatement = con.prepareStatement(checkEmailQuery)) {
                    checkEmailStatement.setString(1, email);
                    ResultSet resultSet = checkEmailStatement.executeQuery();

                    if (resultSet.next()) {
                        // Email exists in the database, proceed to send OTP
                        Random rand = new Random();
                        otpvalue = rand.nextInt(1255650);

                        // Your existing email sending code...
                        String to = email;// change accordingly
                        // Get the session object
                        Properties props = new Properties();
                        props.put("mail.smtp.host", "smtp.gmail.com");
                        props.put("mail.smtp.socketFactory.port", "465");
                        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                        props.put("mail.smtp.auth", "true");
                        props.put("mail.smtp.port", "465");
                        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication("nguyentahoang15012003@gmail.com", "mghv pppx pilc yujr");// Put your email
                                // id and
                                // password here
                            }
                        });

                        try {
                            MimeMessage message = new MimeMessage(session);
                            message.setFrom(new InternetAddress(email));// change accordingly
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                            message.setSubject("Hello");
                            message.setText("your OTP is: " + otpvalue);
                            // send message
                            Transport.send(message);
                            System.out.println("message sent successfully");
                        } catch (MessagingException e) {
                            throw new RuntimeException(e);
                        }
                        dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                        request.setAttribute("message", "OTP is sent to your email id");
                        //request.setAttribute("connection", con);
                        mySession.setAttribute("otp", otpvalue);
                        mySession.setAttribute("email", email);
                        dispatcher.forward(request, response);
                        //request.setAttribute("status", "success");                 
                    } else {
                        // Email does not exist in the database
                        request.setAttribute("errorMessage", "Email does not exist");
                        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                // Handle exceptions
                e.printStackTrace();
            }
        }
    }
}
