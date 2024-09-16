<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manager Account - FU MOTORRAD</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* ...a (giữ nguyên phần CSS) ... */
         body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            background: #007bff;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -20px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        .table th {
            font-weight: bold;
            border-top: none;
        }
        .table td, .table th {
            padding: 12px 15px;
            vertical-align: middle;
        }
        .edit {
            color: #007bff;
        }
        .edit:hover {
            color: #0056b3;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Account</b></h2>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Pass</th>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>IsSell</th>
                        <th>IsAdmin</th>                           
                        <th>Active</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${accounts}" var="acc">
                        <tr>
                            <td>${acc.userName}</td>
                            <td>${acc.password}</td>
                            <td>${acc.full_name}</td>
                            <td>${acc.phone_number}</td>
                            <td>${acc.isAdmin}</td>
                            <td>${acc.isSell}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${acc.active==0}">
                                        <span class="text-danger">Blocked</span>
                                    </c:when>    
                                    <c:otherwise>
                                        <span class="text-success">Active</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="loadAccountURL?acUser=${acc.userName}" class="edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="HomeURL" class="btn btn-primary mt-3">Back to home</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>