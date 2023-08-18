package com.example.tungtt_ph27337_sof3021_assignment_java_5.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "product")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productId")
    private Integer productId;

    @Column(name = "productName")
    private String productName;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "origin")
    private String origin;

    @Column(name = "manufactureDate")
    private Date manufactureDate;

    @Column(name = "image")
    private String image;

    @Column(name = "quantityBuy")
    private Integer quantityBuy;

    @Column(name = "createdAt")
    private Date createdAt;

    @Column(name = "deleted")
    private Boolean deleted;

}
