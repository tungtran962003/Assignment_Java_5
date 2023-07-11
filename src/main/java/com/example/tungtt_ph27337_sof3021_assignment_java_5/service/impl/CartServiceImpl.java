package com.example.tungtt_ph27337_sof3021_assignment_java_5.service.impl;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Account;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Bill;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.BillDetail;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.mapper.ProductToProductCart;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.AccountRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.BillDetailRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.BillRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.repository.ProductRepository;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.response.ProductInCartResponse;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.CartService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service
public class CartServiceImpl implements CartService {

    //private CartResponse cartResponse = new CartResponse();

//    @Autowired
//    private ProductService productService;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private BillRepository billRepository;

    @Autowired
    private BillDetailRepository billDetailRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<ProductInCartResponse> addToCart(HttpServletRequest request, Integer id) {
        Product product = productRepository.findById(id).orElse(null);
        List<ProductInCartResponse> cart = getCart(request);
        if (product != null) {
            int index = -1;
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getId().intValue() == product.getProductId().intValue()) {
                    index = i;
                    break;
                }
            }
            if (index != -1) {
                cart.get(index).setQuantityInCart( cart.get(index).getQuantityInCart() + 1);
            } else {
                cart.add(ProductToProductCart.toProductCart(product));
            }
        }
        return cart;
    }

    @Override
    public List<ProductInCartResponse> getCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<ProductInCartResponse> cartResponseList = (List<ProductInCartResponse>) session.getAttribute("cart");
        if (cartResponseList == null) {
            cartResponseList = new ArrayList<>();
            session.setAttribute("cart", cartResponseList);
        }
        return cartResponseList;
    }

    @Override
    public List<ProductInCartResponse> deleteFromCart(HttpServletRequest request, Integer id) {
        Product product = productRepository.findById(id).orElse(null);
        List<ProductInCartResponse> cart = getCart(request);
        if (product != null) {
            int index = -1;
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getId().intValue() == product.getProductId().intValue()) {
                    index = i;
                    break;
                }
            }
            if (index != -1) {
                if (cart.get(index).getQuantityInCart() == 1) {
                    cart.remove(index);
                } else {
                    cart.get(index).setQuantityInCart( cart.get(index).getQuantityInCart() - 1);
                }
            }
        }
        return cart;
    }

    @Override
    public List<ProductInCartResponse> deleteOneLineCart(HttpServletRequest request, Integer id) {
        Product product = productRepository.findById(id).orElse(null);
        List<ProductInCartResponse> cart = getCart(request);
        if (product != null) {
            int index = -1;
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getId().intValue() == product.getProductId().intValue()) {
                    index = i;
                    break;
                }
            }
            if (index != -1) {
                cart.remove(index);
            }
        }
        return cart;
    }

    @Override
    public BigDecimal totalMoney(List<ProductInCartResponse> cart) {
        if (cart == null) {
            return new BigDecimal(0);
        }
        if (cart.isEmpty()) {
            return new BigDecimal(0);
        }
        float count = 0;
        for (int i = 0; i < cart.size(); i++) {
            float price = cart.get(i).getPrice().floatValue();
            float quantity = cart.get(i).getQuantityInCart().floatValue();
            count += price * quantity;
        }
        return new BigDecimal(count);
    }

    @Override
    public void buy(List<ProductInCartResponse> cart, Account account, HttpServletRequest request) {
        // create bill
        Date date = new Date();
        Bill bill = Bill.builder().account(account).orderDate(date).build();
        Bill billResponse = billRepository.save(bill);

        // create bill detail
        for (int i = 0; i < cart.size(); i++) {
            BillDetail billDetail = new BillDetail();
            billDetail.setQuantity(cart.get(i).getQuantityInCart());
            billDetail.setBill(billResponse);
            Product product = ProductToProductCart.cartToProduct(cart.get(i));
            billDetail.setProduct(product);
            billDetailRepository.save(billDetail);
            product.setQuantity(product.getQuantity() - cart.get(i).getQuantityInCart());
            Integer quantityBuy = product.getQuantityBuy() == null ? Integer.valueOf(0) : product.getQuantityBuy();
            quantityBuy = quantityBuy + cart.get(i).getQuantityInCart();
            product.setQuantityBuy(quantityBuy);
            productRepository.save(product);
        }
        cart = new ArrayList<ProductInCartResponse>();
        request.getSession().setAttribute("cart", cart);

    }
}
