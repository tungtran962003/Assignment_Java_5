package com.example.tungtt_ph27337_sof3021_assignment_java_5.service;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;

import java.util.Date;
import java.util.List;

public interface StatisticService {
    List<Product> getTop10BestSelling(Date startDate, Date endDate);

    List<Product> getTop10LongestStored(Date startDate, Date endDate);

}
