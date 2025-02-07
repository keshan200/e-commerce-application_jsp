<%@ page import="lk.ijse.ecommerceapplication_jsp.entity.user" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: kesha
  Date: 2/4/2025
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


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



<%--view customer details--%>
<div style="width: 100vw;height: 20vh;background-color: black"></div>
<main  id="view-customer-details" style="margin-top: 30px ;">

  <section class="content">
    <div class="card">

      <h5 class="card-header">Featured</h5>
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>

        <a href="customer-list">Reload</a>
      </div>
    </div>

    <%--table--%>
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

</main>

</body>
</html>
