package com.example.tungtt_ph27337_sof3021_assignment_java_5.response;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Discount;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductInCartResponse {

    private Integer id;

    private String productName;

    private Integer quantity;

    private BigDecimal price;

    private String origin;

    private Date manufactureDate;

    private String image;

    private Integer quantityInCart = 0;

    private Discount discount;
}