package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.StatisticService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class StatisticServiceImpl implements StatisticService {


    @Override
    public List<Product> getTop10BestSelling(Date startDate, Date endDate) {
        return null;
    }

    @Override
    public List<Product> getTop10LongestStored(Date startDate, Date endDate) {
        return null;
    }
}
