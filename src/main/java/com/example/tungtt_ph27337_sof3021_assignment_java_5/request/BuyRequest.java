package com.example.tungtt_ph27337_sof3021_assignment_java_5.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BuyRequest {
    private String name;
    private String email;
    private String phone;
    private String address;
    private String note;
}
