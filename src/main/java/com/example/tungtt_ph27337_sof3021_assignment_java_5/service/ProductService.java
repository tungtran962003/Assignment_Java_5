package com.example.tungtt_ph27337_sof3021_assignment_java_5.service;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public interface ProductService {

    List<Product> findAll();

    Product addProduct(Product product);

    Product updateProduct(Product product);

    void deleteProduct(Integer productId);

    Product detailProduct(Integer productId);

    public Page<Product> getAllProduct(Pageable pageable);

//    List<Product> searchByName(String productName);

    Page<Product> getPage(Pageable pageable);

    Page<Product> searchByName(String productName, Pageable pageable);

    Page<Product> searchProduct(String productName, BigDecimal priceMin, BigDecimal priceMax, Pageable pageable);

    Optional<Product> findById(Integer productId);

    Page<Product> findAllDesc(Pageable pageable);

    Page<Product> findByProductName(String searchName, Pageable pageable);

    Page<Product> searchNameProduct(String productName, Pageable pageable);
}
