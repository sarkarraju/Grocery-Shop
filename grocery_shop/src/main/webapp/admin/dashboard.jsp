
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.grocery.entities.admin" %>
<%@ page import="com.grocery.entities.product" %>
<%@ page import="com.grocery.connection.DBconnection" %>
<%@ page import="com.grocery.dao.productDao" %>
<%@ page import="com.grocery.dao.userDao" %>
<%@ page import="com.grocery.dao.OrderDao" %>



<%
    // ================= ADMIN SESSION =================

    admin admin = (admin) session.getAttribute("current admin");

    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }


    // ================= GET PRODUCTS =================

    productDao pdao =
            new productDao(DBconnection.getConnection());

    List<product> productList =
            pdao.getAllProducts();
    
    userDao udao =
            new userDao(DBconnection.getConnection());

    int totalUsers =
            udao.getTotalUsers();
    
    
    OrderDao odao = new OrderDao();

    int totalOrders =
            odao.getTotalOrders();

    double totalRevenue =
            odao.getTotalRevenue();

%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard</title>


    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
        crossorigin="anonymous"
    />


    <!-- Admin CSS -->

    <link
        rel="stylesheet"
        href="admin.css"
    />


    <!-- Font Awesome -->

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

</head>


<body>


<div class="container-fluid">

    <div class="row">


        <!-- ================= SIDEBAR ================= -->

        <div class="col-md-3 col-lg-2 px-0 sidebar">


            <div class="brand">

                <i class="fa fa-shopping-basket"></i>

                Grocery Admin

            </div>


            <hr class="text-white">


            <!-- Dashboard -->

            <a href="dashboard.jsp">

                <i class="fa fa-dashboard"></i>

                Dashboard

            </a>


            <!-- Products -->

            <a href="product.jsp">

                <i class="fa fa-shopping-cart"></i>

                Products

            </a>


            <!-- Add Product -->

            <a href="addProduct.jsp">

                <i class="fa fa-plus"></i>

                Add Product

            </a>


            <!-- Orders -->

            <a href="Order.jsp">

                <i class="fa fa-list"></i>

                Orders

            </a>


            <!-- Users -->

            <a href="users.jsp">

                <i class="fa fa-users"></i>

                Users

            </a>


            <!-- Admin Name -->

            <div class="text-white px-3 mt-3">

                <i class="fa fa-user"></i>

                <%= admin.getName() %>

            </div>


            <!-- Logout -->

            <a href="adminlogoutServlet">

                <i class="fa fa-sign-out"></i>

                Logout

            </a>


        </div>


        <!-- ================= MAIN CONTENT ================= -->

        <div class="col-md-9 col-lg-10 px-0">


            <!-- ================= TOP BAR ================= -->

            <div class="topbar d-flex justify-content-between align-items-center">

                <h4 class="mb-0">

                    Dashboard

                </h4>


                <div>

                    <i class="fa fa-user"></i>

                    <%= admin.getName() %>

                </div>

            </div>


            <!-- ================= DASHBOARD CONTENT ================= -->

            <div class="dashboard-content">


                <h2 class="mb-4">

                    Welcome, Admin

                </h2>


                <!-- ================= STAT CARDS ================= -->

                <div class="row g-4 mb-4">


                    <!-- Products -->

                    <div class="col-md-6 col-xl-3">

                        <div class="card stat-card">

                            <div class="card-body">

                                <div class="d-flex justify-content-between">

                                    <div>

                                        <h6 class="text-muted">

                                            Total Products

                                        </h6>

                                        <h2>

                                            <%= productList.size() %>

                                        </h2>

                                    </div>


                                    <div class="stat-icon text-primary">

                                        <i class="fa fa-shopping-basket"></i>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- Orders -->

                    <div class="col-md-6 col-xl-3">

                        <div class="card stat-card">

                            <div class="card-body">

                                <div class="d-flex justify-content-between">

                                    <div>

                                        <h6 class="text-muted">

                                            Total Orders

                                        </h6>

                                       <h2>
    <%= totalOrders %>
</h2>

                                    </div>


                                    <div class="stat-icon text-success">

                                        <i class="fa fa-shopping-cart"></i>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- Users -->

                    <div class="col-md-6 col-xl-3">

                        <div class="card stat-card">

                            <div class="card-body">

                                <div class="d-flex justify-content-between">

                                    <div>

                                        <h6 class="text-muted">

                                           <h2><%= totalUsers %></h2>

                                        </h6>

                                     

                                    </div>


                                    <div class="stat-icon text-warning">

                                        <i class="fa fa-users"></i>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- Revenue -->

                    <div class="col-md-6 col-xl-3">

                        <div class="card stat-card">

                            <div class="card-body">

                                <div class="d-flex justify-content-between">

                                    <div>

                                        <h6 class="text-muted">

                                            Revenue

                                        </h6>

                                      <h2>
    ₹<%= String.format("%.2f", totalRevenue) %>
</h2>

                                    </div>


                                    <div class="stat-icon text-danger">

                                        <i class="fa fa-inr"></i>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- ================= PRODUCTS ================= -->

                <div class="product-table">


                    <!-- Heading -->

                    <div class="d-flex justify-content-between align-items-center mb-3">


                        <h4>

                            Recent Products

                        </h4>


                        <a href="addProduct.jsp"
                           class="btn btn-primary">

                            <i class="fa fa-plus"></i>

                            Add Product

                        </a>

                    </div>


                    <!-- Product Table -->

                    <div class="table-responsive">


                        <table class="table table-hover">


                            <thead>

                                <tr>

                                    <th>ID</th>

                                    <th>Product</th>

                                    <th>Price</th>

                                    <th>Quantity</th>

                                    <th>Unit</th>

                                    <th>Action</th>

                                </tr>

                            </thead>


                            <tbody>


                            <%

                                if (productList != null &&
                                    !productList.isEmpty()) {

                                    for (product p : productList) {

                            %>


                                <tr>


                                    <!-- ID -->

                                    <td>

                                        <%= p.getId() %>

                                    </td>


                                    <!-- Product Name -->

                                    <td>

                                        <%= p.getName() %>

                                    </td>


                                    <!-- Price -->

                                    <td>

                                        ₹<%= p.getPrice() %>

                                    </td>


                                    <!-- Quantity -->

                                    <td>

                                        <%= p.getQuantity() %>

                                    </td>


                                    <!-- Unit -->

                                    <td>

                                        <%= p.getUnit() %>

                                    </td>


                                    <!-- Actions -->

                                    <td>


                                        <!-- EDIT -->

                                        <a href="EditProductServlet?id=<%= p.getId() %>"
                                           class="btn btn-sm btn-primary"
                                           title="Edit Product">

                                            <i class="fa fa-edit"></i>

                                        </a>


                                        <!-- DELETE -->

                                        <a href="DeleteProductServlet?id=<%= p.getId() %>"
                                           class="btn btn-sm btn-danger"
                                           title="Delete Product"
                                           onclick="return confirm('Are you sure you want to delete this product?');">

                                            <i class="fa fa-trash"></i>

                                        </a>


                                    </td>


                                </tr>


                            <%

                                    }

                                } else {

                            %>


                                <tr>

                                    <td colspan="6"
                                        class="text-center">

                                        No products found.

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

        </div>


    </div>

</div>


</body>

</html>
