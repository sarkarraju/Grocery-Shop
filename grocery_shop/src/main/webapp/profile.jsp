<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    
    
    <%@ page import ="com.grocery.entities.user" %>
    <% 
    user user=(user)session.getAttribute("current user");
    
    if(user==null){
    	response.sendRedirect("login.jsp");
    }
    
    
    
    
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />


</head>
<body>

 <nav class="navbar navbar-expand-lg primary_bg">
      <div class="container-fluid">
        <img src="img/img0.png" alt="logo" class="navbar-logo me-4" />
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
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active text-white" aria-current="page" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="#"> Grocery & Snacks</a>
            </li>

            <li class="nav-item">
              <a class="nav-link text-white" href="#" aria-disabled="false">Dairy & Eggs</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="#" aria-disabled="false">Fruits & Vegetables </a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white hovr" href="cart.jsp">
    <span class="fa fa-shopping-cart"></span> Cart
</a>
            </li>
          </ul>

          
          
         <ul class="navbar-nav mr-right">
        <li class="nav-item">
              <a class="nav-link text-white" href="register.jsp"><span class="fa fa-user-circle"></span> <%=user.getName() %></a>
            </li>
         
          <li class="nav-item">
              <a class="nav-link text-white" href="LogoutServlet"><span class="	fa fa-user"></span> Logout</a>
            </li>
         
         
         
         </ul>
        </div>
      </div>
    </nav>



<main class="d-flex justify-content-center align-items-center"
      style="height: 100vh;">

    <h1>Welcome to Your Zone</h1>

</main>

</body>
</html>