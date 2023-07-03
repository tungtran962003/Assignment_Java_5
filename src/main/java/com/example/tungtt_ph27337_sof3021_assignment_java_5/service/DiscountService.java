package com.example.tungtt_ph27337_sof3021_assignment_java_5.service;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Discount;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface DiscountService {

    Page<Discount> getAllDesc(Pageable pageable);

    Discount addDiscount(Discount discount);
    void deleteDiscount(Integer id);

    Discount findById(Integer id);

    List<Discount> getAll();
}
