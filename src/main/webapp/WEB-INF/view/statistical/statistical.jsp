<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="productName" value=""/>
<c:forEach items="${listTop10}" var="element" varStatus="status">
    <c:set var="productName" value="${productName}${element.productName}"/>
    <c:if test="${!status.last}">
        <c:set var="productName" value="${productName}, "/>
    </c:if>
</c:forEach>
<c:set var="quantityBuy" value=""/>
<c:forEach items="${listTop10}" var="element" varStatus="status">
    <c:set var="quantityBuy" value="${quantityBuy}${element.quantityBuy}"/>
    <c:if test="${!status.last}">
        <c:set var="quantityBuy" value="${quantityBuy}, "/>
    </c:if>
</c:forEach>
<%--<c:set var="quantity" value=""/>--%>
<%--<c:forEach items="${product}" var="element" varStatus="status">--%>
<%--    <c:set var="quantity" value="${quantity}${element.quantity}"/>--%>
<%--    <c:if test="${!status.last}">--%>
<%--        <c:set var="quantity" value="${quantity}, "/>--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>

<c:set var="productName" value=""/>
<c:forEach items="${listTop10}" var="element" varStatus="status">
    <c:set var="temp" value="${element.productName.split(',')}"/>
    <c:forEach items="${temp}" var="item">
        <c:set var="formattedItem" value="${item.trim()}"/>
        <c:set var="productName" value="${productName}'${formattedItem}'"/>
        <c:if test="${!status.last}">
            <c:set var="productName" value="${productName}, "/>
        </c:if>
    </c:forEach>
</c:forEach>
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
            Statistical
        </div>
        <hr>

        <form id="form-statistical">
            <div class="pb-4 row">
                <div class="col-6 ">
                    <div class="border-filter-statistical">
                        <div class="fw-bold fs-5 text-center">
                            Filter products by date month year
                        </div>
                        <div class="px-5 mt-3">
                            <div class="mb-3">
                                <label class="form-label">Start Day</label>
                                <input type="date" class="form-control" name="startDate">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">To Date</label>
                                <input type="date" class="form-control" name="endDate">
                            </div>

                            <div class="d-flex justify-content-center">
                                <button type="button" onclick="clickFilter()"
                                        class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                        style="width: 150px;"><i class="fa-solid fa-filter fs-4"></i></button>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-6">
                    <div class="border-filter-statistical">
                        <div class="fw-bold fs-5 text-center">
                            Top 10
                        </div>
                        <div class="px-5 mt-3">

                            <div class="mb-3 row">
                                <label class="col-sm-4 col-form-label">Best selling food</label>
                                <div class="col-sm-8">
                                    <button type="button" onclick="clickSelectTop10()"
                                            class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                            style="width: 150px;"><i class="fa-solid fa-display fs-4"></i></button>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label class="col-sm-4 col-form-label">Longest stored food</label>
                                <div class="col-sm-8">
                                    <button type="button" onclick="clickLongestTop10()"
                                            class="btn btn-outline-info align-items-center d-flex justify-content-center"
                                            style="width: 150px;"><i class="fa-solid fa-warehouse fs-4"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </form>

        <div class="mt-3">
            <div class="fs-3 text-center">${title}</div>
            <table class="table table-hover">
                <tr class="bg-info">
                    <th>Food Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Origin</th>
                    <th>Manufacture Date</th>
                    <th>Images</th>
                    <th>Quantity Buy</th>
                </tr>
                <c:forEach items="${listTop10}" var="l">
                    <tr>
                        <td>${l.productName}</td>
                        <td>${l.quantity}</td>
                        <td>${l.price}</td>
                        <td>${l.origin}</td>
                        <td>${l.manufactureDate}</td>
                        <td>
                            <img src="http://localhost:27337/food/images/${l.image}" width="70px">
                        </td>
                        <td>${l.quantityBuy}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="fw-bold text-center fs-4">Statistical chart from ${startDate} to ${endDate}</div>

        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/series-label.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <script src="https://code.highcharts.com/modules/accessibility.js"></script>

        <figure class="highcharts-figure">
            <div id="container"></div>

        </figure>


        <script>
            // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
            Highcharts.chart('container', {
                chart: {
                    type: 'spline'
                },
                title: {
                    text: ''
                },
                // subtitle: {
                //     text: 'Source: ' +
                //         '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                //         'target="_blank">Wikipedia.com</a>'
                // },
                xAxis: {
                    categories: [${productName}],
                    accessibility: {
                        description: 'Months of the year'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Quantity Buy'
                    },
                    labels: {
                        format: '{value}'
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series: [{
                    name: 'quantity buy',
                    marker: {
                        symbol: 'square'
                    },
                    data: [${quantityBuy}]

                }]
            });

        </script>
    </div>
    <div class="w-5"></div>

</div>
<%@include file="../layout/footer.jsp" %>
<script>
    function clickSelectTop10() {
        document.getElementById('form-statistical').action = '/food/best-selling'
        document.getElementById('form-statistical').method = 'get'
        document.getElementById('form-statistical').submit()
    }

    function clickLongestTop10() {
        document.getElementById('form-statistical').action = '/food/longest-stored'
        document.getElementById('form-statistical').method = 'get'
        document.getElementById('form-statistical').submit()
    }


</script>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>
</html>