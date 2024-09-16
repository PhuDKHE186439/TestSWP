<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Form</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" rel="stylesheet">
    <style>
        body {
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }
        #logreg-forms {
            width: 500px;
            margin: 10vh auto;
            background: #fff;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border-radius: 10px;
        }
        .form-signin, .form-signup {
            display: none;
        }
        .form-signin.active, .form-signup.active {
            display: block;
        }
        .form-signin .btn, .form-signup .btn {
            border-radius: 50px;
            padding: 10px;
        }
        h1.h3 {
            color: #333;
        }
        .text-danger {
            color: #ff4d4d;
        }
        .form-control {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div id="logreg-forms">
        <form class="form-signin active" action="LoginURL" method="post">
            <h1 class="h3 mb-3 font-weight-normal text-center">Login</h1>
            <p class="text-danger">${message}</p>
            <input name="user" type="text" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
            <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
            <button class="btn btn-success btn-block" type="submit">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
            <hr>
            <button class="btn btn-primary btn-block" id="btn-signup">
                <i class="fas fa-user-plus"></i> Sign Up New Account
            </button>
        </form>
        
        <form action="signupURL" method="post" class="form-signup">
            <h1 class="h3 mb-3 font-weight-normal text-center">Sign Up</h1>
            <input name="fullname" type="text" class="form-control" placeholder="Full Name" required>
            <input name="user" type="text" id="user-name" class="form-control" placeholder="Username" required>
            <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required>
            <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required>
            <input name="phone" type="text" class="form-control" placeholder="Phone Number">
            <button class="btn btn-primary btn-block" type="submit">
                <i class="fas fa-user-plus"></i> Sign Up
            </button>
            <a href="#" id="cancel_signup" class="btn btn-secondary btn-block">
                <i class="fas fa-angle-left"></i> Back
            </a>
        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        function toggleForms() {
            $('#logreg-forms .form-signin').toggleClass('active');
            $('#logreg-forms .form-signup').toggleClass('active');
        }

        $(document).ready(function() {
            $('#btn-signup').click(toggleForms);
            $('#cancel_signup').click(toggleForms);
        });
    </script>
</body>
</html>