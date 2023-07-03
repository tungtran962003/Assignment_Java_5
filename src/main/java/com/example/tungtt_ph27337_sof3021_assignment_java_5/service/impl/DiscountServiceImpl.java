package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Discount;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.DiscountService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountServiceImpl implements DiscountService {


    @Override
    public Page<Discount> getAllDesc(Pageable pageable) {
        return null;
    }

    @Override
    public Discount addDiscount(Discount discount) {
        return null;
    }

    @Override
    public void deleteDiscount(Integer id) {

    }

    @Override
    public Discount findById(Integer id) {
        return null;
    }

    @Override
    public List<Discount> getAll() {
        return null;
    }
}
