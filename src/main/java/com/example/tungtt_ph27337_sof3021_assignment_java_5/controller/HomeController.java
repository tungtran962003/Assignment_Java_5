package com.example.tungtt_ph27337_sof3021_assignment_java_5.controller;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Optional;

@Controller
@RequestMapping("/food")
public class HomeController {

    @Autowired
    private ProductService productService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @GetMapping("/home")
    public String home(Model model, @RequestParam(defaultValue = "1") int page) {
        Page<Product> pageProduct;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 8, Sort.by("productId").descending());
        pageProduct = productService.getPage(pageable);
        model.addAttribute("pageProduct", pageProduct);
        return "home/home";
    }

    @GetMapping("/detail-food/{productId}")
    public String detailProduct(@PathVariable Integer productId, Model model) {
        Optional<Product> product = productService.findById(productId);
        model.addAttribute("productDetail", product.get());
        String manufactureDate = sdf.format(product.get().getManufactureDate());
        model.addAttribute("manufactureDate", manufactureDate);
        return "home/detail";
    }


}
