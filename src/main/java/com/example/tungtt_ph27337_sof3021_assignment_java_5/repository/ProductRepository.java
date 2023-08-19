package com.example.tungtt_ph27337_sof3021_assignment_java_5.repository;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.rto.SearchProductRto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

//    @Query("SELECT p FROM Product p where p.deleted = true  ORDER BY p.productId desc ")
//    Page<Product> findAllDesc(Pageable pageable);

//    @Query(value = "select * from Product ", nativeQuery = true)
    Page<Product> findAll(Pageable pageable);

//    @Query(value = "select * from Product p where p.deleted = 1 order by p.product_id desc", nativeQuery = true)
//    Page<Product> getAllProduct(Pageable pageable);

    Page<Product> findAllByDeleted(Boolean deleted, Pageable pageable);

    Page<Product> findAllByProductNameContains(String productName, Pageable pageable);

    Page<Product> findByProductNameContainsOrderByProductIdDesc(String searchName, Pageable pageable);

    Page<Product> findAllByDeletedAndProductNameContainsOrderByProductIdDesc(String searchName, Pageable pageable, Boolean deleted);

//    Page<Product> findByProductNameContainsOrderByProductIdDesc

    Page<Product> findAllByProductNameContainsAndPriceBetween(String productName, BigDecimal minPrice, BigDecimal maxPrice, Pageable pageable);

    @Query(value = "select p.productId as productId, " +
            "p.productName as productName, " +
            "p.quantityBuy as quantityBuy, " +
            "bd.quantity as quantity, " +
            "p.price as price, " +
            "p.manufactureDate as manufactureDate, " +
            "p.image as image, " +
            "p.origin as origin " +
            "from Bill b " +
            "inner join BillDetail bd on b.id = bd.bill.id " +
            "inner join Product p on p.productId = bd.product.productId " +
            "where  b.orderDate between :startDate and :endDate order by p.quantityBuy desc ")
    List<SearchProductRto> getBestSellingTop10(Date startDate, Date endDate, PageRequest pageRequest);

    @Query(value = "SELECT p.productId as productId, " +
            "p.quantity as quantity, " +
            "p.quantityBuy as quantityBuy, " +
            "p.price as price, " +
            "p.origin as origin, " +
            "p.image as image, " +
            "p.manufactureDate as manufactureDate, " +
            "p.productName as productName, " +
            "p.createdAt as createdAt " +
            "FROM Product p WHERE p.quantityBuy = 0 " +
            "and p.createdAt between :startDate and :endDate " +
            " order by p.createdAt asc ")
    List<SearchProductRto> getLongestStoredTop10(Date startDate, Date endDate, PageRequest pageRequest);

//    List<SearchProductRto> findAllBy
}
