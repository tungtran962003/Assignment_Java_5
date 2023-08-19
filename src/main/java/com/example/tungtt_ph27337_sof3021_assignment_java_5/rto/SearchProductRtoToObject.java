package com.example.tungtt_ph27337_sof3021_assignment_java_5.rto;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel = "spring")
public class SearchProductRtoToObject {
    public Product toDto(SearchProductRto rto) {
        return Product.builder().productId(rto.getProductId())
                .quantityBuy(rto.getQuantityBuy())
                .productName(rto.getProductName())
                .manufactureDate(rto.getManufactureDate())
                .price(rto.getPrice())
                .image(rto.getImage())
                .origin(rto.getOrigin())
                .quantity(rto.getQuantity()).build();
    }

    public Product toDto1(SearchProductRto rto) {
        return Product.builder().productId(rto.getProductId())
                .quantityBuy(rto.getQuantity())
                .productName(rto.getProductName())
                .manufactureDate(rto.getManufactureDate())
                .price(rto.getPrice())
                .image(rto.getImage())
                .origin(rto.getOrigin())
                .quantity(rto.getQuantity()).build();
    }
}
