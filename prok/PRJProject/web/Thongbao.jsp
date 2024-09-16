<%-- 
    Document   : Thongbao
    Created on : Jul 11, 2024, 10:55:26 AM
    Author     : totra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            h1 {
                color: #333;
                margin-bottom: 20px;
            }
            a {
                display: inline-block;
                margin-top: 10px;
                padding: 10px 20px;
                color: #fff;
                background-color: #007bff;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>BẠN KHÔNG PHẢI ADMIN</h1>
            <a href="Login.jsp">Đăng nhập</a>
        </div>
    </body>
</html>
