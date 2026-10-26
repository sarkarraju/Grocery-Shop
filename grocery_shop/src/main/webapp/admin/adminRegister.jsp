<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Register page</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="admin.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
</head>
<body>

    <main class="d-flex align-items-center justify-content-center min-vh-100 " >
      <div class="container">
        <div class="row">
          <div class="col-md-4 offset-md-4 ">
            <div class="card border-black  border-2 shadow-lg">
              <div class="card-header bg_card text-white text-center">
                <span class="fa fa-user-plus fs-1"></span>
                <p>Register here</p>
              </div>
                       
              
              <div class="card-body ">
                <form action="AdminRegisterServlet" method="post">
                 <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">User Name:</label>
                    <input name="name" required  type="text" class="form-control " id="exampleInputPassword1" />
                  </div>
                
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address:</label>
                    <input name="email" required
                      type="email"
                      class="form-control"
                      id="exampleInputEmail1"
                      aria-describedby="emailHelp"
                    />
                    
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input name="password" required  type="password" class="form-control " id="exampleInputPassword1" />
                  </div>
                   
                 <div class="d-flex justify-content-center">
    <button type="submit" class="btn btn-primary">
        Submit
    </button>
</div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
</body>
</html>