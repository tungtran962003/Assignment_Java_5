package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Bill;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.AccountRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.BillDetailRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.BillRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.ProductRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.BillDetailResponse;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.BillResponse;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class BillServiceImpl implements BillService {


    @Autowired
    private BillRepository billRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private BillDetailRepository billDetailRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<BillResponse> getAllBill(Integer userId, String username) {
        var account = accountRepository.findById(userId).orElse(null);
        String name = account == null ? "" : account.getName();
        List<Bill> bills = billRepository.findByAccountIdOrderByOrderDateDesc(userId);
        List<BillResponse> billResponses = new ArrayList<>();
        for (int i = 0; i < bills.size(); i++) {
            BillResponse billResponse = new BillResponse();
            billResponse.setCustomerName(name);
            billResponse.setBillId(bills.get(i).getId());
            billResponse.setOrderDate(bills.get(i).getOrderDate());
            List<BillDetailResponse> billDetails = getBillDetail(bills.get(i).getId());
            billResponse.setDetails(billDetails);
            var money = calculateMoney(billResponse);
            billResponse.setTotalMoney(money);
            billResponses.add(billResponse);
        }
        return billResponses;
    }

    private List<BillDetailResponse> getBillDetail(Integer billId) {
        var billDetails = billDetailRepository.findAllByBillId(billId);
        var list = new ArrayList<BillDetailResponse>();
        for (var detail: billDetails) {
            var product = productRepository.findById(detail.getProduct().getProductId()).orElse(null);
            var billDetailResponse = new BillDetailResponse();
            billDetailResponse.setId(detail.getId());
            billDetailResponse.setProductName(product.getProductName());
            billDetailResponse.setImage(product.getImage());
            billDetailResponse.setQuantity(detail.getQuantity());
            billDetailResponse.setUnitPrice(product.getPrice());
            var unitPrice = product.getPrice().floatValue();
            unitPrice = unitPrice * detail.getQuantity();
            billDetailResponse.setMoney(new BigDecimal(unitPrice));
            list.add(billDetailResponse);
        }
        return list;
    }

    private BigDecimal calculateMoney(BillResponse response) {
        float money = 0;
        for (var item: response.getDetails()) {
            money += item.getMoney().floatValue();
        }
        return new BigDecimal(money);
    }
}
