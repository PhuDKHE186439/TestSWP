<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - FU MOTORRAD</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 100px auto 0;
            padding: 0 20px;
        }
        .quantity-input {
            display: flex;
            align-items: center;
        }
        .btn-decrement, .btn-increment {
            background-color: #007bff;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-decrement:hover, .btn-increment:hover {
            background-color: #0056b3;
        }
        .btn-decrement:disabled, .btn-increment:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .readonly-input {
            pointer-events: none;
            cursor: default;
            text-align: center;
            width: 70px;
        }
        .table {
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .table thead th {
            border-top: none;
        }
        .btn-danger {
            transition: background-color 0.3s ease;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .rounded-pill {
            border-radius: 50rem!important;
        }
    </style>
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    
    <div class="container">
        <c:if test="${not empty quantityError}">
            <div class="alert alert-warning" role="alert">
                ${quantityError}
            </div>
        </c:if>
        
        <c:choose>
            <c:when test="${sessionScope.carts == null || sessionScope.carts.size() == 0}">
                <h1 class="text-center mt-5">Your Cart is Empty</h1>
            </c:when>
            <c:otherwise>
                <div class="shopping-cart">
                    <h2 class="mb-4">Shopping Cart</h2>
                    <div class="row">
                        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="p-2 px-3 text-uppercase">Product</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Price</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Quantity</div>
                                            </th>
                                            <th scope="col" class="border-0 bg-light">
                                                <div class="py-2 text-uppercase">Remove</div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${carts}" var="o">
                                            <tr>
                                                <form action="update-quantity" method="post">
                                                    <input type="hidden" name="productId" value="${o.value.product.product_id}"/>
                                                    <th scope="row" class="border-0">
                                                        <div class="p-2 d-flex align-items-center">
                                                            <img src="${o.value.product.image}" alt="" width="70" class="img-fluid rounded shadow-sm mr-3">
                                                            <div>
                                                                <h5 class="mb-0">
                                                                    <a href="#" class="text-dark">${o.value.product.product_name}</a>
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="border-0 align-middle"><strong>$${o.value.product.price * o.value.quantity}</strong></td>
                                                    <td class="border-0 align-middle">
                                                        <div class="quantity-input">
                                                            <button type="button" class="btn btn-decrement" onclick="changeQuantity(this, -1)">-</button>
                                                            <input type="number" name="quantity" 
                                                                   value="${o.value.quantity}"
                                                                   min="1" 
                                                                   max="${o.value.product.quantity}" 
                                                                   readonly
                                                                   class="form-control readonly-input" />
                                                            <button type="button" class="btn btn-increment" onclick="changeQuantity(this, 1)">+</button>
                                                        </div>
                                                        <small class="text-muted">(Available: ${o.value.product.quantity})</small>
                                                    </td>
                                                    <td class="border-0 align-middle">
                                                        <a href="deleteCart?productID=${o.value.product.product_id}" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Remove</button>
                                                        </a>
                                                    </td>
                                                </form>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="row py-5 p-4 bg-white rounded shadow-sm">
                                <div class="col-lg-6">
                                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
                                    <div class="p-4">
                                        <ul class="list-unstyled mb-4">
                                            <li class="d-flex justify-content-between py-3 border-bottom">
                                                <strong class="text-muted">Total</strong>
                                                <strong>$${totalMoney}</strong>
                                            </li>
                                        </ul>
                                        <a href="checkOutURL" class="btn btn-dark rounded-pill py-2 btn-block">Proceed to checkout</a>
                                    </div>
                                </div>
                                <div class="col-lg-6 text-right">
                                    <button type="button" class="btn btn-primary rounded-pill" onclick="submitAllForms()">Update Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        function changeQuantity(button, increment) {
            const input = button.parentNode.querySelector('input[name="quantity"]');
            let value = parseInt(input.value);
            const min = parseInt(input.min);
            const max = parseInt(input.max);

            value += increment;

            if (value >= min && value <= max) {
                input.value = value;
            }
        }

        function submitAllForms() {
            document.querySelectorAll('form').forEach(form => form.submit());
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>