<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%--%>
<%--    HttpSession httpSession = request.getSession();--%>
<%--    String username = (String) httpSession.getAttribute("username");--%>
<%--    String role = (String) httpSession.getAttribute("role");--%>
<%--%>--%>
<header class="">
    <div class="d-flex m-auto bg-body-secondary d-flex justify-content-center">
        <div class="w-header d-flex justify-content-between">
            <c:if test="${role == 'admin'}">
                <div class="d-flex">
                    <div>
                        <a class="link-header" href="/food/listFood"><i class="fa-solid fa-utensils"></i> Food</a>
                    </div>
<%--                    <div>--%>
<%--                        <a class="link-header" href="/food/cart"> Cart</a>--%>
<%--                    </div>--%>
                    <div>
                        <a class="link-header" href="/food/view-statistical"><i class="fa-solid fa-chart-simple"></i>
                            Statistical
                        </a>
                    </div>
                    <div>
                        <a class="link-header" href="/food/view-update-info/${id}"><i class="fa-solid fa-user"></i>
                            Info
                        </a>
                    </div>
                    <div>
                        <a class="link-header" href="/food/view-register"><i class="fa-solid fa-registered"></i>
                            Register
                        </a>
                    </div>
                    <div>
                        <a class="link-header" href="/food/view-discount"><i class="fa-solid fa-tag"></i>
                            Discount
                        </a>
                    </div>

                </div>

                <div>
                    <a class="link-header" href="/food/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                </div>
            </c:if>

<%--            <c:if test="${role == 'staff'}">--%>
<%--                <div>--%>
<%--                    <a class="link-header" href="/food/view-login"><i class="fa-solid fa-right-to-bracket"></i> Login</a>--%>
<%--                </div>--%>

<%--                <div>--%>
<%--                    <a class="link-header" href="/food/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>--%>
<%--                </div>--%>
<%--            </c:if>--%>

            <c:if test="${role == 'customer'}">
                <div>
                    <a class="link-header" href="/food/view-update-info/${id}"><i class="fa-solid fa-user"></i> Info</a>
                </div>
                <div>
                    <a class="link-header" href="/food/view-register"><i class="fa-solid fa-registered"></i>
                        Register
                    </a>
                </div>

                <div>
                    <a class="link-header" href="/food/logout"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
                </div>
            </c:if>

            <c:if test="${role == null}">
                <div class="d-flex justify-content-between">
<%--                    <div>--%>
<%--                        <a class="link-header" href="/food/view-register"><i class="fa-solid fa-registered"></i> Register</a>--%>
<%--                    </div>--%>
                    <div>
                        <a class="link-header" href="/food/view-login"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                    </div>
                </div>

            </c:if>

        </div>
    </div>

    <div class="container mt-3 mb-3 d-flex align-items-center justify-content-between">
        <div class="border-name-java">
            <a href="#" class="name-left text-info bg-dark">
                Flavor
            </a>
            <a href="#" class="name-right text-dark bg-info">
                Fusion
            </a>
        </div>

        <div class="text-header-center fs-3">
            Savor every bite and enjoy your time with us!
        </div>

        <div>
            <div class="d-flex justify-content-end">
                Customer Service
            </div>
            <div class="fs-5 fw-bolder">
                +84943670235
            </div>
        </div>
    </div>

    <div class="border-header bg-dark">
        <div class="border-option-header">
            <div class="d-flex justify-content-center">
                <a class="header-home" href="/food/home">
                    <button class="border-header-home bg-info">
<%--                        <a class="" >--%>
                            <span><i class="fa-solid fa-house-chimney fs-5 me-2" style="color: #000000;"></i></span>
                            <span class="fw-bold">Home</span>
<%--                        </a>--%>
                    </button>
                </a>

                <div class="d-flex align-items-center ms-4">
<%--                    <div>--%>
<%--                        <a class="text-header-option" href="/food/listFood">--%>
<%--                            <i class="fa-solid fa-utensils"></i> Food--%>
<%--                        </a>--%>
<%--                    </div>--%>
                    <div>
                        <a class="text-header-option" href="/food/cart">
                            <i class="fa-solid fa-cart-shopping"></i> Cart
                        </a>
                    </div>
<%--                    <div>--%>
<%--                        <a class="text-header-option" href="/food/view-statistical">--%>
<%--                            Statistical--%>
<%--                        </a>--%>
<%--                    </div>--%>

                    <div>
                        <a class="text-header-option" href="/food/bills">
                            <i class="fa-solid fa-file-invoice-dollar"></i> Order
                        </a>
                    </div>
<%--                    <div>--%>
<%--                        <a class="text-header-option" href="/chi-tiet-sp/show"></a>--%>
<%--                    </div>--%>
                </div>
            </div>

<%--            <div class="border-icon-header bg-dark">--%>
<%--                <div class="d-flex ms-2 me-2">--%>
<%--                    <button class="border-0 bg-dark" style="padding-left: 1px; padding-right: 1px;">--%>
<%--                        <i class="fa-solid fa-heart fw-3 text-info" style="color: #000000;"></i>--%>
<%--                    </button>--%>
<%--                    <div class="border-number-icon">--%>
<%--                        0--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="d-flex ms-2 me-2">--%>
<%--                    <button class="border-0 bg-dark" style="padding-left: 1px; padding-right: 1px;">--%>
<%--                        <i class="fa-solid fa-cart-shopping fw-3 text-info" style="color: #000000;"></i>--%>
<%--                    </button>--%>
<%--                    <div class="border-number-icon">--%>
<%--                        0--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>

</header>
