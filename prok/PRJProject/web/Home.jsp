<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FU MOTORRAD</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        .truncate-text {
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .product-title {
            margin-bottom: 10px;
            border-bottom: 1px solid #000;
            padding-bottom: 5px;
        }
        .card-img-top {
            transition: transform 0.3s ease;
            width: 100%;
            height: 200px; /* Fixed height for regular product images */
            object-fit: cover;
        }
        .card-img-top:hover {
            transform: scale(1.1);
        }
        .card-img {
            width: 100%;
            height: 220px; /* Reduced height for newest product image */
            object-fit: cover;
        }
        .category_block li a {
            color: #000000 !important;
            font-weight: bold;
            padding: 10px 15px;
            margin-bottom: 5px;
        }
        .breadcrumb-item a {
            color: #000000;
            font-weight: bold;
            text-decoration: none;
        }
        .breadcrumb-item.active {
            color: #000000;
            font-weight: bold;
        }
        .card-header {
            background-color: transparent;
            color: #000000;
            font-weight: bold;
            border-bottom: 1px solid #000;
            padding-bottom: 10px;
        }
        .btn-black {
            color: #000000;
            font-weight: bold;
            border: none;
            background-color: transparent;
        }
        .btn-danger {
            color: #000000;
            font-weight: bold;
            border: none;
            background-color: transparent;
        }
        .btn-danger:hover {
            color: #ffffff;
            background-color: #dc3545;
            border-color: #dc3545;
        }
        footer {
            background-color: #1c1c1c;
            color: #ffffff;
            padding: 50px 0;
        }
        footer h5 {
            color: #ffffff;
            font-weight: 700;
        }
        footer hr {
            background-color: #ffffff;
        }
        footer a {
            color: #007bff;
            transition: color 0.3s ease;
        }
        footer a:hover {
            color: #0056b3;
            text-decoration: none;
        }
    </style>
</head>
<body>

<jsp:include page="Menu.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="HomeURL" class="breadcrumb-link">Home</a></li>
                </ol>
            </nav>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header text-uppercase"><i class="fa fa-list"></i> Categories</div>
                <ul class="list-group category_block">
                    <c:forEach items="${listC}" var="o">
                        <li class="list-group-item"><a href="CategoryURL?cid=${o.cate_id}">${o.cate_name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <div class="col-sm-9">
            <!-- Newest Product Section -->
            <div class="row mb-4">
                <div class="col-12">
                    <h2 class="product-title">Newest Product</h2>
                    <c:set var="newestProduct" value="${listP[0]}"/>
                    <c:forEach items="${listP}" var="product">
                        <c:if test="${product.product_id > newestProduct.product_id}">
                            <c:set var="newestProduct" value="${product}"/>
                        </c:if>
                    </c:forEach>
                    <div class="card">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img class="card-img" src="${newestProduct.image}" alt="Newest Product Image">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="detailURL?pid=${newestProduct.product_id}" title="View Product">${newestProduct.product_name}</a>
                                    </h4>
                                    <p class="card-text truncate-text">${newestProduct.description}</p>
                                    <div class="row">
                                        <div class="col-6">
                                            <p class="btn-black">${newestProduct.price} $</p>
                                        </div>
                                        <div class="col-6">
                                            <c:choose>
                                                <c:when test="${newestProduct.quantity > 0}">
                                                    <a href="addToCartURL?pid=${newestProduct.product_id}" class="btn btn-danger btn-sm">Add to cart</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" class="btn btn-danger btn-sm" disabled>Sold Out</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product Listing Section -->
            <div class="row">
                <c:forEach items="${listP}" var="o">
                    <c:if test="${o.quantity > 0}">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card">
                                <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title product-title"><a href="detailURL?pid=${o.product_id}"
                                                                             title="View Product">${o.product_name}</a></h4>
                                    <p class="card-text truncate-text">${o.description}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn-black btn-block">${o.price} $</p>
                                        </div>
                                        <div class="col">
                                            <a href="addToCartURL?pid=${o.product_id}"
                                               class="btn btn-danger btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <!-- Sold Out Products -->
                <c:forEach items="${listP}" var="o">
                    <c:if test="${o.quantity <= 0}">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card">
                                <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title product-title"><a href="detailURL?pid=${o.product_id}"
                                                                             title="View Product">${o.product_name}</a></h4>
                                    <p class="card-text truncate-text">${o.description}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn-black btn-block">${o.price} $</p>
                                        </div>
                                        <div class="col">
                                            <button type="button" class="btn btn-danger btn-block" disabled>Sold Out</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<footer class="mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h5>About</h5>
                <hr>
                <p>Xe ở cửa hàng của chúng tôi đều được nhập hải quan có giấy tờ và chứng từ đầy đủ. Nếu có khúc mắc, xin liên hệ qua thư hoặc số điện thoại trên website.</p>
            </div>
            <div class="col-md-4">
                <h5>Contact</h5>
                <hr>
                <ul class="list-unstyled">
                    <li><i class="fa fa-home mr-2"></i> My company</li>
                    <li><i class="fa fa-envelope mr-2"></i> andthe180695@fpt.edu.vn</li>
                    <li><i class="fa fa-phone mr-2"></i> + 0967851513</li>
                    <li><i class="fa fa-print mr-2"></i> + 0123456789</li>
                </ul>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <p class="text-center">
                    <a href="#">Back to top</a>
                </p>
            </div>
        </div>
    </div>
</footer>

</body>
</html>