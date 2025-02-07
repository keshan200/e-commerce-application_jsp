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
      <li><a href="manage-product.jsp" id="manage-product">Manage Products</a></li>
      <li><a href="category-list" id="manage-categories">Manage Categories</a></li>
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


<script src="assets/lib/jquery-3.7.1.min.js"></script>
<script src="assets/script/admin-single-page.js"></script>


</body>
</html>
