<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${detail.product_name} - FU MOTORRAD</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .navbar {
            background-color: #1c1c1c;
            padding: 15px 0;
        }
        .navbar-brand {
            color: #ffffff;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 2px;
        }
        .nav-link {
            color: #ffffff;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        .nav-link:hover {
            color: #007bff;
        }
        .product-image-container {
            height: 70vh;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }
        .product-image {
            max-width: 80%;
            max-height: 100%;
            object-fit: contain;
        }
        .product-details {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }
        .product-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .product-price {
            font-size: 24px;
            font-weight: 700;
            color: #007bff;
            margin-bottom: 20px;
        }
        .product-description {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        .btn-add-to-cart {
            background-color: #007bff;
            color: #ffffff;
            font-weight: 500;
            padding: 12px 24px;
            border-radius: 25px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-add-to-cart:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .category-box, .last-product {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .category-box .card-header, .last-product .card-header {
            background-color: #007bff;
            color: #ffffff;
            font-weight: 700;
            border-radius: 8px 8px 0 0;
        }
        .category_block li {
            transition: background-color 0.3s ease;
        }
        .category_block li:hover {
            background-color: #f1f3f5;
        }
        .category_block li.active {
            background-color: #007bff;
        }
        .category_block li.active a {
            color: #ffffff;
        }
        .last-product-img {
            border-radius: 8px;
            margin-bottom: 15px;
            height: 150px;
            object-fit: cover;
        }
        .last-product .card-text {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
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
        .quantity-text {
            font-weight: 500;
            margin-bottom: 10px;
        }
        
    </style>
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>

    <div class="container-fluid mt-5">
        <div class="row justify-content-center">
            <div class="col-10 product-image-container">
                <img src="${detail.image}" alt="${detail.product_name}" class="product-image">
            </div>
        </div>
    </div>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-3">
                <div class="category-box">
                    <div class="card-header">Categories</div>
                    <ul class="list-group category_block">
                        <c:forEach items="${listC}" var="o">
                            <li class="list-group-item ${tag == o.cate_id ? 'active' : ''}">
                                <a href="CategoryURL?cid=${o.cate_id}" class="${tag == o.cate_id ? 'text-white' : 'text-dark'}">${o.cate_name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="last-product">
                    <div class="card-header">Newest Product</div>
                    <div class="card-body">
                        <img class="img-fluid last-product-img" src="${p.image}" alt="${p.product_name}" />
                        <h5 class="card-title">
                            <a href="detailURL?pid=${p.product_id}" class="text-dark">${p.product_name}</a>
                        </h5>
                        <p class="card-text">${p.description}</p>
                        <p class="font-weight-bold">$${p.price}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="product-details">
                    <h1 class="product-title">${detail.product_name}</h1>
                    <p class="product-price">$${detail.price}</p>
                    <p class="product-description">${detail.description}</p>
                    <form action="addToCartURL" method="get">
                        <input type="hidden" name="pid" value="${detail.product_id}">
                        <div class="form-group">
                            <p class="quantity-text">Quantity: ${detail.quantity > 0 ? detail.quantity : 'Out of stock'}</p>
                            <c:choose>
                                <c:when test="${detail.quantity > 0}">
                                    <button type="submit" class="btn btn-add-to-cart">
                                        <i class="fas fa-shopping-cart mr-2"></i> Add to cart
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" class="btn btn-secondary" disabled>
                                        Sold out
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </form>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>