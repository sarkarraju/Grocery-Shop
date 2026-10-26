<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.grocery.entities.CartItem" %>
<%@ page import="com.grocery.dao.cartDao" %>
<%@ page import="com.grocery.entities.user" %>

<%

    // Get logged-in user
    user user = (user) session.getAttribute("current user");

    // If user is not logged in
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get user ID
    int userId = user.getId();

    // Create cart DAO
    cartDao dao = new cartDao();

    // Get cart from DATABASE
    List<CartItem> cart = dao.getCartByUser(userId);

%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Shopping Cart</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="style.css">

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg primary_bg">

    <div class="container-fluid">

        <img
            src="img/img0.png"
            alt="logo"
            class="navbar-logo me-4">


        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent">

            <span class="navbar-toggler-icon"></span>

        </button>


        <div
            class="collapse navbar-collapse"
            id="navbarSupportedContent">


            <!-- LEFT MENU -->

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">


                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="index.jsp">

                        Home

                    </a>

                </li>


                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="#">

                        Grocery & Snacks

                    </a>

                </li>


                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="#">

                        Dairy & Eggs

                    </a>

                </li>


                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="#">

                        Fruits & Vegetables

                    </a>

                </li>


                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="cart.jsp">

                        <span class="fa fa-shopping-cart"></span>

                        Cart

                    </a>

                </li>


            </ul>


            <!-- RIGHT MENU -->

            <ul class="navbar-nav">


                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="profile.jsp">

                        <span class="fa fa-user-circle"></span>

                        <%= user.getName() %>

                    </a>

                </li>


                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="LogoutServlet">

                        <span class="fa fa-sign-out"></span>

                        Logout

                    </a>

                </li>


            </ul>


        </div>

    </div>

</nav>


<!-- ================= CART ================= -->


<div class="container mt-5">


    <h2 class="mb-4">

        <i class="fa fa-shopping-cart"></i>

        My Cart

    </h2>


<%

    // Check database cart

    if (cart == null || cart.isEmpty()) {

%>


        <!-- EMPTY CART -->

        <div class="text-center mt-5">


            <i class="fa fa-shopping-cart fa-4x"></i>


            <h4 class="mt-3">

                Your cart is empty

            </h4>


            <a
                href="index.jsp"
                class="btn btn-primary mt-3">

                Continue Shopping

            </a>


        </div>


<%

    } else {

        double total = 0;

%>


        <!-- CART TABLE -->

        <div class="table-responsive">


            <table
                class="table table-bordered align-middle">


                <thead class="table-dark">

                    <tr>

                        <th>Product</th>

                        <th>Price</th>

                        <th>Quantity</th>

                        <th>Total</th>

                        <th>Action</th>

                    </tr>

                </thead>


                <tbody>


<%

        for (CartItem item : cart) {

            double itemTotal =
                item.getPrice() * item.getQuantity();

            total += itemTotal;

%>


                    <tr>


                        <!-- PRODUCT NAME -->

                        <td>

                            <%= item.getProductName() %>

                        </td>


                        <!-- PRICE -->

                        <td>

                            ₹<%= item.getPrice() %>

                        </td>


                        <!-- QUANTITY -->

                        <td>


                            <form
                                action="CartUpdateServlet"
                                method="post"
                                class="d-flex">


                                <!-- PRODUCT ID -->

                                <input
                                    type="hidden"
                                    name="productId"
                                    value="<%= item.getProductId() %>">


                                <!-- QUANTITY -->

                                <input
                                    type="number"
                                    name="quantity"
                                    value="<%= item.getQuantity() %>"
                                    min="1"
                                    class="form-control"
                                    style="width:80px;">


                                <!-- UPDATE -->

                                <button
                                    type="submit"
                                    class="btn btn-primary ms-2">

                                    Update

                                </button>


                            </form>


                        </td>


                        <!-- ITEM TOTAL -->

                        <td>

                            ₹<%= itemTotal %>

                        </td>


                        <!-- REMOVE -->

                        <td>


                            <a
                                href="RemoveCartServlet?productId=<%= item.getProductId() %>"
                                class="btn btn-danger">


                                <i class="fa fa-trash"></i>

                                Remove


                            </a>


                        </td>


                    </tr>


<%

        }

%>


                </tbody>


            </table>


        </div>


        <!-- GRAND TOTAL -->

        <div class="text-end">


            <h4>

                Grand Total:

                ₹<%= total %>

            </h4>


           <form action="PlaceOrderServlet" method="post">

    <button type="submit"
            class="btn btn-success mt-3">

        <i class="fa fa-shopping-bag"></i>
        Place Order

    </button>

</form>


        </div>


<%

    }

%>


</div>


</body>

</html>