<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../css/index.css">
</head>

<body>
<%@include file="../layout/header.jsp" %>
<div class="d-flex w-100 mt-3 mb-5">
    <div class="w-5"></div>
    <div class="w-100">
        <div class="fw-bold fs-1 text-center mb-3">
            Checkout
        </div>
        <hr>
        <form action="/food/buy" method="post">
            <div class="pb-4 row">
                <div class="col-6 ">
                    <div class="border-filter-statistical pt-4">
                        <div class="fw-bold fs-5 text-center">
                            Billing Information
                        </div>
                        <div class="px-5 mt-3">
                            <div class="mb-3">
                                <label  class="form-label">Full name</label>
                                <input type="text" class="form-control" value="${acc.name}" disabled>
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Email</label>
                                <input type="text" class="form-control" value="${acc.email}" disabled>
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Phone Number</label>
                                <input type="text" class="form-control" value="${acc.phone}" disabled>
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Address</label>
                                <input type="text" class="form-control" value="${acc.address}" disabled>
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Note</label>
                                <input type="text" class="form-control" >
                            </div>
                            <div class="d-flex justify-content-center">
                                <!-- <button type="button" class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                  style="width: 150px;"><i class="fa-solid fa-filter fs-4"></i></button> -->
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-6">
                    <div class="border-filter-statistical pt-4">
                        <div class="fw-bold fs-5 text-center">
                            Order
                        </div>
                        <div class="px-5 mt-3">
                                <div class="mb-3 row">
                                    <label class="col-sm-6 col-form-label">Total amount of food in cart</label>
                                    <div class="col-sm-6">
                                        <input type="text" disabled class="form-control" value="${totalMoney}">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <button type="submit" class="btn btn-outline-info">Buy</button>
                                </div>
                        </div>
                    </div>

                </div>
            </div>
        </form>

    </div>
    <div class="w-5"></div>
</div>
<%@include file="../layout/footer.jsp" %>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>

</html>