<%@ page import="lk.ijse.ecommerceapplication_jsp.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapplication_jsp.entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: kesha
  Date: 2/5/2025
  Time: 12:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage-product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <style>
         .modal-content {
             padding: 30px;
         }

         .modal {
             --bs-modal-width: 751px;
         }

         #add-product-page{
             display: flex;
             width: 100vw;
             flex-direction: column;
             justify-content: center;
             align-items: center;
         }

         .content{
             width: 95vw;
         }

         thead {
             position: sticky;
             top: 0;
             background: #f8f9fa; /* Light background for the header */
             z-index: 2; /* Ensure it appears above the rows */
         }
     </style>

</head>
<body>


<main  id="add-product-page" style="margin-top: 30px;">

    <section class="content">

        <%--card--%>
        <div class="card">
            <h5 class="card-header">Featured</h5>
            <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>

                <div class="">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">Add New Product</button>
                </div>
            </div>
        </div>


        <%--add model--%>
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">

                    <a href="category-name-list">Reload</a>

                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form class="row g-3" action="product-save" method="post"  enctype="multipart/form-data">
                        <div class="col-md-6">
                            <label for="image" class="form-label">Image:</label>
                            <input type="file" class="form-control" id="image" name="itemImage" accept="image/*">
                        </div>

                        <div class="col-md-6">
                            <label for="ProductName" class="form-label">Item Name:</label>
                            <input type="text" class="form-control" id="ProductName">
                        </div>

                        <div class="col-12">
                            <label for="description" class="form-label">Description</label>
                            <input type="text" class="form-control" id="description" >
                        </div>

                        <div class="col-12">
                            <label for="categories" class="form-label">Categories:</label>
                            <select id="categories" class="form-select">
                                <%
                                    List<Category> catList = (List<Category>) request.getAttribute("categoryNameList");
                                    if (catList != null && !catList.isEmpty()) {
                                        for (Category category : catList) {
                                %>
                                <option value="<%= category.getId() %>"><%=category.getCategory()%></option>
                                <%
                                    }
                                } else {
                                %>
                                <option value="">No categories available</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="inputCity" class="form-label">Material</label>
                            <input type="text" class="form-control" id="inputCity" name="material">
                        </div>

                        <div class="col-md-4">
                            <label for="price" class="form-label">Unit Price:</label>
                            <input id="price" class="form-control" name="productPrice">
                        </div>

                        <div class="col-md-2">
                            <label for="qty" class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="qty" name="qty">
                        </div>


                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Sign in</button>
                        </div>

                    </form>

                </div>

            </div>
        </div>

        <%--update model--%>
        <div class="modal fade" id="updateProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="updateProductModalLabel">Add New Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>



                    <form class="row g-3">

                        <div class="col-md-6">
                            <label for="imageU" class="form-label">Image:</label>
                            <input type="file" class="form-control" id="imageU" name="itemImage" accept="image/*">
                        </div>

                        <div class="col-md-6">
                            <label for="ProductNameU" class="form-label">Item Name:</label>
                            <input type="text" class="form-control" id="ProductNameU">
                        </div>

                        <div class="col-12">
                            <label for="descriptionU" class="form-label">Description</label>
                            <input type="text" class="form-control" id="descriptionU" >
                        </div>

                        <div class="col-12">
                            <label for="categoriesU" class="form-label">Categories:</label>
                            <select id="categoriesU" class="form-select">
                                <option selected>Choose...</option>
                                <option>...</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="materialU" class="form-label">Material</label>
                            <input type="text" class="form-control" id="materialU">
                        </div>

                        <div class="col-md-4">
                            <label for="priceU" class="form-label">Unit Price:</label>
                            <input id="priceU" class="form-control">
                        </div>

                        <div class="col-md-2">
                            <label for="qtyU" class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="qtyU">
                        </div>


                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>

                    </form>

                </div>

            </div>
        </div>

        <%--table--%>
        <div class="table-responsive" style="max-height: 400px; overflow-y: auto; margin-top: 20px;">

            <%
                List<Product> datalist = (List<Product>) request.getAttribute("productList");
                if (datalist != null && !datalist.isEmpty()) {
            %>

            <table class="table table-bordered">
                <thead class="table-light">
                <tr>
                    <th>Item Image</th>
                    <th>Item Name</th>
                    <th>Item Description</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Material</th>
                    <th>Category</th>
                    <th>#Action</th>
                </tr>
                </thead>
                <tbody>

                <%
                    for (Product product : datalist) {
                %>

                <tr>
                    <td><img src="uploads/<%= product.getItemImage() %>" width="70px" height="auto" style="border-radius: 10px"></td>
                    <td><%=product.getItemName()%></td>
                    <td><%=product.getItemDescription()%></td>
                    <td><%=product.getQuantity()%></td>
                    <td>RS.<%=product.getUnitPrice()%></td>
                    <td><%=product.getMaterial()%></td>
                    <td><%=product.getCategoryID()%></td>
                    <td>
                        <div class="d-flex gap-2">
                            <button type="button" class="btn btn-primary">Edit</button>
                            <button type="button" class="btn btn-danger">Delete</button>
                        </div>
                    </td>
                </tr>


                <%}%>
                </tbody>
            </table>
            <%
                } else {
            %>
            <div class="alert alert-warning">
                No products found.
            </div>
            <%
                }
            %>
        </div>


    </section>

</main>

</body>
</html>
