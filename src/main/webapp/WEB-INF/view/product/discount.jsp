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
<div class="d-flex w-100 mt-3">
    <div class="w-5"></div>
    <div class="w-100">
        <div class="fw-bold fs-1 text-center mb-3">
            Discount
        </div>
        <hr>

        <form id="form-discount">
            <div class="">
                <div class="d-flex justify-content-center">
                    <div class="w-50 d-flex justify-content-center">
                        <div class="border-1-form">
                            <div class="mb-3">
                                <div>
                                    <label class="form-label fw-bold">Name</label>
                                </div>
                                <input type="text" class="form-control" id="" name="name"/>
                            </div>
                            <div class="mb-3">
                                <div>
                                    <label class="form-label fw-bold">Start date</label>
                                </div>
                                <input type="date" class="form-control" name="startDate"/>
                            </div>
                            <div class="mb-3">
                                <div>
                                    <label class="form-label fw-bold">To date</label>
                                </div>
                                <input type="date" class="form-control" name="endDate"/>
                            </div>
                            <div class="mb-3">
                                <div>
                                    <label class="form-label fw-bold">Money reduced</label>
                                </div>
                                <input type="text" class="form-control" name="value"/>
                            </div>
                            <div class="mb-3">
                                <div>
                                    <label class="form-label fw-bold">Description</label>
                                </div>
                                <input type="text" class="form-control" name="description"/>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="d-flex justify-content-center">
                    <button onclick="clickAdd()" type="button"
                            class="btn btn-outline-info align-items-center d-flex justify-content-center"
                            style="width: 150px;"><i class="fa-solid fa-tag fs-4"></i></button>
                </div>
            </div>
        </form>

        <div class="mt-3">
            <table class="table table-hover">
                <tr class="bg-info">
                    <th>#</th>
                    <th>Name</th>
                    <th>Start date</th>
                    <th>To date</th>
                    <th>Money reduced</th>
                    <th>Description</th>
                    <th>Funtion</th>
                </tr>

                <c:forEach items="${pageDiscount.getContent()}" var="discount" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${discount.name}</td>
                        <td>${discount.startDate}</td>
                        <td>${discount.endDate}</td>
                        <td>${discount.value}</td>
                        <td>${discount.description}</td>
                        <td class="">
                            <a onclick="return clickDelete()" class="ms-4"
                               href="/food/delete-discount/${discount.id}"><i
                                    class="fa-solid fa-trash detailDelete"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="d-flex justify-content-center mb-4 mt-5">
                <div>
                    <%--                    <c:if test="${pageProduct.getNumber() + 1 > 1}">--%>
                    <%--                        <a class="text-decoration-none btn btn-outline-info"--%>
                    <%--                           href="?page=${0}&productNameSearch=${param.productNameSearch}">--%>
                    <%--                            <i class="fa-solid fa-backward-fast"></i>--%>
                    <%--                        </a>--%>
                    <%--                    </c:if>--%>

                    <c:if test="${pageDiscount.getNumber() + 1 > 1}">
                        <a class="text-decoration-none btn btn-outline-info"
                           href="?page=${pageDiscount.getNumber()}">
                            <i class="fa-solid fa-left-long"></i>
                        </a>
                    </c:if>

                    <span class="btn">${pageDiscount.getNumber() + 1} / ${pageDiscount.getTotalPages()} </span>

                    <c:if test="${pageDiscount.getNumber() + 1 lt pageDiscount.getTotalPages()}">
                        <a class="text-decoration-none btn btn-outline-info"
                           href="?page=${pageDiscount.getNumber() + 2}">
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
    <div class="w-5"></div>
</div>
<%@include file="../layout/footer.jsp" %>
<script>
    function clickAdd() {
        var add = confirm("Do you want add data?")
        if (add) {
            document.getElementById('form-discount').action = '/food/add-discount'
            document.getElementById('form-discount').method = 'post'
            document.getElementById('form-discount').submit()
            alert("Add data successfully")
        } else {
            return null
        }
    }

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