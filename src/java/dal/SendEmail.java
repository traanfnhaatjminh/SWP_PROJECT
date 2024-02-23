/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author nguye
 */
public class SendEmail {

    public String getRandom() {

        java.util.Random rnd = new java.util.Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendPassAddUser(String userEmail, String userPassword) {
        boolean test = false;
        String fromEmail = "nguyentahoang15012003@gmail.com";
        String password = "mghv pppx pilc yujr";
        // Thông tin tài khoản email người nhận
        String toEmail = userEmail;
// Cấu hình các thuộc tính cho việc gửi email
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
// Tạo session để gửi email sử dụng thông tin tài khoản email của fromEmail và password để xác thực 
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            //content gmail 
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Send Pass");
            message.setText("Pass random :" + userPassword);
// Gửi email
            Transport.send(message);
            test = true;
            // neu gui email thanh cong test = true 
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return test;
        //   // neu gui email khong thanh cong test = false  
    }
}
