<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FU MOTORRAD</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f8f9fa;
                color: #333;
            }
            .navbar {
                background-color: rgba(28, 28, 28, 0.9);
                padding: 15px 0;
                position: fixed;
                width: 100%;
                top: 0;
                z-index: 1000;
                transition: background-color 0.3s ease;
            }
            .navbar.scrolled {
                background-color: #1c1c1c;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .navbar-brand {
                color: #ffffff;
                font-size: 28px;
                font-weight: 700;
                text-decoration: none;
                letter-spacing: 2px;
                transition: color 0.3s ease;
            }
            .navbar-brand:hover {
                color: #007bff;
            }
            .navbar-nav {
                display: flex;
                list-style-type: none;
                align-items: center;
            }
            .nav-item {
                margin-left: 25px;
            }
            .nav-link {
                color: #ffffff;
                text-decoration: none;
                font-size: 16px;
                font-weight: 500;
                transition: color 0.3s ease;
                position: relative;
                margin-left: 30px;
                margin-right: 10px;

            }
            .nav-link:after {
                content: '';
                position: absolute;
                width: 0;
                height: 2px;
                background: #007bff;
                left: 0;
                bottom: -5px;
                transition: width 0.3s ease;
            }
            .nav-link:hover:after {
                width: 100%;
            }
            .dropdown-menu {
                background-color: #1c1c1c;
                border: none;
                border-radius: 5px;
                padding: 10px 0;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }
            .dropdown-item {
                color: #ffffff;
                padding: 10px 20px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }
            .dropdown-item:hover {
                background-color: #007bff;
                color: #ffffff;
            }
            .navbar-right {
                display: flex;
                align-items: center;
            }
            .search-bar {
                display: flex;
                align-items: center;
                margin-right: 45px;
            }
            .search-input {
                padding: 8px 15px;
                border: none;
                border-radius: 25px 0 0 25px;
                font-size: 14px;
                width: 200px;
                background-color: #f8f9fa;
                transition: box-shadow 0.3s ease;
            }
            .search-input:focus {
                outline: none;
                box-shadow: 0 0 0 2px #007bff;
            }
            .search-btn {
                background-color: #007bff;
                color: #ffffff;
                border: none;
                padding: 8px 15px;
                border-radius: 0 25px 25px 0;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .search-btn:hover {
                background-color: #0056b3;
            }
            .cart-btn, .login-btn {
                background-color: #28a745;
                color: #ffffff;
                border: none;
                padding: 8px 15px;
                border-radius: 25px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.2s ease;
                display: flex;
                align-items: center;
                gap: 8px;
                text-decoration: none;
                font-size: 14px;
            }
            .cart-btn:hover, .login-btn:hover {
                background-color: #218838;
                transform: translateY(-2px);
            }
            .login-btn {
                background-color: #007bff;
                margin-left: 10px;
            }
            .login-btn:hover {
                background-color: #0056b3;
            }
            .hello-user {
                cursor: default;
                color: #ffffff;
                font-size: 16px;
                font-weight: 500;
            }
            .jumbotron {
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://neomotor.epe.es/binrepository/990x557/0c0/0d0/none/2594535/UCLW/imagen9563_NM9564_MG7788174.jpeg');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                color: #ffffff;
                text-align: center;
                padding: 200px 0;
                margin-top: 70px;
            }
            .jumbotron-heading {
                font-size: 56px;
                font-weight: 700;
                margin-bottom: 20px;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            }
            .lead {
                font-size: 28px;
                font-weight: 300;
                text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
                margin-bottom: 30px;
            }
            .cta-btn {
                display: inline-block;
                background-color: #007bff;
                color: #ffffff;
                text-decoration: none;
                padding: 15px 30px;
                border-radius: 30px;
                font-size: 18px;
                font-weight: 500;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }
            .cta-btn:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <nav class="navbar">
            <div class="container">
                <a class="navbar-brand" href="HomeURL">FU MOTORRAD</a>
                <ul class="navbar-nav">
                    <c:if test="${sessionScope.acc != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" id="managementDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Management <i class="fas fa-chevron-down"></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="managementDropdown">
                                <c:if test="${sessionScope.acc.isAdmin == 1}">
                                    <a class="dropdown-item" href="ManagerAccountURL">Account manager</a>
                                </c:if>
                                <c:if test="${sessionScope.acc.isAdmin == 1 || sessionScope.acc.isSell == 1}">
                                    <a class="dropdown-item" href="ManagerBillURL">Bill manager</a>
                                </c:if>
                                <c:if test="${sessionScope.acc.isAdmin == 0 && sessionScope.acc.isSell == 1 ||sessionScope.acc.isAdmin == 0 && sessionScope.acc.isSell == 0 }">
                                    <a class="dropdown-item" href="BillControllerURL">Bill</a>
                                </c:if>
                                <c:if test="${sessionScope.acc.isAdmin == 1 || sessionScope.acc.isSell == 1}">
                                    <a class="dropdown-item" href="ManagerProductURL">Product Manager</a>
                                </c:if>
                                <c:if test="${sessionScope.acc.isAdmin == 1 || sessionScope.acc.isSell == 1}">
                                    <a class="dropdown-item" href="thongke">Dash Boat</a>
                                </c:if>
                            </div>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <div class="navbar-right">
                            <form action="SearchURL" method="post" class="search-bar">
                                <input type="text" name="txt" class="search-input" placeholder="Search...">
                                <button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
                            </form>
                            <c:choose>
                                <c:when test="${sessionScope.acc != null}">
                                    <c:choose>
                                        <c:when test="${sessionScope.acc.isAdmin == 1}">
                                            <span class="nav-link hello-user">${sessionScope.acc.full_name}</span>
                                            <a class="nav-link" href="LogoutURL">Logout</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="cartsURL" class="cart-btn"><i class="fas fa-shopping-cart"></i> Cart</a>
                                            <span class="nav-link hello-user">${sessionScope.acc.full_name}</span>
                                            <a class="nav-link" href="LogoutURL">Logout</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <a href="Login.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Cart</a>
                                    <a class="login-btn" href="Login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <section class="jumbotron">
            <div class="container">
                <h1 class="jumbotron-heading">BMW-RIDE FOR LIFE</h1>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(window).scroll(function () {
                if ($(this).scrollTop() > 50) {
                    $('.navbar').addClass('scrolled');
                } else {
                    $('.navbar').removeClass('scrolled');
                }
            });
        </script>
    </body>
</html>