package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Account;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.AccountRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.LoginResponse;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public Boolean checkAccount(String username, String password) {
        List<Account> listAccount = accountRepository.findAll();
        for (Account account: listAccount) {
            if (account.getUsername().equals(username) && account.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public LoginResponse login(String username, String password) {
        Optional<Account> optionalAccount = accountRepository.findByUsernameAndPassword(username, password);
        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            LoginResponse loginResponse = LoginResponse.builder().username(username).role(account.getRole()).build();
            return loginResponse;
        }
        return null;
    }

    @Override
    public Account addAccount(Account account) {
        return accountRepository.save(account);
    }


    @Override
    public Integer findByUserAndPass(String username, String password) {
        Optional<Account> optionalAccount = accountRepository.findByUsernameAndPassword(username, password);
        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            Integer id = account.getId();
            return id;
        }
        return null;
    }

    @Override
    public Optional<Account> findById(Integer id) {
        Optional<Account> account = accountRepository.findById(id);
        return account;
    }

    @Override
    public List<Account> findAll() {
        List<Account> listAccount = accountRepository.findAll();
        return listAccount;
    }

    @Override
    public Optional<Account> findByUsername(String username) {
        return accountRepository.findByUsername(username);
    }
}
