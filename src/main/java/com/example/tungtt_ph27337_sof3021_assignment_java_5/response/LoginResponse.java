package com.example.tungtt_ph27337_sof3021_assignment_java_5.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginResponse {
    private String username;
    private String role;
    private String phone;
    private String address;
    private String email;
}
