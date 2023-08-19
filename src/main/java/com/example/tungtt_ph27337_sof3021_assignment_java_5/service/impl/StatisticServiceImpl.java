package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.ProductRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.rto.SearchProductRto;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.rto.SearchProductRtoToObject;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.ProductService;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.StatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class StatisticServiceImpl implements StatisticService {


    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SearchProductRtoToObject searchProductRtoToObject;

    @Override
    public List<Product> getTop10BestSelling(Date startDate, Date endDate) {
        List<SearchProductRto> bestSellingTop10 = productRepository.getBestSellingTop10(startDate, endDate, PageRequest.of(0, 10));
        List<Product> listProduct = new ArrayList<>();
        for (SearchProductRto top10 : bestSellingTop10) {
            Product product = searchProductRtoToObject.toDto1(top10);
            listProduct.add(product);
        }
//        List<Product> listProduct = bestSellingTop10.stream().map(bestTop10::toDto).collect(Collectors.toList());
        return listProduct;
    }

    @Override
    public List<Product> getTop10LongestStored(Date startDate, Date endDate) {
        List<SearchProductRto> longestStoredTop10 = productRepository.getLongestStoredTop10(startDate, endDate, PageRequest.of(0, 10));
        List<Product> listProduct = new ArrayList<>();
        for (SearchProductRto top10 : longestStoredTop10) {
            Product product = searchProductRtoToObject.toDto(top10);
            listProduct.add(product);
        }
        return listProduct;
    }



}
