<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.grocery.connection.DBconnection" %>
<%@ page import="com.grocery.dao.productDao" %>
<%@ page import="com.grocery.entities.product" %>
<%@ page import="com.grocery.entities.user" %>


<%

    // Get all products from database

    productDao dao =
            new productDao(DBconnection.getConnection());

    List<product> products =
            dao.getAllProducts();


    // Check logged-in user

    user currentUser =
            (user) session.getAttribute("current user");

%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Home Page</title>


    <!-- Bootstrap 5 -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
        crossorigin="anonymous"
    />


    <!-- Your CSS -->

    <link
        rel="stylesheet"
        href="style.css"
    />


    <!-- Font Awesome -->

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />


</head>


<body>


<!-- ====================================================== -->
<!-- NAVBAR -->
<!-- ====================================================== -->

<nav class="navbar navbar-expand-lg primary_bg">

    <div class="container-fluid">


        <!-- LOGO -->

        <img
            src="img/img0.png"
            alt="logo"
            class="navbar-logo me-4"
        />


        <!-- MOBILE MENU BUTTON -->

        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
        >

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- NAVBAR CONTENT -->

        <div
            class="collapse navbar-collapse"
            id="navbarSupportedContent"
        >


            <!-- LEFT MENU -->

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">


                <!-- HOME -->

                <li class="nav-item">

                    <a
                        class="nav-link active text-white"
                        aria-current="page"
                        href="index.jsp"
                    >

                        Home

                    </a>

                </li>


                <!-- GROCERY -->

                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="#"
                    >

                        Grocery & Snacks

                    </a>

                </li>


                <!-- DAIRY -->

                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="#"
                    >

                        Dairy & Eggs

                    </a>

                </li>


                <!-- ADMIN -->

                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="admin/AdminLogin.jsp"
                    >

                        Admin

                    </a>

                </li>


                <!-- CART -->

                <li class="nav-item">

                    <a
                        class="nav-link text-white"
                        href="cart.jsp"
                    >

                        <i class="fa fa-shopping-cart"></i>

                        Cart

                    </a>

                </li>


            </ul>


            <!-- SEARCH -->

            <form
                class="d-flex me-4"
                role="search"
            >

                <input
                    class="form-control me-2"
                    type="search"
                    placeholder="Search"
                    aria-label="Search"
                />


                <button
                    class="btn btn-outline-warning gap-2"
                    type="submit"
                >

                    Search

                </button>

            </form>


            <!-- LOGIN / REGISTER -->

            <div class="d-flex gap-2">


                <% if(currentUser == null) { %>


                    <!-- USER NOT LOGGED IN -->

                    <a
                        href="login.jsp"
                        class="btn btn-danger"
                    >

                        Login

                    </a>


                    <a
                        href="register.jsp"
                        class="btn btn-outline-light"
                    >

                        Register

                    </a>


                <% } else { %>


                    <!-- USER LOGGED IN -->

                    <a
                        href="profile.jsp"
                        class="btn btn-warning"
                    >

                        <i class="fa fa-user"></i>

                        <%=currentUser.getName()%>

                    </a>


                    <a
                        href="LogoutServlet"
                        class="btn btn-danger"
                    >

                        Logout

                    </a>


                <% } %>


            </div>


        </div>

    </div>

</nav>


<hr class="m-0 border border-secondary opacity-50" />



<!-- ====================================================== -->
<!-- HERO SECTION -->
<!-- ====================================================== -->

<div
    class="container-fluid py-5 primary_bg text-white hero-section banner-bg"
>


    <div class="container">


        <div class="row">


            <!-- HERO TEXT -->

            <div class="col-md-6">


                <h1 class="display-5 fw-bold mt-5">

                    Fresh

                    <span class="txt-color">

                        Groceries

                    </span>

                    Delivered

                </h1>


                <p class="col-md-8 fs-4 mt-2">

                    Get fresh fruits, vegetables, dairy products,
                    and groceries delivered right to your doorstep.

                </p>


                <a
                    href="#products"
                    class="btn btn-warning btn-lg mt-5"
                >

                    <span class="fa fa-shopping-basket"></span>

                    Shop Now

                </a>


            </div>



            <!-- HERO IMAGE -->

            <div class="col-md-6">

                <img
                    class="img"
                    src="img/img1.png"
                    alt="groceries"
                />

            </div>


        </div>

    </div>

</div>



<br />



<!-- ====================================================== -->
<!-- PRODUCTS SECTION -->
<!-- ====================================================== -->

<div
    class="container mt-4 mb-5"
    id="products"
