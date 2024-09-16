<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <style>
        /* Custom styles */
        body {
            background-color: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }

        #logreg-forms {
            width: 100%;
            max-width: 500px;
            padding: 15px;
            margin: auto;
        }

        .form-signin {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.1);
        }

        .form-signin .btn {
            font-size: 16px;
            font-weight: bold;
        }

        .form-signin label {
            margin-bottom: 0.5rem;
        }

        .form-signin input {
            margin-bottom: 1rem;
        }

        .form-signin .alert {
            margin-bottom: 1rem;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <div id="logreg-forms">
        <form class="form-signin" action="checkOutURL" method="post">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Order</h1>
            <c:if test="${error!=null }">
                <div class="alert alert-danger" role="alert">${error}</div>
            </c:if>
            <c:if test="${mess!=null }">
                <div class="alert alert-success" role="alert">${mess}</div>
            </c:if>
            <label for="name">Name</label>
            <input name="name" type="text" id="name" class="form-control" placeholder="Name" required="" autofocus="">
                <label for="phoneNumber">Phone number</label>
            <input name="phoneNumber" type="text" id="phoneNumber" class="form-control" placeholder="Phone number" required="" autofocus="">
            <label for="deliveryAddress">Delivery Address</label>
            <input name="deliveryAddress" type="text" id="deliveryAddress" class="form-control" placeholder="Delivery Address" required="" autofocus="">
            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-american-sign-language-interpreting"></i> Order Now</button>
        </form>
    </div>

    <!-- JavaScript libraries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            // Optional JavaScript to toggle password visibility
            $('#showPassword').click(function() {
                var passwordField = $('#password');
                var passwordFieldType = passwordField.attr('type');
                if (passwordFieldType == 'password') {
                    passwordField.attr('type', 'text');
                    $(this).text('Hide Password');
                } else {
                    passwordField.attr('type', 'password');
                    $(this).text('Show Password');
                }
            });
        });
    </script>
</body>
</html>
