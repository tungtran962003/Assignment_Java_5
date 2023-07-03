package com.example.tungtt_ph27337_sof3021_assignment_java_5.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CartResponse {

    List<ProductInCartResponse> listProductInCartResponse;
}
