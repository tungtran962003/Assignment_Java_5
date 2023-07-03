package com.example.tungtt_ph27337_sof3021_assignment_java_5.service;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.BillResponse;

import java.util.List;

public interface BillService {

    List<BillResponse> getAllBill(Integer userId, String username);
}
