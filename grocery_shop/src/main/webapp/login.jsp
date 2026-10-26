<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
     <%@ page import ="com.grocery.entities.Message" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>



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
              <a class="nav-link text-white hovr" href="#">Cart </a>
            </li>
          </ul>

          <form class="d-flex me-4" role="search">
            <input
              class="form-control me-2"
              type="search"
              placeholder="Search"
              aria-label="Search"
            />
            <button class="btn btn-outline-warning gap-2" type="submit">Search</button>
          </form>
          <!-- Login & Register -->
          <div class="d-flex gap-2">
            <a href="#" class="btn btn-danger"> Login </a>

            <a href="register.jsp" class="btn btn-outline-light"> Register </a>
          </div>
        </div>
      </div>
    </nav>

    <hr class="m-0 border border-secondary opacity-50" />

  

    <main class="d-flex align-items-center primary_bg hero-section2 position-relative">
      <div class="container">
        <div class="row">
          <div class="col-md-4 offset-md-4">
            <div class="card position-absolute top-100 start-50 translate-middle border-black  border-2 shadow-lg">
              <div class="card-header primary2_bg text-white text-center">
                <span class="fa fa-user-plus fs-1"></span>
                <p>Login here</p>
              </div>
              
              
              <%
              Message m=(Message)session.getAttribute("msg");
              if(m!=null){
            	  
            %>
 	  
            	  
            <div class="alert <%=m.getCssClass() %>" role="alert">
 <%= m.getContent() %>
</div>  
           <% 
           
           
           session.removeAttribute("msg");
            	  
              }
              
              
              
              
              
              %>
              
              
              
              <div class="card-body ">
                <form action="loginServlet" method="post">
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input name="email" required
                      type="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                    />
                    <div id="emailHelp" class="form-text">
                      We'll never share your email with anyone else.
                    </div>
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input name="password" required  type="password" class="form-control " id="exampleInputPassword1" />
                  </div>
                  <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                  </div>
                  <button type="submit" class="btn btn-success">Submit</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>