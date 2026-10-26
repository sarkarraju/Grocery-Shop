<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Double orderTotal =
        (Double) session.getAttribute("orderTotal");

    if (orderTotal == null) {
        orderTotal = 0.0;
    }

    session.removeAttribute("orderTotal");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Order Successful</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

<div class="container text-center mt-5">

    <i class="fa fa-check-circle fa-5x text-success"></i>

    <h2 class="mt-4">
        Order Placed Successfully!
    </h2>

    <h4 class="mt-3">
        Total Amount: ₹<%= orderTotal %>
    </h4>

    <a href="index.jsp"
       class="btn btn-primary mt-4">

        Continue Shopping

    </a>

</div>

</body>

</html>