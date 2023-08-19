<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link rel="stylesheet" href="../../../css/index.css">
</head>
<body>
<%@include file="../layout/header.jsp" %>
<div class="container mt-5">

    <form id="myForm" enctype="multipart/form-data">
        <div>
            <div class=" justify-content-center w-100">
                <div class="w-100 d-flex justify-content-center">
                    <div class="w-50 d-flex">
                        <div class="w-75 d-flex">
                            <div class="w-50 d-flex">
                                <div class="d-flex align-items-end fw-bold">
                                    Price Min
                                </div>
                                <div>
                                    <select class="form-select" aria-label="Default select example" name="priceMin"
                                            id="priceMin">
                                        <c:forEach begin="0" end="30000" step="100" var="i">
                                            <option value="${i}"><c:out value="${i}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="w-50 d-flex">
                                <div class="d-flex align-items-end fw-bold">
                                    Price Max
                                </div>
                                <div>
                                    <select class="form-select" aria-label="Default select example" name="priceMax"
                                            id="priceMax">
                                        <c:forEach begin="0" end="30000" step="100" var="i">
                                            <option value="${i}"><c:out value="${i}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="w-100 d-flex justify-content-center">
                    <div class="mb-5 d-flex w-50">
                        <div class="col d-flex">
                            <div class="d-flex justify-content-center col-10">
                                <input type="text" class="form-control" placeholder="search food name..."
                                       name="productNameSearch"
                                       value="${param.productNameSearch}">
                            </div>
                            <div class="col-2 d-flex justify-content-end">
                                <button type="button" onclick="checkMinMax()"
                                        class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                        style="width: 100px;"><i class="fa-solid fa-magnifying-glass fs-4"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="text-center mb-5">List Food</h2>
        <div class="">
            <div class="d-flex justify-content-center">
                <div class="w-50 d-flex justify-content-center">
                    <div class="border-1-form">
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-bold">Food Name</label>
                                <div style="color: red"></div>
                            </div>
                            <input type="text" class="form-control" id="name" name="productName"
                                   value="${productDetail.productName}"/>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-bold">Quantity</label>
                                <div style="color: red"></div>
                            </div>
                            <input type="text" class="form-control" id="quantity" name="quantity"
                                   value="${productDetail.quantity}"/>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-bold">Price</label>
                                <div style="color: red"></div>
                            </div>
                            <input type="text" class="form-control" id="price" name="price"
                                   value="${productDetail.price}"/>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-bold">Origin</label>
                                <div style="color: red"></div>
                            </div>
                            <select class="form-select" aria-label="Default select example" name="origin">
                                <option value="VietNam" ${productDetail.origin=='VietNam' ? 'selected' : ''}>VietNam
                                </option>
                                <option value="China" ${productDetail.origin=='China' ? 'selected' : ''}>China</option>
                                <option value="Korea" ${productDetail.origin=='Korea' ? 'selected' : ''}>Korea</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-bold">ManufactureDate</label>
                                <div style="color: red"></div>
                            </div>
                            <input type="date" class="form-control" id="manufactureDate" name="manufactureDate"
                                   value="${manufactureDate}"/>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-bold">Image</label>
                                <div style="color: red"></div>
                            </div>
                            <input onchange="changeImage(this.value)" type="file" class="form-control" id="image" name="file"
                                   value="${productDetail.image}" style="display: none" />
                            <input id="image-text-name-input" name="fileName" style="display: none" value="${productDetail.image == null ? '' : productDetail.image}">

