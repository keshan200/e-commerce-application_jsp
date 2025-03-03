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


                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form class="row g-3" action="product-save" method="post"  enctype="multipart/form-data" id="addProductForm">
                        <div class="col-md-6">
                            <label for="image" class="form-label">Image:</label>
                            <input type="file" class="form-control" id="image" name="itemImage" accept="image/*">
                        </div>

                        <div class="col-md-6">
                            <label for="ProductName" class="form-label">Item Name:</label>
                            <input type="text" class="form-control" id="ProductName" name="productName">
                        </div>

                        <div class="col-12">
                            <label for="description" class="form-label">Description</label>
                            <input type="text" class="form-control" id="description"  name="description">
                        </div>

                        <div class="col-12">
                            <label for="categories" class="form-label">Categories:</label>
                            <select id="categories" class="form-select" name="category">
                                <%
                                    List<Category> catList = (List<Category>) request.getAttribute("categoryNameList");
                                    if (catList != null && !catList.isEmpty()) {
                                        for (Category category : catList) {
                                %>
                                <option class="op" value="<%= category.getId()%>"><%=category.getCategory()%></option>
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



                    <form class="row g-3" id="product-update-form" action="update-product" method="post" enctype="multipart/form-data">

                        <input type="text" id="itemIDU" name="itemIdU">

                        <div class="col-md-6">
                            <label for="imageU" class="form-label">Image:</label>
                            <input type="file" class="form-control" id="imageU" name="itemImageU" accept="image/*">
                        </div>

                        <div class="col-md-6">
                            <label for="ProductNameU" class="form-label">Item Name:</label>
                            <input type="text" class="form-control" id="ProductNameU" name="itemNameU">
                        </div>

                        <div class="col-12">
                            <label for="descriptionU" class="form-label">Description</label>
                            <input type="text" class="form-control" id="descriptionU" name="descU" >
                        </div>

                        <div class="col-12">
                            <label for="categoriesU" class="form-label">Categories:</label>
                            <select id="categoriesU" class="form-select" name="categoryU">

                                <%
                                   List<Category>list = (List<Category>) request.getAttribute("categoryNameList");
                                           if(list != null && !list.isEmpty()){
                                           for (Category category : list) {
                                %>
                                <option class="op"  name="optionU" id="op" value="<%= category.getId()%>"><%=category.getCategory()%></option>
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
                            <label for="materialU" class="form-label">Material</label>
                            <input type="text" class="form-control" id="materialU" name="materialU">
                        </div>

                        <div class="col-md-4">
                            <label for="priceU" class="form-label">Unit Price:</label>
                            <input id="priceU" class="form-control" name="priceU">
                        </div>

                        <div class="col-md-2">
                            <label for="qtyU" class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="qtyU" name="qtyU">
                        </div>


                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>

                    </form>

                </div>

            </div>
        </div>

         <%--delete model--%>
        <form id="deleteForm" action="delete-product" method="post" style="display: none;">
                <input type="hidden" id="itemID" name="itmID">
        </form>


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
                    <td><img src="uploads/<%= product.getItemImage() %>" width="70px" height="70px" style="border-radius: 10px"></td>
                    <td><%=product.getItemName()%></td>
                    <td><%=product.getItemDescription()%></td>
                    <td><%=product.getQuantity()%></td>
                    <td>RS.<%=product.getUnitPrice()%></td>
                    <td><%=product.getMaterial()%></td>
                    <td><%=product.getCategoryID()%></td>
                    <td>
                        <div class="d-flex gap-2">
                            <button data-bs-toggle="modal"
                                    data-bs-target="#updateProductModal"
                                    type="button"
                                    class="btn btn-primary edit-product-btn"

                                    data-id = "<%=product.getId()%>"
                                    data-name="<%= product.getItemName()%>"
                                    data-image="<%=product.getItemImage()%>"
                                    data-desc = "<%=product.getItemDescription()%>"
                                    data-price = "<%=product.getUnitPrice()%>"
                                    data-qty = "<%=product.getQuantity()%>"
                                    data-material = "<%=product.getMaterial()%>"
                                    data-categoty = "<%=product.getCategoryID()%>"
                                                  >
                                Edit
                            </button>

                            <button data-delete = "<%=product.getId()%>" type="button" class="btn btn-danger delete-btn">Delete</button>
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


<script src="assets/lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="assets/script/product-from-alert.js"></script>


</body>
</html>
