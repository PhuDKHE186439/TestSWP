<%-- 
    Document   : ManagerCustomer
    Created on : Feb 27, 2022, 10:49:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Bill</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/ManagerProduct.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            body{
                font-size: medium;
            }
        </style>


    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <h2>Manage Bill</h2>
                        <form action="loadBillDetailURL" method="get">
                                                 
                                                <select name="isAccept">
<!--                                                    <option value="0" selected style="color: black">Still not accepted</option>-->
                                                    <option value="1" style="color: green">Accepted</option>
                                                    <option value="2" style="color: red">Denied</option>  
                                                </select>

                            <input type="submit"> 
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">User_ID</th>
                            <th scope="col">Order_ID</th>
                            <th scope="col">Total_Amount</th>
                            <th scope="col">Date</th>
                            <th scope="col">Shipping_ID</th>
                            <th scope="col">View Detail</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach items="${list}" var="o">

                            <tr>
                                <td>${o.user_id}</td>
                                <td>${o.order_id}</td>
                                <td>${o.total_amount}</td>
                                <td>${o.order_date }</td>
                                <td>${o.shippingId}</td> 

                                <td>
                                    <a href="BillDetailURL?orderID=${o.order_id}" style="color: red">View Details</a>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${o.isEdited == 0}">                                     
                                        <a>

                                            <form action="loadBillURL" method="get">
                                                <input type="hidden" name="orderID" value="${o.order_id}">   
                                                <select name="isAccept">
<!--                                                    <option value="0" selected style="color: black">Still not accepted</option>-->
                                                    <option value="1" style="color: green">Accepted</option>
                                                    <option value="2" style="color: red">Denied</option>  
                                                </select>

                                                <input type="submit"> 
                                            </form>    
                                        </a>                                      
                                    </c:when>
                                    <c:otherwise>                                        
                                <c:choose>
                              
                              <c:when test="${o.isAccept == 1}">
                                  <a style="color: green">Accepted</a>
                              </c:when>    
                              <c:otherwise>
                                  <a style="color: red">Deny</a>
                              </c:otherwise>
                          </c:choose>                                       
                            </c:otherwise>    
                        </c:choose>
                        </td>        
                            
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

            </div>
            <a href="HomeURL">
                <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>



                <script src="ManagerProduct.js" type="text/javascript"></script>
            </a>    
    </body>
</html>