>


    <h2 class="text-center mb-4">

        Our Products

    </h2>



    <div class="row">


        <%

            if(products != null && !products.isEmpty()) {


                for(product p : products) {

        %>


        <!-- PRODUCT CARD -->

        <div class="col-md-6 col-lg-4 col-xl-3 mb-4">


            <div class="card h-100 shadow-sm">


                <!-- PRODUCT IMAGE -->

                <% if(p.getImage() != null) { %>


                    <img
                        src="data:image/jpeg;base64,<%=

                            java.util.Base64
                            .getEncoder()
                            .encodeToString(p.getImage())

                        %>"
                        class="card-img-top"
                        alt="<%=p.getName()%>"
                        style="
                            height: 200px;
                            object-fit: cover;
                        "
                    />


                <% } else { %>


                    <!-- IF IMAGE IS NULL -->

                    <div
                        class="d-flex align-items-center justify-content-center"
                        style="
                            height: 200px;
                            background-color: #f5f5f5;
                        "
                    >

                        <i
                            class="fa fa-image fa-3x text-secondary"
                        ></i>

                    </div>


                <% } %>



                <!-- CARD BODY -->

                <div class="card-body d-flex flex-column">


                    <!-- PRODUCT NAME -->

                    <h5 class="card-title">

                        <%=p.getName()%>

                    </h5>



                    <!-- DESCRIPTION -->

                    <p class="card-text">

                        <%=p.getDescription()%>

                    </p>



                    <!-- UNIT -->

                    <p class="mb-2">

                        <strong>
                            Unit:
                        </strong>

                        <%=p.getUnit()%>

                    </p>



                    <!-- PRICE -->

                    <h5 class="mb-3">

                        ₹<%=String.format("%.2f", p.getPrice())%>

                    </h5>



                    <!-- ================================================= -->
                    <!-- LOGIN / ADD TO CART -->
                    <!-- ================================================= -->


                    <% if(currentUser == null) { %>


                        <!-- VISITOR -->

                        <a
                            href="login.jsp"
                            class="btn btn-primary w-100 mt-auto"
                        >

                            <i class="fa fa-sign-in"></i>

                            Login to Shop

                        </a>


                    <% } else { %>


                        <!-- LOGGED-IN USER -->

                        <form
                            action="AddToCartServlet"
                            method="post"
                            class="mt-auto"
                        >


                            <!-- PRODUCT ID -->

                            <input
                                type="hidden"
                                name="productId"
                                value="<%=p.getId()%>"
                            />


                            <button
                                type="submit"
                                class="btn btn-primary w-100"
                            >

                                <i class="fa fa-shopping-cart"></i>

                                Add to Cart

                            </button>


                        </form>


                    <% } %>


                </div>


            </div>


        </div>


        <%

                }

            } else {

        %>


        <!-- NO PRODUCT -->

        <div class="col-12">


            <div class="alert alert-info text-center">

                No products available.

            </div>


        </div>


        <%

            }

        %>


    </div>


</div>



<!-- ====================================================== -->
<!-- FOOTER -->
<!-- ====================================================== -->

<footer class="primary_bg text-white pt-5 pb-3">


    <div class="container">


        <div class="row">


            <!-- ABOUT -->

            <div class="col-md-4 mb-4">


                <h4 class="fw-bold">

                    FreshMart

                </h4>


                <p class="mt-3">

                    Your trusted online grocery store
                    for fresh, quality and affordable products.

                </p>


            </div>



            <!-- QUICK LINKS -->

            <div class="col-md-2 col-6 mb-4">


                <h5 class="fw-bold">

                    Quick Links

                </h5>


                <ul class="list-unstyled mt-3">


                    <li class="mb-2">

                        <a
                            href="index.jsp"
                            class="text-white text-decoration-none"
                        >

                            Home

                        </a>

                    </li>


                    <li class="mb-2">

                        <a
                            href="#products"
                            class="text-white text-decoration-none"
                        >

                            Shop

                        </a>

                    </li>


                    <li class="mb-2">

                        <a
                            href="#"
                            class="text-white text-decoration-none"
                        >

                            About

                        </a>

                    </li>


                    <li>

                        <a
                            href="#"
                            class="text-white text-decoration-none"
                        >

                            Contact

                        </a>

                    </li>


                </ul>


            </div>



            <!-- CATEGORIES -->

            <div class="col-md-3 col-6 mb-4">


                <h5 class="fw-bold">

                    Categories

                </h5>


                <ul class="list-unstyled mt-3">


                    <li class="mb-2">

                        Fruits & Vegetables

                    </li>


                    <li class="mb-2">

                        Dairy Products

                    </li>


                    <li class="mb-2">

                        Groceries

                    </li>


                    <li>

                        Snacks & Beverages

                    </li>


                </ul>


            </div>



            <!-- CONTACT -->

            <div class="col-md-3 mb-4">


                <h5 class="fw-bold">

                    Contact Us

                </h5>


                <p class="mt-3 mb-2">

                    Baharampur, West Bengal

                </p>


                <p class="mb-2">

                    +91 xxxxxxxxxx

                </p>


                <p>

                    info@freshmart.com

                </p>


            </div>


        </div>



        <hr class="border-light" />



        <!-- BOTTOM FOOTER -->

        <div class="row align-items-center">


            <div
                class="col-md-6 text-center text-md-start"
            >

                <p class="mb-0">

                    © 2026 FreshMart.
                    All Rights Reserved.

                </p>

            </div>



            <div
                class="col-md-6 text-center text-md-end mt-2 mt-md-0"
            >


                <a
                    href="#"
                    class="text-white text-decoration-none me-3"
                >

                    Privacy Policy

                </a>


                <a
                    href="#"
                    class="text-white text-decoration-none"
                >

                    Terms & Conditions

                </a>


            </div>


        </div>


    </div>


</footer>



<!-- ====================================================== -->
<!-- BOOTSTRAP JAVASCRIPT -->
<!-- ====================================================== -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
    crossorigin="anonymous"
></script>


</body>

</html>