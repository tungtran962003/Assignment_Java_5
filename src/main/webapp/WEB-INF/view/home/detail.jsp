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

<body class="">
<%@include file="../layout/header.jsp" %>
<div class=" bg-light" style="height: 30px;"></div>
<div class="w-100 d-flex bg-light">
    <div class="w-5"></div>
    <div class="w-100 pb-5 bg-white">
        <form id="formAddCart">
            <div class="p-4">
                <div class="row px-xl-1">
                    <div class="col-5 text-center ">
                        <img src="http://localhost:27337/food/images/${productDetail.image}">
                    </div>
                    <div class="col-7 border p-5">
                        <div class="fs-2 fw-bold">
                            ${productDetail.productName}
                        </div>
                        <div class="mt-2">
                            <span class="fw-bold fs-5">Vote: </span>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                        </div>
                        <div class="mt-3 fw-bold fs-5">
                            Price: ${productDetail.price}
                        </div>
                        <div class="mt-3 fw-bold fs-5">
                            Quantity: ${productDetail.quantity}
                        </div>
                        <div class="mt-3 fw-bold fs-5">
                            Origin: ${productDetail.origin}
                        </div>
                        <div class="mt-3 fw-bold fs-5">
                            Manufacture date: ${manufactureDate}
                        </div>
                        <div class="mt-3 fw-bold fs-5">
                            Quantity Buy: ${productDetail.quantityBuy}
                        </div>
                        <div class="d-flex mt-3">
                            <%--                            <a class="text-decoration-none" href="/food/add-cart/${product.productId}">--%>
                            <button type="button" onclick="clickAddToCart('${productDetail.productId}')"
                                    class="btn-add-to-cart">
                                <i class="fa-solid fa-cart-shopping me-2"></i> Add to Cart
                            </button>
                            <%--                            </a>--%>
                        </div>
                        <div class="d-flex fs-5 fw-bold mt-3 align-items-center">
                            <div class="me-3">
                                Share on:
                            </div>
                            <div>
                                <i class="fa-brands fa-square-facebook fs-3 me-3" style="color: #2a70ea;"></i>
                            </div>
                            <div>
                                <i class="fa-brands fa-instagram fs-3 me-3" style="color: #f9311a;"></i>
                            </div>
                            <div>
                                <i class="fa-brands fa-twitter fs-3 me-3" style="color: #357df8;"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="bg-light" style="height: 30px;"></div>


        <div class="row px-xl-1">
            <div class="">
                <div class="bg-white p-5">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active text-dark" id="description-tab" data-bs-toggle="tab"
                                    data-bs-target="#home"
                                    type="button" role="tab" aria-controls="home" aria-selected="true">Description
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link text-dark" id="information-tab" data-bs-toggle="tab"
                                    data-bs-target="#profile"
                                    type="button" role="tab" aria-controls="profile" aria-selected="false">Profile
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link text-dark" id="review-tab" data-bs-toggle="tab"
                                    data-bs-target="#contact"
                                    type="button" role="tab" aria-controls="contact" aria-selected="false">Contact
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel"
                             aria-labelledby="description-tab">
                            <h4 class="mb-3">Product Description</h4>
                            <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam
                                invidunt duo
                                dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur
                                invidunt sed sed
                                et,
                                lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed
                                tempor kasd eirmod.
                                Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo
                                est, sit sanctus
                                diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit
                                rebum, diam
                                kasd
                                invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                            <p>Dolore magna est eirmod sanctus dolor, amet diam et eirmod et ipsum. Amet dolore tempor
                                consetetur sed
                                lorem dolor sit lorem tempor. Gubergren amet amet labore sadipscing clita clita diam
                                clita. Sea amet et
                                sed ipsum lorem elitr et, amet et labore voluptua sit rebum. Ea erat sed et diam
                                takimata sed justo.
                                Magna
                                takimata justo et amet magna et.</p>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="information-tab">
                            <h4 class="mb-3">Additional Information</h4>
                            <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam
                                invidunt duo
                                dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur
                                invidunt sed sed
                                et,
                                lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed
                                tempor kasd eirmod.
                                Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo
                                est, sit sanctus
                                diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit
                                rebum, diam
                                kasd
                                invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="review-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">1 review for "Product Name"</h4>
                                    <div class="media mb-4">
                                        <img src="../../assets/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
                                             style="width: 45px;">
                                        <div class="media-body">
                                            <h6>John Doe<small> - <i>01 Jan 2045</i></small></h6>
                                            <div class="text-primary mb-2">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                            <p>Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam
                                                ipsum et no at. Kasd diam
                                                tempor rebum magna dolores sed sed eirmod ipsum.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4 class="mb-4">Leave a review</h4>
                                    <small>Your email address will not be published. Required fields are marked
                                        *</small>
                                    <div class="d-flex my-3">
                                        <p class="mb-0 mr-2">Your Rating * :</p>
                                        <div class="text-primary">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                    </div>
                                    <form>
                                        <div class="form-group">
                                            <label for="message">Your Review *</label>
                                            <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Your Name *</label>
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Your Email *</label>
                                            <input type="email" class="form-control" id="email">
                                        </div>
                                        <div class="form-group mb-0">
                                            <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-5"></div>
</div>
<%@include file="../layout/footer.jsp" %>
<!-- Shop Detail End -->
<script>
    function clickAddToCart(id) {
        var addToCart = confirm("Do you want to add food to your cart?")
        if (addToCart) {
            document.getElementById('formAddCart').action = '/food/add-cart1/' + id
            document.getElementById('formAddCart').method = 'post'
            document.getElementById('formAddCart').submit()
            alert("Add food to cart successfully")
        } else {
            return null
        }
    }
</script>
<script src="https://kit.fontawesome.com/6189a5b91e.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>

</html>