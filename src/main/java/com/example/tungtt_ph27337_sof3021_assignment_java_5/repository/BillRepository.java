package com.example.tungtt_ph27337_sof3021_assignment_java_5.repository;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BillRepository extends JpaRepository<Bill, Integer> {
}