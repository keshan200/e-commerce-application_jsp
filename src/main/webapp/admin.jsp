<%@ page import="lk.ijse.ecommerceapplication_jsp.entity.user" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Dashboard - Incense Stick Ecom</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


  <style>

    header {
      background-color: black;
    }

    body{overflow: hidden}


    nav {
      padding: 1em;
    }

    .nav-list {
      list-style-type: none;
      display: flex;
      justify-content: center;
      gap: 2em;
      margin: 0;
    }

    .nav-list li {
      display: inline-block;
    }

    .nav-list a {
      color: white;
      text-decoration: none;
      font-size: 1.2rem;
      padding: 0.5em 1em;
      display: block;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .nav-list a:hover {
      background-color: #444;
    }

    .admin-navigation{
      display: flex;
      justify-content: space-evenly;
      align-items: center;
    }

    .brand-admin{
      margin: 0;
      font-size: 2rem;
      color: white;
    }

    .welcome-admin-panel{
      width: 100vw;
      display: flex;
      justify-content: center;
      align-items: center;
    }


    .main-content {
       width: 97vw;
      padding: 35px;
    }
    .dashboard-header {
      background-color: #f1f1f1;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      gap: 166px
    }



    @media (max-width: 768px) {
      .nav-list {
        flex-direction: column;
        align-items: center;
      }
    }








  </style>


</head>
<body>


<header>
  <nav class="admin-navigation">
    <p class="brand-admin">DecoraLUX</p>

    <ul class="nav-list">
      <li><a href="#" id="dashboard">Dashboard</a></li>
      <a href="customer-list" id="view-cus-details">View Customer Details</a>
      <li><a href="admin/manage-product.jsp" id="manage-product">Manage Products</a></li>
      <li><a href="admin/manage-category.jsp" id="manage-categories">Manage Categories</a></li>
      <li><a href="#" id="manage-users">Manage Users</a></li>
    </ul>
  </nav>

  <section class="welcome-admin-panel">
    <div class="main-content" id="main-content">
      <div class="dashboard-header d-flex" >
        <div>
        <h1>Welcome Back,ADMIN</h1>
        <p>We're so happy to have you back. Explore your orders, update your profile, and keep track of your favorite incense products.</p>
        </div>

        <img src="assets/img/mirror.jpg" style="width: 93px;height: auto;border-radius: 100px">
      </div>
    </div>
  </section>
</header>




<%--&lt;%&ndash;product Manage page&ndash;%&gt;
<main  id="add-product-page" style="margin-top: 30px;display: none">

  <section class="content">
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

  &lt;%&ndash;add model&ndash;%&gt;
  <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">

    <div class="modal-dialog">

      <div class="modal-content">

        <div class="modal-header">
          <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>



        <form class="row g-3">

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
              <option selected>Choose...</option>
              <option>...</option>
            </select>
          </div>

          <div class="col-md-6">
            <label for="inputCity" class="form-label">Material</label>
            <input type="text" class="form-control" id="inputCity">
          </div>

          <div class="col-md-4">
            <label for="price" class="form-label">Unit Price:</label>
            <input id="price" class="form-control">
          </div>

          <div class="col-md-2">
            <label for="qty" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="qty">
          </div>


          <div class="col-12">
            <button type="submit" class="btn btn-primary">Sign in</button>
          </div>

        </form>

      </div>

    </div>
  </div>

  &lt;%&ndash;update model&ndash;%&gt;
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
    &lt;%&ndash;table&ndash;%&gt;
    <div class="table-responsive" style="max-height: 400px; overflow-y: auto; margin-top: 20px;">
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
              <tr>
          <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
          <td>Sample Item</td>
          <td>A description of the item</td>
          <td>10</td>
          <td>$25.00</td>
          <td>Wood</td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>
              <tr>
                <td><img src="image-path.jpg" alt="Item Image" style="width:50px; height:50px;"></td>
                <td>Sample Item</td>
                <td>A description of the item</td>
                <td>10</td>
                <td>$25.00</td>
                <td>Wood</td>
                <td>Furniture</td>
                <td>
                  <div class="d-flex gap-2">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                  </div>
                </td>
              </tr>



        </tbody>
      </table>
    </div>


  </section>

</main>

&lt;%&ndash;Category Manage Page&ndash;%&gt;
<main  id="category-manage-page" style="margin-top: 30px ;display: none">

  <section class="content">
    <div class="card">
      <h5 class="card-header">Featured</h5>
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>

        <div class="">
          <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">Add New Product</button>
        </div>
      </div>
    </div>

    &lt;%&ndash;add model&ndash;%&gt;
    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addCategoryModalLabel">Add New Categories</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <form class="row g-3">

            <div class="col-md-6">
              <label for="cat-img" class="form-label">Category Image:</label>
              <input type="file" class="form-control" id="cat-img" accept="image/*">
            </div>

            <div class="col-md-4">
              <label for="category" class="form-label">Category</label>
              <input id="category" class="form-control" type="text">
            </div>

            <div class="col-12">
              <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
          </form>

        </div>
      </div>
    </div>

    &lt;%&ndash;update model&ndash;%&gt;
    <div class="modal fade" id="updateCategoryModal" tabindex="-1" aria-labelledby="updateCategoryModalLabel" aria-hidden="true">

      <div class="modal-dialog">

        <div class="modal-content">

          <div class="modal-header">
            <h5 class="modal-title" id="updateCategoryModalLabel">Add New Categories</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <form class="row g-3">

            <div class="col-md-6">
              <label for="cat-imgU" class="form-label">Category Image:</label>
              <input type="file" class="form-control" id="cat-imgU" accept="image/*">
            </div>

            <div class="col-md-4">
              <label for="categoryU" class="form-label">Category</label>
              <input id="categoryU" class="form-select" type="text">
            </div>

            <div class="col-12">
              <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
          </form>

        </div>

      </div>
    </div>

    &lt;%&ndash;table&ndash;%&gt;
    <div class="table-responsive" style="max-height: 400px; overflow-y: auto; margin-top: 20px;">
      <table class="table table-bordered">
        <thead class="table-light">
        <tr>
          <th>Category Image</th>
          <th>Category Name</th>
          <th>#Action</th>
        </tr>
        </thead>
        <tbody>

        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="category1.jpg" alt="Category 1" style="width:50px; height:50px;"></td>
          <td>Furniture</td>
          <td>
            <div class="d-flex gap-2">
              <button type="button" class="btn btn-primary">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </div>
          </td>
        </tr>



        </tbody>
      </table>
    </div>


  </section>

</main>--%>
<%--view customer details--%>
<%--<main  id="view-customer-details" style="margin-top: 30px ;display: none">

  <section class="content">
    <div class="card">

      <h5 class="card-header">Featured</h5>
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>

        <a href="customer-list">Reload</a>
      </div>
    </div>

    &lt;%&ndash;table&ndash;%&gt;
    <div class="table-responsive" style="max-height: 400px; overflow-y: auto; margin-top: 20px;">

      <%
        List<user> datalist = (List<user>) request.getAttribute("customerList");
        if (datalist != null && !datalist.isEmpty()) {
      %>


      <table class="table table-bordered">
        <thead class="table-light">
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Address</th>
          <th>Telephone</th>
          <th>Email</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>

        <%
          for (user customerDTO : datalist) {
        %>
        <tr>
          <td><%= customerDTO.getFirstName() %></td>
          <td><%= customerDTO.getLastName() %></td>
          <td><%= customerDTO.getAddress() %></td>
          <td><%= customerDTO.getTelephone() %></td>
          <td><%= customerDTO.getEmail() %></td>
          <td><%= customerDTO.getAccountType() %></td>
          <td>
            <button class="btn btn-sm btn-danger">Deactivate </button>
          </td>
        </tr>

        <%
          }
        %>


        </tbody>
      </table>
      <%
      } else {
      %>
      <div class="alert alert-warning">
        No customers found.
      </div>
      <%
        }
      %>
    </div>


  </section>

</main>--%>


<script src="assets/lib/jquery-3.7.1.min.js"></script>
<script src="assets/script/admin-single-page.js"></script>


</body>
</html>
