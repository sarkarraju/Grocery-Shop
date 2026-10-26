<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.grocery.entities.admin" %>
<%@ page import="com.grocery.entities.Order" %>
<%@ page import="com.grocery.dao.OrderDao" %>

<%
    admin admin = (admin) session.getAttribute("current admin");

    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    OrderDao orderDao = new OrderDao();

    List<Order> orderList = orderDao.getAllOrders();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Orders</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

body {
    background-color: #f5f5f5;
}

/* Sidebar */

.sidebar {
    width: 250px;
    height: 100vh;
    position: fixed;
    left: 0;
    top: 0;
    background-color: #260918;
    padding-top: 20px;
}

.sidebar h3 {
    color: white;
    text-align: center;
    margin-bottom: 30px;
}

.sidebar a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 14px 20px;
    font-size: 16px;
}

.sidebar a:hover {
    background-color: #4a1530;
}

.sidebar a i {
    width: 25px;
}

/* Main content */

.main-content {
    margin-left: 250px;
    padding: 30px;
}

.page-title {
    font-weight: bold;
    margin-bottom: 25px;
}

/* Order card */

.order-card {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

/* Table */

.table th {
    background-color: #260918;
    color: white;
}

.table td {
    vertical-align: middle;
}

.amount {
    font-weight: bold;
}

.badge-success {
    background-color: #198754;
}

</style>

</head>

<body>


<!-- SIDEBAR -->

<div class="sidebar">

    <h3>
        <i class="fa fa-shopping-basket"></i>
        Grocery Admin
    </h3>

    <a href="dashboard.jsp">
        <i class="fa fa-dashboard"></i>
        Dashboard
    </a>

    <a href="product.jsp">
        <i class="fa fa-shopping-cart"></i>
        Products
    </a>

    <a href="addProduct.jsp">
        <i class="fa fa-plus"></i>
        Add Product
    </a>

    <a href="order.jsp">
        <i class="fa fa-list"></i>
        Orders
    </a>

    <a href="users.jsp">
        <i class="fa fa-users"></i>
        Users
    </a>

    <a href="adminlogoutServlet">
        <i class="fa fa-sign-out"></i>
        Logout
    </a>

</div>


<!-- MAIN CONTENT -->

<div class="main-content">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2 class="page-title">
                <i class="fa fa-shopping-bag"></i>
                Orders
            </h2>

            <p class="text-muted">
                Manage all customer orders
            </p>
        </div>

        <div>

            <span class="badge bg-dark fs-6">
                Total Orders: <%= orderList.size() %>
            </span>

        </div>

    </div>


    <!-- ORDER TABLE -->

    <div class="order-card">

        <div class="table-responsive">

            <table class="table table-bordered table-hover">

                <thead>

                    <tr>
                        <th>#</th>
                        <th>Order ID</th>
                        <th>User ID</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>

                </thead>

                <tbody>

                <%
                    if (orderList != null && !orderList.isEmpty()) {

                        int count = 1;

                        for (Order order : orderList) {
                %>

                    <tr>

                        <td>
                            <%= count++ %>
                        </td>

                        <td>
                            <strong>#<%= order.getId() %></strong>
                        </td>

                        <td>
                            <%= order.getUserId() %>
                        </td>

                        <td class="amount">
                            ₹<%= String.format("%.2f", order.getTotalAmount()) %>
                        </td>

                        <td>
                            <span class="badge bg-success">
                                Completed
                            </span>
                        </td>

                        <td>

                            <button class="btn btn-sm btn-primary"
                                    onclick="alert('Order ID: <%= order.getId() %>')">

                                <i class="fa fa-eye"></i>
                                View

                            </button>

                        </td>

                    </tr>

                <%
                        }

                    } else {
                %>

                    <tr>

                        <td colspan="6"
                            class="text-center text-muted py-4">

                            <i class="fa fa-shopping-bag fa-2x mb-2"></i>

                            <br>

                            No orders found.

                        </td>

                    </tr>

                <%
                    }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>