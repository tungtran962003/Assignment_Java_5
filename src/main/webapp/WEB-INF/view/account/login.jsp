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
            <div class="d-flex flex-column">
                <div class="w-100 mb-auto">
                    <div class="border-form-signin">
                        <div class="border-right-signin">
                            <form action="/food/login" method="post">
                                <% String checkAccount = (String) request.getAttribute("fail"); %>

                                <div>
                                    <div class="header-signin">Login</div>
                                </div>

                                <label class="title-signin d-flex justify-content-between mb-2">
                                    <div>Username</div>
                                    <% if (checkAccount != null) { %>
                                    <div style="color: red;"
                                         class="d-flex justify-content-end">${fail}
                                    </div>
                                    <%}%>
                                </label>
                                <input class="input-signin" type="text" placeholder="Please enter your username..."
                                       name="username">
                                <div id="err-email" class="err-input"></div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="title-signin">
                                        Password
                                    </div>
                                    <div>
                                        <a class="link-signup" href="/food/view-forgot-password">Forgot password</a>
                                    </div>
                                </div>
                                <input class="input-signin mt-2 mb-0" type="password"
                                       placeholder="Please enter your password..." name="password">
                                <div id="err-password" class="err-input"></div>
                                <!-- <div class="d-flex justify-content-end">
                                  <a class="forgot-password" href="#resetnumber">Forgot password ?</a>
                                </div> -->

                                <div class="text-center mt-3">
                                    <button class="btn btn-signin" type="submit">Login <i
                                            class="fa-solid fa-arrow-right-to-bracket ms-1"></i></button>
                                </div>
                                <div class="title-signin row m-0 p-0 mt-3 mb-3 ">
                                    <div class="col-1 m-0 p-0">or</div>
                                    <span class="dash col-11 m-0 p-0 border-bottom"></span>
                                </div>
                            </form>


                        </div>
                    </div>

                    <div class="d-flex align-items-center justify-content-center">
                        <div class="signin-with mx-2">
                            Sign in with
                        </div>
                        <div class="d-inline-flex">
                            <button class="btn-facebook me-2"><i class="fa-brands fa-facebook-f mx-2"></i>Facebook
                            </button>
                            <button class="btn-google"><i class="fa-brands fa-google mx-2"></i>Google</button>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center mt-3">
                        Create Account? <a class="link-signup" href="/food/view-register">Register</a>
                    </div>


                </div>
                <div class="border-content-down-signin text-center px-5 d-flex align-items-center">
                    © 2023 The sales website is owned by Developer TungTT. Operated by TungTT. All rights reserved
                </div>
            </div>
        </div>

    </div>
</div>
<%@include file="../layout/footer.jsp" %>
</body>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>

</html>