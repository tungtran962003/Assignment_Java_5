package com.example.tungtt_ph27337_sof3021_assignment_java_5.controller;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Account;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.LoginResponse;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.AccountService;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.util.Util;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/food")
public class LoginController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private JavaMailSender emailSender;

    @GetMapping("/view-login")
    public String viewLogin() {
        return "account/login";
    }

    private List<Account> listAccount = new ArrayList<>();

    private Util util = new Util();

    @PostMapping("/login")
    public String login(Model model,HttpServletRequest request, @RequestParam(name = "username") String username,
                        @RequestParam(name = "password") String password) {
        LoginResponse loginResponse = accountService.login(username, password);
        if (loginResponse == null) {
            model.addAttribute("fail", "Incorrect account or password");
            return "account/login";
        } else {
            Integer id = accountService.findByUserAndPass(username, password);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("username", username);
            httpSession.setAttribute("role", loginResponse.getRole());
            httpSession.setAttribute("email", loginResponse.getEmail());
            httpSession.setAttribute("address", loginResponse.getAddress());
            httpSession.setAttribute("phone", loginResponse.getPhone());
            httpSession.setAttribute("id", id);
            return "redirect:/food/home";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        httpSession.removeAttribute("cart");
        httpSession.removeAttribute("username");
        httpSession.removeAttribute("role");
        return "redirect:/food/view-login";
    }

    @GetMapping("/view-register")
    public String viewRegister() {
        return "account/register";
    }

    @GetMapping("/view-forgot-password")
    public String viewForgotPassword() {
        return "account/forgot-password";
    }

    @GetMapping("/view-change-password/{id}")
    public String viewChangePassword(Model model, @PathVariable Integer id) {
        Optional<Account> account = accountService.findById(id);
        model.addAttribute("acc", account.get());
        return "account/update-password";
    }

    @GetMapping("/view-update-info/{id}")
    public String viewChangeInfo(Model model, @PathVariable Integer id) {
        Optional<Account> account = accountService.findById(id);
        model.addAttribute("acc", account.get());
        return "account/update-account";
    }

    @PostMapping("/add-register")
    public String addRegister(@ModelAttribute Account request) {
        if (request.getRole() == null || request.getRole().trim() == "") {
            request.setRole("customer");
        }
        accountService.addAccount(request);
        return "redirect:/food/view-login";
    }

    @PostMapping("/update-info/{id}")
    public String updateInfo(@ModelAttribute Account request, @PathVariable Integer id) {
        Optional<Account> account = accountService.findById(id);
        request.setId(account.get().getId());
        request.setRole(account.get().getRole());
        request.setUsername(account.get().getUsername());
        request.setPassword(account.get().getPassword());
        accountService.addAccount(request);
        return "redirect:/food/home";
    }

    @PostMapping("/change-password/{id}")
    public String changePassword(@ModelAttribute Account request, @PathVariable Integer id,
                                 @RequestParam(name = "newPassword") String newPassword) {
        Optional<Account> account = accountService.findById(id);
        request.setRole(account.get().getRole());
        request.setEmail(account.get().getEmail());
        request.setAddress(account.get().getAddress());
        request.setId(account.get().getId());
        request.setName(account.get().getName());
        request.setPhone(account.get().getPhone());
        request.setUsername(account.get().getUsername());
        request.setPassword(newPassword);
        accountService.addAccount(request);
        return "redirect:/food/logout";
    }


    @PostMapping("/forgot-password")
    public String changePassword(Model model, @RequestParam("email") String email, HttpSession session) {
        resetSession(session);
        listAccount = accountService.findAll();
        for (Account acc: listAccount) {
            if (acc.getEmail().equals(email)) {
                String newPassword = util.randomPassword(10);
                var message = Util.setMesageEmail(email, newPassword);

                acc.setPassword(newPassword);
                accountService.addAccount(acc);
                emailSender.send(message);

                return "redirect:/food/view-login";
            }
        }
        model.addAttribute("err", "Email does not exist !");
        return "account/forgot-password";
    }

    private void resetSession(HttpSession session) {
        session.removeAttribute("err");
        session.removeAttribute("mess");
        session.removeAttribute("forgotPassword");
    }

}
