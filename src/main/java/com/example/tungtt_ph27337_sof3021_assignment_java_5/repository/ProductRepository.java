package com.example.tungtt_ph27337_sof3021_assignment_java_5.repository;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("SELECT p FROM Product p ORDER BY p.productId desc ")
    Page<Product> findAllDesc(Pageable pageable);

    Page<Product> findByProductNameContainsOrderByProductIdDesc(String searchName, Pageable pageable);

    @Query(value = "SELECT p.productId as productId, " +
            " p.productName as productName, " +
            "p.quantity as quantity, " +
            "p.price as price," +
            " p.origin as origin," +
            " p.manufactureDate as manufactureDate, " +
            "p.quantityBuy as quantitybuy, " +
            "d.name as name " +
            "from Product p " +
            "inner join Discount d on p.discount.id = d.id" +
            " where 1 = 1 and " +
            " ( p.productName is null or p.productName like %:productName%) " +
            " and  ( (:priceMin is null or :priceMax is null) or p.price between :priceMin and :priceMax) ")
    Page<Product> searchProduct(String productName, BigDecimal priceMin, BigDecimal priceMax, Pageable pageable);
}
