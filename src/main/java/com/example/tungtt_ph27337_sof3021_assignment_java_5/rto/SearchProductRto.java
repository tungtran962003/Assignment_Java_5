package com.example.tungtt_ph27337_sof3021_assignment_java_5.rto;

import java.math.BigDecimal;
import java.util.Date;

public interface SearchProductRto {
    Integer getProductId();
    String getProductName();
    Integer getQuantity();
    BigDecimal getPrice();
    String getOrigin();
    Date getManufactureDate();
    String getImage();
    Integer getQuantityBuy();
    Date getCreatedAt();
}
