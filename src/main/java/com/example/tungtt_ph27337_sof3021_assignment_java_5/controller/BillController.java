package com.example.tungtt_ph27337_sof3021_assignment_java_5.controller;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.BillResponse;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.BillService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/food")
public class BillController {

    @Autowired
    private BillService billService;

    @GetMapping("/bills")
    public String getAllBill(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        Integer id = (Integer) session.getAttribute("id");
        if (username == null) {
            return "redirect:/food/view-login";
        }
        List<BillResponse> billResponses = billService.getAllBill(id, username);
        model.addAttribute("billResponses", billResponses);
        return "order/order";
    }
}
