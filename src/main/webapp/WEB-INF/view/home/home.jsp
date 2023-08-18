<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../../css/index.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>

<body class="">
<%@include file="../layout/header.jsp" %>
<div class="w-100 d-flex">
    <div class="w-5"></div>
    <div class="w-100 mt-4">
        <div class="row">
            <div class="col-lg-8 mb-5">
                <div id="carouselExampleAutoplaying" class="carousel slide h-100" data-bs-ride="carousel">
                    <div class="carousel-inner h-100">
                        <div class="carousel-item active">
                            <img src="../../../images/slide3.png" class="d-block w-100 h-100">
                        </div>
                        <div class="carousel-item">
                            <img src="../../../images/slide1.png" class="d-block w-100 h-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="../../../images/slide2.png" class="d-block w-100 h-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div class="col-lg-4 mb-5">
                <div class="mb-4">
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="../../../images/sale1.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 20%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-info">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="../../../images/sale2.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 20%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-info">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="mt-5 row mb-5">
            <div class="bg-white col-lg-3 col-md-6 col-sm-12 fs-5 fw-bold">
                <div class=" bg-light" style="height: 80px;">
                    <div class="border-service">
                        <i class="fa-solid fa-check me-2 fs-3" style="color: #0abde3;"></i> Quanlity Product
                    </div>
                </div>
            </div>
            <div class="bg-white col-lg-3 col-md-6 col-sm-12 fs-5 fw-bold">
                <div class=" bg-light" style="height: 80px;">
                    <div class="border-service">
                        <i class="fa-solid fa-phone-volume me-2 fs-3" style="color: #0abde3;"></i> 24/7 Support
                    </div>
                </div>
            </div>
            <div class="bg-white col-lg-3 col-md-6 col-sm-12 fs-5 fw-bold">
                <div class=" bg-light" style="height: 80px;">
                    <div class="border-service">
                        <i class="fa-solid fa-xmark me-2 fs-3" style="color: #0abde3;"></i> No Preservatives
                    </div>
                </div>
            </div>
            <div class="bg-white col-lg-3 col-md-6 col-sm-12 fs-5 fw-bold">
                <div class=" bg-light" style="height: 80px;">
                    <div class="border-service">
                        <i class="fa-solid fa-hand-holding-dollar me-2 fs-3" style="color: #0abde3;"></i> Good price
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex mt-5 align-items-center justify-content-between">
            <div class="fs-3 fw-bold">
                LIST FOOD
            </div>
            <div class="w-25">
                <form action="/food/search-name-product" method="get">
                    <div class="d-flex justify-content-between">
                        <div>
                            <input type="text" class="form-control" width="120px" value="${param.productNameSearch}"
                                   name="productNameSearch" placeholder="search food name...">
                        </div>
                        <div>
                            <button type="submit"
                                    class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                    style="width: 100px;"><i class="fa-solid fa-magnifying-glass fs-4"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <hr>

        <div class="">
            <div class="row ">
                <c:forEach items="${pageProduct.getContent()}" var="product">
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="http://localhost:27337/food/images/${product.image}">
                                <div class="product-action">
                                        <%--                                    <a class="btn btn-outline-dark " href="/food/add-cart/${product.productId}"><i--%>
                                        <%--                                            class="fa fa-shopping-cart"></i></a>--%>
                                        <%--                                    <a class="btn btn-outline-dark " href=""><i class="fa-solid fa-heart"></i></a>--%>
                                    <a class="btn btn-outline-dark "
                                       href="/food/detail-food/${product.productId}">
                                        <i class="fa-solid fa-eye"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <div class="h5 text-decoration-none text-truncate" href="">${product.productName}</div>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h5>${product.price}</h5>
<%--                                    <h5 class="text-muted ml-2">--%>
<%--                                        <del>${product.price + 1000}</del>--%>
<%--                                    </h5>--%>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mb-1">
                                    <small class="fa fa-star text-warning mr-1"></small>
                                    <small class="fa fa-star text-warning mr-1"></small>
                                    <small class="fa fa-star text-warning mr-1"></small>
                                    <small class="fa fa-star text-warning mr-1"></small>
                                    <small class="fa fa-star text-warning mr-1"></small>
                                    <small> (99)</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="d-flex justify-content-center mb-4 mt-5">
                    <div>
                        <%--                    <c:if test="${pageProduct.getNumber() + 1 > 1}">--%>
                        <%--                        <a class="text-decoration-none btn btn-outline-info"--%>
                        <%--                           href="?page=${0}&productNameSearch=${param.productNameSearch}">--%>
                        <%--                            <i class="fa-solid fa-backward-fast"></i>--%>
                        <%--                        </a>--%>
                        <%--                    </c:if>--%>

                        <c:if test="${pageProduct.getNumber() + 1 > 1}">
                            <a class="text-decoration-none btn btn-outline-info"
                               href="?page=${pageProduct.getNumber()}&productNameSearch=${param.productNameSearch}">
                                <i class="fa-solid fa-left-long"></i>
                            </a>
                        </c:if>

                        <span class="btn">${pageProduct.getNumber() + 1} / ${pageProduct.getTotalPages()} </span>

                        <c:if test="${pageProduct.getNumber() + 1 lt pageProduct.getTotalPages()}">
                            <a class="text-decoration-none btn btn-outline-info"
                               href="?page=${pageProduct.getNumber() + 2}&productNameSearch=${param.productNameSearch}">
                                <i class="fa-solid fa-right-long"></i>
                            </a>
                        </c:if>

                        <%--                    <c:if test="${pageProduct.getNumber() + 1 lt pageProduct.getToTalPages()}">--%>
                        <%--                        <a class="text-decoration-none btn btn-outline-info"--%>
                        <%--                           href="?page=${pageProduct.getToTalPages()}&productNameSearch=${param.productNameSearch}">--%>
                        <%--                            <i class="fa-solid fa-forward-fast"></i>--%>
                        <%--                        </a>--%>
                        <%--                    </c:if>--%>
                    </div>
                </div>
            </div>
        </div>

        <div class=" pt-5 pb-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="product-offer mb-30" style="height: 300px;">
                        <img class="img-fluid" src="../../../images/sale1.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 20%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-info">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="product-offer mb-30" style="height: 300px;">
                        <img class="img-fluid" src="../../../images/sale2.png" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 20%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-info">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <div class="w-5"></div>
</div>
<%@include file="../layout/footer.jsp" %>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</body>

</html>