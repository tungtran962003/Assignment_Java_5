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
<%
    HttpSession httpSession = request.getSession();
    String username = (String) httpSession.getAttribute("username");
    String role = (String) httpSession.getAttribute("role");
%>
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
            <form id="form-register">
                <div class="w-100">
                    <div class="border-form-signin">
                        <div class="border-right-signin">
                            <div>
                                <div class="header-signin">Register</div>
                            </div>

                            <label class="title-signin mb-2">
                                Your email
                            </label>
                            <input class="input-signin" type="text" placeholder="Please enter your email..."
                                   name="email" >
                            <div class="err-input"></div>

                            <label class="title-signin mb-2">
                                Full name
                            </label>
                            <input class="input-signin" type="text" placeholder="Please enter your full name..."
                                   name="name" >
                            <div class="err-input"></div>

                            <label class="title-signin mb-2">
                                Phone
                            </label>
                            <input class="input-signin" type="text" placeholder="Please enter your phone..." name="phone">
                            <div class="err-input"></div>

                            <label class="title-signin mb-2">
                                Address
                            </label>
                            <input class="input-signin" type="text" placeholder="Please enter your address..." name="address">
                            <div class="err-input"></div>
                            <c:if test="${role.equals('admin')}">
                                <label class="title-signin mb-2">
                                    Role
                                </label>
                                <select class="form-select" aria-label="Default select example" name="role">
                                    <option value="admin">Admin</option>
                                    <option value="customer">Customer</option>
                                </select>
                                <div id="err-email" class="err-input"></div>
                            </c:if>
                            <label class="title-signin mb-2">
                                Username
                            </label>
                            <input class="input-signin" type="text" placeholder="Please enter your username..." name="username">
                            <div id="" class="err-input"></div>

                            <div class="d-flex align-items-center justify-content-between">
                                <div class="title-signin">
                                    Password
                                </div>
                            </div>
                            <input class="input-signin mt-2 mb-0" type="password" name="password"
                                   placeholder="Please enter your password...">
                            <div id="err-password" class="err-input"></div>

                            <div class="d-flex align-items-center justify-content-between">
                                <div class="title-signin">
                                    Confirm password
                                </div>
                            </div>
                            <input class="input-signin mt-2 mb-0" type="password" name="confirmPassword"
                                   placeholder="Please enter your confirm password...">
                            <div id="err-re-password" class="err-input"></div>

                            <div class="note-password">
                                Strong password requirements: 8+ symbols, combination of uppercase and lowercase latin
                                letters, numbers, and special characters.
                            </div>

                            <div class="text-center mt-3">
                                <button type="button" class="btn btn-signin" onclick="clickRegister()">Register<i
                                        class="fa-solid fa-registered ms-1"></i></button>
                            </div>

                        </div>
                    </div>
                    <c:if test="${role.equals('')}">
                        <div class="d-flex justify-content-center mt-3">
                            Already have an account? <a class="link-signup" href="/food/view-login">Login</a>
                        </div>
                    </c:if>


                    <div class="border-content-down-signin text-center px-5">
                        © 2023 The sales website is owned by Developer TungTT. Operated by TungTT. All rights reserved
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>
<script>
    function clickRegister() {
        var add = confirm("Do you want register")
        if (add) {
            document.getElementById('form-register').action = '/food/add-register'
            document.getElementById('form-register').method = 'post'
            document.getElementById('form-register').submit()
            alert("Register successfully")
        } else {
            return null
        }
    }

    function checkPassword() {
        var password = document.getElementById('myForm').value
        if (password.isEmpty()) {

        }
    }
</script>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>

</body>
</html>