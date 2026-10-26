<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="com.grocery.connection.DBconnection" %>
<%@ page import="com.grocery.dao.productDao" %>
<%@ page import="com.grocery.entities.product" %>

<%
    productDao dao = new productDao(DBconnection.getConnection());
    List<product> products = dao.getAllProducts();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



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
<div class="container mt-5">
 <h2 class="mb-4">Manage Products</h2> 
 <a href="addProduct.jsp" class="btn btn-primary mb-3"> Add Product </a> 
 <table class="table table-bordered table-striped"> 
 <thead> 
 <tr>
  <th>ID</th> 
  <th>Product Name</th> 
  
   <th>Price</th> 
   <th>Quantity</th>
   <th>Unit</th>
   <th>Description</th>
   <th>Image</th> 
   <th>Action</th> 
   </tr>
    </thead>
     <tbody> 
     
     
     
    

<%
    for(product p : products) {
%>

<tr>

    <td><%= p.getId() %></td>

    <td><%= p.getName() %></td>

    <td>₹<%= p.getPrice() %></td>

    <td><%= p.getQuantity() %></td>

    <td><%= p.getUnit() %></td>

    <td><%= p.getDescription() %></td>

    <td>

        <%
            if(p.getImage() != null) {
        %>

            <img
                src="data:image/jpeg;base64,<%= java.util.Base64.getEncoder().encodeToString(p.getImage()) %>"
                width="80"
                height="80"
                class="img-thumbnail"
            >

        <%
            } else {
        %>

            No Image

        <%
            }
        %>

    </td>

    <td>

       <a href="EditProductServlet?id=<%= p.getId() %>"
   class="btn btn-sm btn-primary">

    <i class="fa fa-edit"></i>

</a>
<a href="DeleteProductServlet?id=<%= p.getId() %>"
   class="btn btn-sm btn-danger"
   onclick="return confirm('Are you sure you want to delete this product?');">

    <i class="fa fa-trash"></i>

</a>

    </td>

</tr>

<%
    }
%>


     
     
     
     
     </tbody> 
     </table>
      </div> 
      </body>
</html>