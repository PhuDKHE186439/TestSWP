<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>
<%@page import ="DAO.DAOOrderDetail"%>
<%@page import ="DAO.DAOProduct"%>
<%@page import ="DAO.DAOOrder"%>
<%@page import ="entity.OrderDetail"%>
<%@page import ="entity.Product"%>
<%@page import ="entity.Order"%>
<%@page import ="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Detail</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
    </head>

    <body>
        
        <%
            
            DAO.DAOOrderDetail daoOd = new DAOOrderDetail();
            DAO.DAOProduct daoP = new DAOProduct();
            DAO.DAOOrder daoO = new DAOOrder();
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            Order order = daoO.getOrderByOrderID(orderID);
            List<OrderDetail> list = daoOd.getAllOrderDetailById(orderID);
        %>
        <jsp:include page="Menu.jsp"></jsp:include>
        
                <div class="shopping-cart">
                    <div class="px-4 px-lg-0">

                        <div class="pb-5">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                        <!-- Shopping cart table -->
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="p-2 px-3 text-uppercase">Product</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Money</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Quantity</div>
                                                        </th>

                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                   <% for (OrderDetail orderDetail : list) {%>
                                                    <%Product pro = daoP.getProductByProductID(orderDetail.getProduct_id());%>
                                                        <tr>
                                                        <th scope="row">
                                                            <div class="p-2">
                                                                <img src="<%=pro.getImage()%>" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                                <div class="ml-3 d-inline-block align-middle">
                                                                    <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block"><%=pro.getProduct_name()%></a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                </div>
                                                            </div>
                                                        </th>    
                                                        <td class="align-middle"><strong><%=pro.getPrice()*orderDetail.getQuantity()%></strong></td>
                                                        <td class="align-middle"><strong><%=orderDetail.getQuantity()%></strong></td>
                                                        
                                                        </tr> 
      
                                                <%}%>        
                                                </tbody>
                                            </table>
                                            <h3>Total Amount: <%=order.getTotal_amount()%></h3>

                                        </div>
                                        <!-- End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