<%--                            <input type="file" name="uploadfile" id="img" style="display:none;"/>--%>
                            <label class="btn btn-light" for="image">Browse Image</label>
                            <label id="image-text-name">${productDetail.image == null ? 'No file chosen' : productDetail.image}</label>
                        </div>

                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <div class="d-flex justify-content-between w-50">
                    <div class="d-flex justify-content-center">
                        <button type="button" onclick="clickAdd()"
                                class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                style="width: 150px;"><i class="fa-solid fa-square-plus fs-4"></i></button>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="button" onclick="clickUpdate('${productDetail.productId}')"
                                class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                style="width: 150px;"><i class="fa-solid fa-pen-to-square fs-4"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <c:if test="${pageSearch.isEmpty()}">
        <h2 class="text-center">Not found any record!!</h2>
    </c:if>
    <c:if test="${not pageSearch.isEmpty()}">
        <h2 class="text-center">Found ${pageProduct.getTotalElements()} records</h2>
        <div class="mt-5 mb-5">
            <table class="table table-hover">
                <tr class="bg-info">
                    <th>#</th>
                    <th>Food Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Origin</th>
                    <th>Manufacture Date</th>
                    <th>Images</th>
                    <th>Quantity Buy</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${pageProduct.getContent()}" var="product" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${product.productName}</td>
                        <td>${product.quantity}</td>
                        <td>${product.price}</td>
                        <td>${product.origin}</td>
                        <td>${product.manufactureDate}</td>
                        <td>
                            <img src="http://localhost:27337/food/images/${product.image}" width="70px">
                        </td>
                        <td>${product.quantityBuy}</td>
                        <td class="">
                            <a class="" href="/food/detailFood/${product.productId}"><i
                                    class="fa-solid fa-eye detailDelete"></i></a>
                            <a onclick="return clickDelete()" class="ms-4" href="/food/delete/${product.productId}"><i
                                    class="fa-solid fa-trash detailDelete"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="d-flex justify-content-center mb-4 mt-5">
                <div>
                    <c:if test="${pageProduct.getNumber() + 1 > 1}">
                        <a class="text-decoration-none btn btn-outline-info"
                           href="?page=${pageProduct.getNumber()}&productNameSearch=${param.productNameSearch}
                           &priceMax=${param.priceMax}&priceMin=${param.priceMin}">
                            <i class="fa-solid fa-left-long"></i>
                        </a>
                    </c:if>

                    <span class="btn">${pageProduct.getNumber() + 1} / ${pageProduct.getTotalPages()} </span>

                    <c:if test="${pageProduct.getNumber() + 1 lt pageProduct.getTotalPages()}">
                        <a class="text-decoration-none btn btn-outline-info"
                           href="?page=${pageProduct.getNumber() + 2}&productNameSearch=${param.productNameSearch}
                           &priceMax=${param.priceMax}&priceMin=${param.priceMin}">
                            <i class="fa-solid fa-right-long"></i>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </c:if>

</div>
<%@include file="../layout/footer.jsp" %>
<script>
    function changeImage(e) {
        document.getElementById('image-text-name').innerText = e.split("\\").pop()
        document.getElementById('image-text-name-input').value = ""
    }
    function clickAdd() {
        var add = confirm("Do you want add data?")
        if (add) {
            document.getElementById('myForm').action = '/food/addFood'
            document.getElementById('myForm').method = 'post'
            document.getElementById('myForm').submit()
            alert("Add data successfully")
        } else {
            return null
        }
    }

    function clickUpdate(id) {
        if (id.trim() === '') {
            return alert("Please select a row on the table")
        } else {
            var update = confirm("Do you want to update the data?")
            debugger
            if (update) {
                document.getElementById('myForm').action = '/food/updateFood/' + id
                document.getElementById('myForm').method = 'post'
                document.getElementById('myForm').submit()
                alert("Update data successfully")
            } else {
                return null
            }
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

    function clickSearch() {
        document.getElementById('myForm').action = '/food/search'
        document.getElementById('myForm').method = 'get'
        document.getElementById('myForm').submit()
    }

    function compareMinMax() {
        debugger
        let min = document.getElementById('priceMin').value
        let max = document.getElementById('priceMax').value
        if (Number(min) > Number(max)) {
            alert("price min must be less than price max")
            return false
        }
        return true
    }

    function checkMinMax() {
        if (!compareMinMax()) return
        clickSearch()
    }
</script>
</body>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
</html>
