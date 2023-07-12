package com.example.tungtt_ph27337_sof3021_assignment_java_5.controller;

import com.example.tungtt_ph27337_sof3021_assignment_java_5.entity.Product;
import com.example.tungtt_ph27337_sof3021_assignment_java_5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/food")
public class ProductController {

    @Autowired
    private ProductService productService;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public String UPLOAD_DIRECTORY = System.getProperty("user.dir") + "/uploads";


    @GetMapping("/listFood")
    public String getAllProduct(Model model, @RequestParam(defaultValue = "1") int page) throws InterruptedException {
        Page<Product> pageProduct;
        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by("productId").descending());
        pageProduct = productService.getPage(pageable);
        model.addAttribute("pageProduct", pageProduct);
        return "product/product";
    }


    @PostMapping("/addFood")
    public String addProduct(Model model, @RequestParam(name = "productName") String productName,
                             @RequestParam(name = "quantity") Integer quantity,
                             @RequestParam(name = "price") BigDecimal price,
                             @RequestParam(name = "origin") String origin,
                             @RequestParam(name = "manufactureDate") String manufactureDateStr,
                             @RequestParam(name = "file") MultipartFile file,
                             @RequestParam(name = "discountId") Integer discountId) {
        Date manufactureDate;
        try {
            manufactureDate = sdf.parse(manufactureDateStr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String fullFileName = file.getOriginalFilename();
        String[] splitStr = fullFileName.split("\\.");
        String fileName = splitStr[0];
        String extention = splitStr[1];
        String newFileName = fileName + new Date().getTime() + "." + extention;
        try {
            FileCopyUtils.copy(file.getBytes(), new File(UPLOAD_DIRECTORY + "/" + newFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        Product product = new Product
                (null, productName, quantity, price, origin, manufactureDate, newFileName, 0, new Date());
        productService.addProduct(product);
        return "redirect:/food/listFood";
    }


    @GetMapping("/detailFood/{productid}")
    public String detailProduct(Model model, @PathVariable(name = "productid") Integer productId,
                                @RequestParam(defaultValue = "1") int page) {
        Product product = productService.detailProduct(productId);
        Page<Product> pageProduct;
        String manufactureDate = sdf.format(product.getManufactureDate());
        model.addAttribute("manufactureDate", manufactureDate);
        model.addAttribute("productDetail", product);
        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by("productId").descending());
        pageProduct = productService.getPage(pageable);
        model.addAttribute("pageProduct", pageProduct);
        return "product/product";
    }

    @PostMapping("/updateFood/{productId}")
    public String updateProduct(Model model, @PathVariable(name = "productId") Integer productId,
                                @RequestParam(name = "productName") String productName,
                                @RequestParam(name = "quantity") Integer quantity,
                                @RequestParam(name = "price") BigDecimal price,
                                @RequestParam(name = "origin") String origin,
                                @RequestParam(name = "manufactureDate") String manufactureDateStr,
                                @RequestParam(name = "file") MultipartFile file,
                                @RequestParam(name = "fileName") String theFileName,
                                @RequestParam(name = "discountId") Integer discountId) {
        Date manufactureDate;
        try {
            manufactureDate = sdf.parse(manufactureDateStr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String newFileName = "";
        if ("".equals(theFileName)) {
            String fullFileName = file.getOriginalFilename();
            String[] splitStr = fullFileName.split("\\.");
            String fileName = splitStr[0];
            String extention = splitStr[1];
            newFileName = fileName + new Date().getTime() + "." + extention;
            try {
                FileCopyUtils.copy(file.getBytes(), new File(UPLOAD_DIRECTORY + "/" + newFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            newFileName = theFileName;
        }

        var p = productService.findById(productId).orElse(null);
        Product product = new Product
                (productId, productName, quantity, price, origin, manufactureDate, newFileName, p.getQuantity(), p.getCreatedAt());
        productService.addProduct(product);
        return "redirect:/food/listFood";
    }

    @GetMapping("/deleteFood/{productId}")
    public String deleteProduct(@PathVariable(name = "productId") Integer productId) {
        productService.deleteProduct(productId);
        return "redirect:/food/listFood";
    }

    @GetMapping("/search")
    public String searchByProductName(Model model, @RequestParam(required = false) String productNameSearch,
                                      @RequestParam(required = false) BigDecimal priceMin,
                                      @RequestParam(required = false) BigDecimal priceMax,
                                      @RequestParam(defaultValue = "1") int page) {
        Page<Product> pageSearch;
        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by("productId").descending());
        if (priceMax == null) {
            priceMax = BigDecimal.valueOf(Integer.MAX_VALUE);
        }
        if (priceMin == null) {
            priceMin = BigDecimal.valueOf(0);
        }
        if (priceMax.intValue() == 0 && priceMin.intValue() == 0) {
            priceMax = BigDecimal.valueOf(Integer.MAX_VALUE);
//            priceMin = null;
        }
        pageSearch = productService.searchProduct(productNameSearch, priceMin, priceMax, pageable);
        model.addAttribute("pageProduct", pageSearch);
        model.addAttribute("pageSearch", pageSearch);

        return "product/product";
//        return ResponseEntity.ok(pageSearch);
    }

    @GetMapping("/")
    public String searchByPrice(Model model, @RequestParam(required = false) BigDecimal priceMin,
                                @RequestParam(required = false) BigDecimal priceMax) {

        return "product/product";
    }

    @GetMapping("/images/{fileName}")
    public ResponseEntity<?> getImage(@PathVariable String fileName) throws IOException {
        if (StringUtils.isEmpty(fileName)) {
            return null;
        }
        /* tung.png => png
         * */
        String[] full = fileName.split("\\.");
        String extesion = full[1].toLowerCase();


        // chuyển image thành byte array
        BufferedImage bufferedImage = ImageIO.read(new File(UPLOAD_DIRECTORY + "/" + fileName));
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage, extesion, byteArrayOutputStream);
        byte[] bytes = byteArrayOutputStream.toByteArray();

        // trả lại ảnh
        return ResponseEntity.status(HttpStatus.OK)
                .contentType(MediaType.valueOf("image/" + extesion))
                .body(bytes);
    }


}
