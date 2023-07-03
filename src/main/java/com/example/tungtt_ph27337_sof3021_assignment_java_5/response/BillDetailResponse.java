package com.example.tungtt_ph27337_sof3021_assignment_java_5.response;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class BillDetailResponse {
    private Integer id;
    private String productName;
    private BigDecimal unitPrice;
    private String image;
    private Integer quantity;
    private BigDecimal money;
}
