package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Discount;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.DiscountRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountServiceImpl implements DiscountService {


    @Autowired
    private DiscountRepository discountRepository;

    @Override
    public Page<Discount> getAllDesc(Pageable pageable) {
        return discountRepository.getAllDesc(pageable);
    }

    @Override
    public Discount addDiscount(Discount discount) {
        return discountRepository.save(discount);
    }

    @Override
    public void deleteDiscount(Integer id) {
        discountRepository.deleteById(id);
    }

    @Override
    public Discount findById(Integer id) {
        return discountRepository.findById(id).orElse(null);
    }

    @Override
    public List<Discount> getAll() {
        return discountRepository.findAll();
    }
}
