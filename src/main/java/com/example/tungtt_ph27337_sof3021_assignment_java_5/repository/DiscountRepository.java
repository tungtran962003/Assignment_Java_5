package com.example.tungtt_ph27337_sof3021_assignment_java_5.repository;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Discount;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Integer> {

    @Query(value = "select d from Discount d " +
            "order by d.id desc ")
    Page<Discount> getAllDesc(Pageable pageable);
}
