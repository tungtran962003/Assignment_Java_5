package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.ProductRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.rto.SearchProductRto;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.rto.SearchProductRtoToObject;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SearchProductRtoToObject searchProductRtoToObject;

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product addProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public void deleteProduct(Integer productId) {
        productRepository.deleteById(productId);
    }

    @Override
    public Product detailProduct(Integer productId) {
        return productRepository.findById(productId).orElse(null);
    }

    @Override
    public Page<Product> getPage(Pageable pageable) {
        return productRepository.findAllByDeleted(Boolean.TRUE, pageable);
    }

    public Page<Product> getAllProduct(Pageable pageable) {
        return productRepository.findAllByDeleted(Boolean.TRUE, pageable);
    }

    @Override
    public Page<Product> searchByName(String productName, Pageable pageable) {
        return null;
    }

    @Override
    public Page<Product> searchProduct(String productName, BigDecimal priceMin, BigDecimal priceMax, Pageable pageable) {
        return productRepository.findAllByProductNameContainsAndPriceBetween(productName, priceMin, priceMax, pageable);
    }

    @Override
    public Page<Product> searchNameProduct(String productName, Pageable pageable) {
        return productRepository.findAllByProductNameContains(productName, pageable);
    }

    @Override
    public Optional<Product> findById(Integer productId) {
        return productRepository.findById(productId);
    }

    @Override
    public Page<Product> findAllDesc(Pageable pageable) {
        return null;
    }

    @Override
    public Page<Product> findByProductName(String searchName, Pageable pageable) {
        return productRepository.findAllByDeletedAndProductNameContainsOrderByProductIdDesc(searchName, pageable, true);
    }
}
