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
<div class="height-signin mt-1">
    <div class="w-100 row m-0 p-0">
        <div class="witdh-signin-left col-md-6 m-0 p-0">
            <div>
                <a href="" class="text-decoration-none border-name-shop d-flex">
                    <span class="h1 text-uppercase text-info bg-dark px-2 fw-bold border border-white">Flavor</span>
                    <span class="h1 text-uppercase text-dark bg-info px-2 ml-n1 fw-bold border border-white">Fusion</span>
                </a>
            </div>

            <div class="d-flex justify-content-center mt-5">
                <img src="../../../images/logo.png" width="30%">
            </div>

            <div class="content-signin-smartshop px-3">
                We always try to bring the best experience to our customers
            </div>
        </div>

        <div class="witdh-signin-right col-md-6 m-0 p-0">
            <form action="/food/forgot-password" method="post">
                <div class="w-100">
                    <div class="border-form-signin mb-5">
                        <div class="border-right-signin">

                            <div>
                                <div class="header-signin">Password Recovery</div>
                            </div>
                            <label class="title-signin">
                                Please enter your email and we'll send you a link to create a new password
                            </label>
                            <input class="input-signin mt-3" type="text" placeholder="Please enter your email..."
                            name="email">
                            <% String forgot = (String) session.getAttribute("forgotPassword"); %>

                            <div class="text-center mt-4">
                                <button type="submit" class="btn-signin">Confirm Email
                                    <i class="fa-solid fa-arrow-right-to-bracket ms-2"></i></button>
                            </div>
                            <% if (forgot != null) { %>
                                <div style="color: green">
                                    ${forgotPassword}
                                </div>
                            <% }  else { %>
                                <div style="color: red">
                                    ${err}
                                </div>
                            <% } %>

                            <div class="d-flex justify-content-end mt-3">
                                <a class="link-signup me-2" href="/food/view-login">Login</a>
                                <div>or</div>
                                <a class="link-signup" href="/food/view-register">Register</a>
                            </div>
                        </div>
                    </div>
                    <div class="border-content-down-signin mt-5 px-5 text-center">
                        © 2023 The sales website is owned by Developer TungTT. Operated by TungTT. All rights reserved
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // function clickUpdate() {
    //     var add = confirm("Are you sure of your choice?")
    //     if (add) {
    //         document.getElementById('form-forgot').action = '/food/forget-password'
    //         document.getElementById('form-forgot').method = 'post'
    //         document.getElementById('form-forgot').submit()
    //         alert("Add data successfully")
    //     } else {
    //         return null
    //     }
    // }
</script>
<%@include file="../layout/footer.jsp" %>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>
</html>