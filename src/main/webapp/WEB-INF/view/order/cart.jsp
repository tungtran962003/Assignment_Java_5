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
<div class="d-flex">
    <div class="w-5"></div>
    <div class="w-100">
        <form action="" enctype="multipart/form-data">

        </form>
        <div class="fw-bold fs-1 text-center mb-3">
            Shopping Cart
        </div>

        <div>
            <table class="table table-hover">
                <tr class="bg-info">
                    <th>#</th>
                    <th>Food Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Origin</th>
                    <th>Manufacture Date</th>
                    <th>Images</th>
                    <th>Quantity in cart</th>
                    <th>Remove</th>
                </tr>
                <c:forEach items="${cart}" var="c" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${c.productName}</td>
                        <td>${c.quantity}</td>
                        <td>${c.price}</td>
                        <td>${c.origin}</td>
                        <td>${c.manufactureDate}</td>
                        <td>
                            <img width="70px" src="http://localhost:27337/food/images/${c.image}">
                        </td>
                        <td>
                            <a href="/food/delete-cart/${c.id}" class="text-decoration-none">
                                <button class="btn-add-quantity">
                                    <i class="fa-solid fa-minus"></i>
                                </button>
                            </a>
<%--                            <input class=" input-quantityBuy" type="text" >--%>
                                ${c.quantityInCart}
                            <a href="/food/add-cart/${c.id}" class="text-decoration-none">
                                <button class="btn-add-quantity">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </a>
                        </td>

                        <td class="">
                            <a onclick="return clickDelete()" class="ms-4" href="/food/delete-line-cart/${c.id}"><i
                                    class="fa-solid fa-trash detailDelete"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div>
            <div class="">
                <div class="fs-4 text-center fw-bold">
                    CART SUMMARY
                </div>
                <div>
                    <hr>
                </div>
            </div>
            <div class="border p-4">
                <div class="mb-3 fw-bold fs-5">
                    Total money: ${totalMoney}
                </div>
                <div>
                   <c:if test="${role != null && totalMoney != 0}">
                       <div class="d-flex justify-content-center">
                           <a class="text-decoration-none" href="/food/view-checkout">
                               <button type="button"
                                       class="btn btn-outline-info align-items-center d-flex justify-content-center fw-bold fs-5"
                                       style="width: 300px; height: 50px;">Process To Checkout
                               </button>
                           </a>
                       </div>
                   </c:if>
<%--                    <c:if test="${totalMoney != 0}}">--%>
<%--                        <div class="d-flex justify-content-center">--%>
<%--                            <a class="text-decoration-none" href="/food/view-checkout">--%>
<%--                                <button type="button"--%>
<%--                                        class="btn btn-outline-info align-items-center d-flex justify-content-center fw-bold fs-5"--%>
<%--                                        style="width: 300px; height: 50px;">Process To Checkout--%>
<%--                                </button>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </c:if>--%>

<%--                    <% } %>--%>
<%--                    <% if (role == null) { %>--%>
<%--                        <div></div>--%>
<%--                    <% } %>--%>
                </div>
            </div>

        </div>
    </div>
    <div class="w-5"></div>
</div>
<%@include file="../layout/footer.jsp" %>
<script>
    function clickDelete() {
        var deleted = confirm("Do you want to delete data?")
        if (deleted) {
            alert("Delete data successfully")
            return true
        } else {
            return false
        }
    }

</script>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>

</html>
