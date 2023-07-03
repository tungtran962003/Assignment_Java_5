package com.example.tungtt_ph27337_sof3021_assignment_java_5.util;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;


@Component
public class Util {

    public static String getUsername(HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            return "";
        }
        return username;
    }


}
