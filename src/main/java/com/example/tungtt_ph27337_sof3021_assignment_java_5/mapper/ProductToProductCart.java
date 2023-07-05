package com.example.tungtt_ph27337_sof3021_assignment_java_5.mapper;


import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.ProductInCartResponse;

public class ProductToProductCart {
    public static ProductInCartResponse toProductCart(Product product) {
        return ProductInCartResponse.builder()
                .id(product.getProductId())
                .productName(product.getProductName())
                .quantity(product.getQuantity())
                .price(product.getPrice())
                .origin(product.getOrigin())
                .manufactureDate(product.getManufactureDate())
                .quantityInCart(1)
                .image(product.getImage()).build();
    }

    public static Product cartToProduct(ProductInCartResponse productInCartResponse) {
        return Product.builder()
                .productName(productInCartResponse.getProductName())
                .productId(productInCartResponse.getId())
                .quantity(productInCartResponse.getQuantity())
                .price(productInCartResponse.getPrice())
                .origin(productInCartResponse.getOrigin())
                .manufactureDate(productInCartResponse.getManufactureDate())
                .image(productInCartResponse.getImage()).build();
    }
}
