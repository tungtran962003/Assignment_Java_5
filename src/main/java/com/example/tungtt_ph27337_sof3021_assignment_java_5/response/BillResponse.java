package com.example.tungtt_ph27337_sof3021_assignment_java_5.response;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class BillResponse {
    private String customerName;
    private Integer billId;
    private Date orderDate;
    private List<BillDetailResponse> details;
    private BigDecimal totalMoney;
}
