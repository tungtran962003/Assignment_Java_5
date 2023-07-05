package com.example.tungtt_ph27337_sof3021_assignment_java_5.controller;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Account;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.request.BuyRequest;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.ProductInCartResponse;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.AccountService;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.CartService;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.ProductService;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.util.Util;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/food")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @Autowired
    private AccountService accountService;

    @GetMapping("/cart")
    public String getCart(HttpServletRequest request, Model model) {
        List<ProductInCartResponse> cart = cartService.getCart(request);
        BigDecimal totalMoney = cartService.totalMoney(cart);
        model.addAttribute("cart", cart);
        if (totalMoney.intValue() == 0) {
            model.addAttribute("totalMoney", 0);
            model.addAttribute("role", request.getSession().getAttribute("role"));
            return "order/cart";
        } else {
            model.addAttribute("totalMoney", totalMoney);
            model.addAttribute("role", request.getSession().getAttribute("role"));
            return "order/cart";
        }
    }

    @GetMapping("/add-cart/{id}")
    public String addToCart(@PathVariable Integer id, HttpServletRequest request, Model model) {
        List<ProductInCartResponse> cart = cartService.addToCart(request, id);
        BigDecimal totalMoney = cartService.totalMoney(cart);
        model.addAttribute("cart", cart);
        model.addAttribute("totalMoney", totalMoney);
        return "redirect:/food/cart";
    }

    @PostMapping("/add-cart1/{id}")
    public String addToCart1(@PathVariable Integer id, HttpServletRequest request, Model model) {
        List<ProductInCartResponse> cart = cartService.addToCart(request, id);
        BigDecimal totalMoney = cartService.totalMoney(cart);
//        model.addAttribute("cart", cart);
//        model.addAttribute("b", "b");
//        model.addAttribute("totalMoney", totalMoney);
        return "redirect:/food/detail-food/{id}";
    }

    @GetMapping("/delete-cart/{id}")
    public String deleteFromCart(@PathVariable Integer id, HttpServletRequest request, Model model) {
        List<ProductInCartResponse> cart = cartService.deleteFromCart(request, id);
        BigDecimal totalMoney = cartService.totalMoney(cart);
        model.addAttribute("cart", cart);
        model.addAttribute("totalMoney", totalMoney);
        return "redirect:/food/cart";
    }

    @GetMapping("/view-checkout")
    public String viewCheckOut(HttpServletRequest request, Model model) {
        List<ProductInCartResponse> cart = cartService.getCart(request);
        BigDecimal totalMoney = cartService.totalMoney(cart);
        var account = accountService.findById((Integer) request.getSession().getAttribute("id"));
        model.addAttribute("acc", account.get());
        model.addAttribute("totalMoney", totalMoney);
        return "order/checkout";
    }

    @PostMapping("/buy")
    public String clickBuy(@ModelAttribute BuyRequest requestModel, HttpServletRequest request) {
        List<ProductInCartResponse> cart = cartService.getCart(request);
        String username = Util.getUsername(request.getSession());
        if ("".equals(username)) {
            return "redirect:/food/view-login";
        }
        Account account = accountService.findByUsername(username).orElse(null);
        cartService.buy(cart, account, request);
        return "order/buy-success";
    }

    @GetMapping("/delete-line-cart/{id}")
    public String deleteOneLineCart(@PathVariable Integer id, HttpServletRequest request, Model model) {
        List<ProductInCartResponse> cart = cartService.deleteOneLineCart(request, id);
        BigDecimal totalMoney = cartService.totalMoney(cart);
        model.addAttribute("cart", cart);
        model.addAttribute("totalMoney", totalMoney);
        return "redirect:/food/cart";
    }
}
