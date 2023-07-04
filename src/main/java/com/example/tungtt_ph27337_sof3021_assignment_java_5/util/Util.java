package com.example.tungtt_ph27337_sof3021_assignment_java_5.util;

import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


@Component
public class Util {

    public static String getUsername(HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            return "";
        }
        return username;
    }


    public String randomPassword(int length) {
        String randomText = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = (int) (randomText.length() * Math.random());
            stringBuilder.append(randomText.charAt(index));
        }
        return stringBuilder.toString();
    }

    public static SimpleMailMessage setMesageEmail(String to, String newPassword) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("tungtran962003@gmail.com");
        message.setTo(to);
        message.setSubject("New Password");
        message.setText("Your new password is: " + newPassword);
        return message;
    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("tungtran962003@gmail.com");
        mailSender.setPassword("fbmtpjwvbxglunwv");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }

}
