package com.example.tungtt_ph27337_sof3021_assignment_java_5.controller;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.ProductService;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.StatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/food")
public class StatisticalController {

    @Autowired
    private StatisticService statisticService;

    @Autowired
    private ProductService productService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @GetMapping("/view-statistical")
    public String viewStatistical(Model model) throws ParseException {
        model.addAttribute("listTop10", new ArrayList<>());
        return "statistical/statistical";
    }

    @GetMapping("/best-selling")
    public String getBestSellingTop10(@RequestParam String startDate, @RequestParam String endDate, Model model) throws ParseException {
        if ("".equals(startDate)) {
            startDate = "0000-01-01";
        }
        Date date1 = sdf.parse(startDate);
        Date date2 = "".equals(endDate) ? new Date() : sdf.parse(endDate);
        var list = statisticService.getTop10BestSelling(date1, date2);
        model.addAttribute("listTop10", list);
        model.addAttribute("title", "Top 10 Best Selling");
        String date1Str = sdf.format(date1);
        String date2Str = sdf.format(date2);
        model.addAttribute("startDate", date1Str);
        model.addAttribute("endDate", date2Str);
        return "statistical/statistical";
    }

    @GetMapping("/longest-stored")
    public String getLongestStoredTop10(@RequestParam String startDate, @RequestParam String endDate, Model model) throws ParseException {
        if ("".equals(startDate)) {
            startDate = "0000-01-01";
        }
        Date date1 = sdf.parse(startDate);
        Date date2 = "".equals(endDate) ? new Date() : sdf.parse(endDate);
        List<Product> list = statisticService.getTop10LongestStored(date1, date2);
        model.addAttribute("listTop10", list);
        model.addAttribute("title", "Top 10 Longest Stored");
        return "statistical/statistical";
    }
}
