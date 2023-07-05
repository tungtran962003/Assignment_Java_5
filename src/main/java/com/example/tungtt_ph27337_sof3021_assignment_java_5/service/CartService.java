package com.example.tungtt_ph27337_sof3021_assignment_java_5.service;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Account;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.ProductInCartResponse;
import jakarta.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.util.List;

public interface CartService {

    List<ProductInCartResponse> addToCart(HttpServletRequest request, Integer id);

    List<ProductInCartResponse> getCart(HttpServletRequest request);

    List<ProductInCartResponse> deleteFromCart(HttpServletRequest request, Integer id);

    BigDecimal totalMoney(List<ProductInCartResponse> cartResponse);

    void buy(List<ProductInCartResponse> cart, Account account, HttpServletRequest request);

    List<ProductInCartResponse> deleteOneLineCart(HttpServletRequest request, Integer id);
}
