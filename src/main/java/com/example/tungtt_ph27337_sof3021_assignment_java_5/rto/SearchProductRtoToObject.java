package com.example.tungtt_ph27337_sof3021_assignment_java_5.rto;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper(componentModel = "spring")
public class SearchProductRtoToObject {
    public Product toDto(SearchProductRto rto) {
        if (rto == null) {
            return null;
        }

        Product p = new Product();
        p.setProductId(rto.getProductId());
        p.setProductName(rto.getProductName());
        p.setQuantity(rto.getQuantity());
        p.setPrice(rto.getPrice());
        p.setOrigin(rto.getOrigin());
        p.setManufactureDate(rto.getManufactureDate());
        p.setQuantityBuy(rto.getQuantityBuy());
        p.setImage(rto.getImage());
        return p;
    }
}
