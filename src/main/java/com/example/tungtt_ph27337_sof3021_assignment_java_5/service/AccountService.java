package com.example.tungtt_ph27337_sof3021_assignment_java_5.service;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Account;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.LoginResponse;

import java.util.List;
import java.util.Optional;

public interface AccountService {

    Boolean checkAccount(String username, String password);

    LoginResponse login(String username, String password);

    Account addAccount(Account account);

    Integer findByUserAndPass(String username, String password);

    Optional<Account> findById(Integer id);

    List<Account> findAll();
}
