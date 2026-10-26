<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.grocery.entities.product" %>

<%
    product p = (product) request.getAttribute("product");

    if (p == null) {
        response.sendRedirect("product.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Product</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-7">

            <div class="card shadow">

                <div class="card-header bg-primary text-white">

                    <h4 class="mb-0">Edit Product</h4>

                </div>

                <div class="card-body">

                    <form action="UpdateProductServlet" method="post">

                        <!-- Product ID -->

                        <input type="hidden"
                               name="id"
                               value="<%= p.getId() %>">


                        <!-- Product Name -->

                        <div class="mb-3">

                            <label class="form-label">
                                Product Name
                            </label>

                            <input type="text"
                                   name="name"
                                   class="form-control"
                                   value="<%= p.getName() %>"
                                   required>

                        </div>


                        <!-- Price -->

                        <div class="mb-3">

                            <label class="form-label">
                                Price
                            </label>

                            <input type="number"
                                   name="price"
                                   step="0.01"
                                   class="form-control"
                                   value="<%= p.getPrice() %>"
                                   required>

                        </div>


                        <!-- Quantity -->

                        <div class="mb-3">

                            <label class="form-label">
                                Quantity
                            </label>

                            <input type="number"
                                   name="quantity"
                                   class="form-control"
                                   value="<%= p.getQuantity() %>"
                                   required>

                        </div>


                        <!-- Unit -->

                        <div class="mb-3">

                            <label class="form-label">
                                Unit
                            </label>

                            <select name="unit" class="form-select">

                                <option value="Kg"
                                    <%= "Kg".equals(p.getUnit()) ? "selected" : "" %>>
                                    Kg
                                </option>

                                <option value="Gram"
                                    <%= "Gram".equals(p.getUnit()) ? "selected" : "" %>>
                                    Gram
                                </option>

                                <option value="Liter"
                                    <%= "Liter".equals(p.getUnit()) ? "selected" : "" %>>
                                    Liter
                                </option>

                                <option value="ml"
                                    <%= "ml".equals(p.getUnit()) ? "selected" : "" %>>
                                    ml
                                </option>

                                <option value="Piece"
                                    <%= "Piece".equals(p.getUnit()) ? "selected" : "" %>>
                                    Piece
                                </option>

                                <option value="Dozen"
                                    <%= "Dozen".equals(p.getUnit()) ? "selected" : "" %>>
                                    Dozen
                                </option>

                                <option value="Packet"
                                    <%= "Packet".equals(p.getUnit()) ? "selected" : "" %>>
                                    Packet
                                </option>

                                <option value="Bottle"
                                    <%= "Bottle".equals(p.getUnit()) ? "selected" : "" %>>
                                    Bottle
                                </option>

                            </select>

                        </div>


                        <!-- Description -->

                        <div class="mb-3">

                            <label class="form-label">
                                Description
                            </label>

                            <textarea name="description"
                                      class="form-control"
                                      rows="4"
                                      required><%= p.getDescription() %></textarea>

                        </div>


                        <!-- Buttons -->

                        <button type="submit"
                                class="btn btn-success">

                            Update Product

                        </button>

                        <a href="product.jsp"
                           class="btn btn-secondary">

                            Cancel

                        </a>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>