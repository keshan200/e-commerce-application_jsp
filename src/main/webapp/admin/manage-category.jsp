<%--
  Created by IntelliJ IDEA.
  User: kesha
  Date: 2/5/2025
  Time: 12:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Category</title>
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
      padding: 13px;
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




    /*add product*/

    .modal-content {
      padding: 30px;
    }

    .modal {
      --bs-modal-width: 751px;
    }

    #add-product-page,#category-manage-page ,#view-customer-details{
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


<div style="width: 100vw;height: 20vh;background-color: black"></div>


<main  id="category-manage-page" style="margin-top: 30px ;">

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

    <%--add model--%>
    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addCategoryModalLabel">Add New Categories</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <form class="row g-3" action="category-save" method="post" enctype="multipart/form-data">

            <div class="col-md-6">
              <label for="cat-img" class="form-label">Category Image:</label>
              <input type="file" class="form-control" id="cat-img" accept="image/*" name="categoryImage">
            </div>

            <div class="col-md-4">
              <label for="category" class="form-label">Category</label>
              <input id="category" class="form-control" type="text" name="categoryName" >
            </div>

            <div class="col-12">
              <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
          </form>

        </div>
      </div>
    </div>

   <%--update model--%>
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

   <%--table--%>
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

</main>


</body>
</html>
