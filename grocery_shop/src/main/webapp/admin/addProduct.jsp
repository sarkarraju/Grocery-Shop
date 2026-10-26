<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product page</title>

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
                <span class="fa fa-plus-circle fs-1"></span>
                <p>Add Products</p>
              </div>
                       
              
              <div class="card-body ">
                <form action="addProductServlet" method="post" enctype="multipart/form-data">
                  <div class="mb-3">
                    <label for="productName" class="form-label">Product name:</label>
                    <input name="product" required
                      type="text"
                      class="form-control"
                      id="exampleInputProduct"
                      
                    />
                    
                  </div>
                  <div class="mb-3">
                    <label for="productPrice" class="form-label">Price:</label>
                    <input name="price" required  type="number" class="form-control " id="exampleInputPrice" />
                  </div>
                  
                  <div class="mb-3">
                    <label for="productQuantity" class="form-label">Quantity:</label>
                    <input name="qty" required  type="number" class="form-control " min="1" id="exampleInputQty" />
                  </div>
                  
                  <div class="mb-3">
    <label class="form-label">Unit:</label>

    <select name="unit" class="form-select" required>
        <option value="">Select Unit</option>
        <option value="Kg">Kg</option>
        <option value="Gram">Gram</option>
        <option value="Liter">Liter</option>
        <option value="ml">ml</option>
        <option value="Piece">Piece</option>
        <option value="Dozen">Dozen</option>
        <option value="Packet">Packet</option>
        <option value="Bottle">Bottle</option>
    </select>
</div>
                  <div class="mb-3"> <label class="form-label">Description</label> <textarea name="description" class="form-control" rows="4" placeholder="Enter product description" required></textarea> </div>
                  
                  
                  <div class="mb-3"> <label class="form-label">Product Image</label> <input type="file" name="image" class="form-control"> </div>
                <div class="d-flex justify-content-center">
    <button type="submit" class="btn btn-primary">
        Add
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