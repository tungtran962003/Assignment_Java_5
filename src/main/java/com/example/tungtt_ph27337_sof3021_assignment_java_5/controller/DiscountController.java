package com.example.tungtt_ph27337_sof3021_assignment_java_5.controller;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Discount;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/food")
public class DiscountController {

    @Autowired
    private DiscountService discountService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @GetMapping("/view-discount")
    public String viewDiscount(Model model, @RequestParam(defaultValue = "1") int page) {
        Page<Discount> pageDiscount;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 4);
        pageDiscount = discountService.getAllDesc(pageable);
        model.addAttribute("pageDiscount", pageDiscount);
        List<Discount> list = discountService.getAll();
        model.addAttribute("list", list);
        return "product/discount";
    }

    @PostMapping("/add-discount")
    public String addDiscount(@RequestParam(name = "name") String name,
                              @RequestParam(name = "startDate") String startDate,
                              @RequestParam(name = "endDate") String endDate,
                              @RequestParam(name = "value")BigDecimal value,
                              @RequestParam(name = "description") String description) throws ParseException {
        Discount discount = new Discount(null, name, sdf.parse(startDate), sdf.parse(endDate), value, description);
        discountService.addDiscount(discount);
        return "redirect:/food/view-discount";
    }

    @GetMapping("/delete-discount/{id}")
    public String deleteDiscount(@PathVariable Integer id) {
        discountService.deleteDiscount(id);
        return "redirect:/food/view-discount";
    }
}
