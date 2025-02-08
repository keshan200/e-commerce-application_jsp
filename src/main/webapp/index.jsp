<%@ page import="lk.ijse.ecommerceapplication_jsp.entity.user" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>

  <meta name="keywords" content="html, css, javaScript">
  <meta name="author" content="Keshan Silva">
  <meta name="viewport" content="width=device-width, initial-scale=1">



  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Edu+SA+Beginner:wght@500&family=Figtree:wght@300..900&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Lexend:wght@300&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playwrite+IN:wght@100..400&display=swap" rel="stylesheet">


  <link rel="stylesheet" href="assets/styles/normalize.css">

  <link rel="stylesheet" href="assets/styles/index.css">
  <link rel="stylesheet" href="assets/styles/mainHeader.css">
  <link rel="stylesheet" href="assets/styles/categories-section.css">
  <link rel="stylesheet" href="assets/styles/sale-page.css">
  <link rel="stylesheet" href="assets/styles/fearured-product-page.css">
  <link rel="stylesheet" href="assets/styles/about-us-page.css">
  <link rel="stylesheet" href="assets/styles/lates-product-page.css">
  <link rel="stylesheet" href="assets/styles/details-page.css">
  <link rel="stylesheet" href="assets/styles/footer-page.css">


  <link rel="stylesheet" href="assets/styles/buy-now.css">



<%--stye--%>
  <style>
  /*  <div class="d-flex account-sec" style="justify-content: center;align-items: center">
    <img class="acc-img" style="height: 40px;width: 40px;border-radius: 100%" src="assets/img/man.png">
    <h4 class="acc-name" style="color: white;">Keshan,</h4>
    </div>*/

    .account-sec{
      justify-content: center;
      align-items: center;
      gap: 15px;
    }

  .acc-name{
    margin: 0;
    font-size: 1.3rem;
    font-family: 'Lexend', sans-serif;
  }


  </style>


</head>


<body>

<main id="homePage" class="page">

  <header class="header d-flex justify-content-center">
    <nav class="navigation z-2 position-absolute ">

      <ul class="ul">
        <li>Categories</li>
        <li>Shop</li>
      </ul>


      <div class="brand">
        <p class="logo-text">DecoraLux</p>
      </div>

      <ul class="ul">
        <li>Contact</li>
        <li>Login</li>
      </ul>

    </nav>
  </header>



  <main class="home-content  d-flex justify-content-center">

    <section class="home-section-1" style="z-index: 2">
      <div>
        <p class="county">DecoraLUX Furniture Store,SriLanka</p>
      </div>

      <div>
        <p class="home-txt">LUXURY</p>
        <p class="home-txt">FURNITURE</p>
      </div>
    </section>

    <section class="home-section-2 d-flex" style="z-index: 2">

      <div class="home-btn">
        <p class="home-description">Let's create and discover new furniture together.</p>
        <button class="btn btn-light">View new collection</button>
      </div>


      <section class="home-section-3">
        <div>
          <p  class="home-description">At DecoraLUX,we're here to help you and what you love</p>
        </div>

        <div>
          <p  class="home-description">We'll put it all together for you.Free one-on-one design help,in our store or in your home!</p>
        </div>
      </section>

    </section>

  </main>

</main>

<main id="main-header" class="active">

  <header class="navbar">

    <p class="brand">DecoraLUX</p>

    <nav id="main-nav" class="navbar">

      <ul class="nav-list">
        <li class="nav-item"><a href="admin.jsp" class="nav-link">Categories</a></li>

        <ul class="dropdown">
          <li><a href="#">Category 1</a></li>
          <li><a href="#">Category 2</a></li>
          <li><a href="#">Category 3</a></li>
          <li><a href="#">Category 4</a></li>
        </ul>


        <li class="nav-item"><a href="" class="nav-link">About Us</a></li>
        <li class="nav-item"><a href="" class="nav-link">New Arrival</a></li>
      </ul>
    </nav>

    <div>
      <input type="text" class="search-bar">
    </div>


    <%
      HttpSession sessions = request.getSession(false);
      lk.ijse.ecommerceapplication_jsp.entity.user loggedInUser = null;

      if (sessions != null) {
        Object sessionUser = session.getAttribute("user");
        if (sessionUser instanceof lk.ijse.ecommerceapplication_jsp.entity.user) {
          loggedInUser = (lk.ijse.ecommerceapplication_jsp.entity.user) sessionUser;
        }
      }
    %>

    <% if (loggedInUser != null) { %>
    <div class="header-image" style="display: flex;gap: 60px">
      
        <div class="d-flex account-sec">
          <img class="acc-img" style="height: 40px;width: 40px;border-radius: 100%" src="assets/img/man.png">

          <p class="acc-name" style="color: white;">Keshan,</p>
        </div>

      <a href="" class="position-relative">
        <img src="assets/img/shop.png" alt="Inbox" class="img-fluid" style="width: 35px; height: auto;">
        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
           99+
             <span class="visually-hidden">unread messages</span>
           </span>
      </a>


      <% } else { %>


      <div class="button-group">
        <a href="admin.jsp" style="color: white"><img class="admin" src="assets/img/admin.png"></a>

        <a href="customer-register.jsp" type="submit" class="btnH register-btn" style="z-index: 1">Register</a>
        <a href="" class="btnH login-btn" style="z-index: 1">Login</a>
      </div>

      <% } %>
    </div>




  </header>

</main>

<main id="sale-page" class="page">

  <div><h1 class="products-page-Title">DecoraLUX SALE</h1></div>
  <section class="sale-section">

    <div class="sale-item">
      <img src="assets/img/mirror.jpg" alt="Product 1" class="sale-img">
      <div class="sale-info">
        <p class="discount">-30%</p>
        <h2>Luna Chair</h2>
      </div>
    </div>

    <div class="sale-item">
      <img src="assets/img/chair.jpg" alt="Product 1" class="sale-img">
      <div class="sale-info">
        <p class="discount">-30%</p>
        <h2>Luna Chair</h2>
      </div>
    </div>

    <div class="sale-item">
      <img src="assets/img/mirror.jpg" alt="Product 1" class="sale-img">
      <div class="sale-info">
        <p class="discount">-30%</p>
        <h2>Luna Chair</h2>
      </div>
    </div>
  </section>
</main>


<main id="category-page" class="page">

   <main class="category-section">

     <div><h1 class="title" style="color: white!important;margin-bottom: 140px!important;">DISCOVER OUR NEW SETS</h1></div>


     <section class="categories">

       <div class="category">
         <img src="assets/img/living-room.jpg" alt="living-room" class="category-img">
         <div class="category-text">
           <h2>Living Room Set</h2>
           <p>Perhaps the room you spend the most time relaxing in is your living room, and you want it to be comfortable. Combining modern style with comfort is easy.</p>
           <a href="" class="view-more">View more</a>
         </div>
       </div>

       <div class="category">
         <img src="assets/img/kitchen-set.avif" alt="kitchen-set" class="category-img">
         <div class="category-text">
           <h2>Kitchen Set</h2>
           <p>Perhaps the kitchen is the room you spend the most time in, and you want it to be comfortable. It's easy to combine modern style and comfort.</p>
           <a href="" class="view-more">View more</a>
         </div>
       </div>

       <div class="category">
         <img src="assets/img/bed-room.jpg" alt="bed-room" class="category-img">
         <div class="category-text">
           <h2>Bed Room Set</h2>
           <p>Perhaps the room you spend the most time relaxing in is your living room, and you want it to be comfortable. Combining modern style with comfort is easy.</p>
           <a href="" class="view-more">View more</a>
         </div>
       </div>




     </section>



   </main>

</main>


<main id="featured-products-page" class="page">

  <div class="products-header">
    <p class="products-page-Title">OUR FEATURED ITEMS</p>
  </div>



  <section class="product-grid">

    <div class="product-container">
      <div class="product-card">
          <img class="product-img" src="" alt="Product 1">

            <div class="product-info">
        <p class="product-name"></p>
        <p class="product-price"></p>
       </div>
            <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Wood Chair</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/mirror.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Mirror</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>





  </section>


</main>


<main id="about-us-page" class="page">

  <main class="content">

    <section class="about-section">

      <p class="title">OUR ADVANTAGES</p>

      <section class="text-section">

        <p class="para">We provide high-quality merchandise, great value, and exceptional customer service. We connect people with products and services in new and unexpected ways. We do our part to create dream homes for all.</p>
        <p class="para">Industry leaders and influencers recognize as one of the most trustworthy retail companies in the, ranking high for both customer and employee satisfaction.</p>

        <div class="count-section">

          <div class="count-cont">
            <p class="count">800+</p>
            <p class="para">Model Finished</p>
          </div>

          <div class="count-cont">
            <p class="count">200+</p>
            <p class="para">Unique assortments</p>
          </div>

          <div class="count-cont">
            <p class="count">30+</p>
            <p class="para">Across the country</p>
          </div>

        </div>
      </section>


    </section>

    <div class="img-section">
      <img class="about-img" src="assets/img/home.webp">
    </div>

  </main>


</main>


<main id="lates-product" class="page">

  <div class="products-header">
    <p class="products-page-Title">OUR FEATURED ITEMS</p>
  </div>

  <section class="product-grid">

    <div class="product-container">

      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">

      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

  </section>


</main>

<%--buy now page usong in single page--%>
<main id="buy-now-page" style="display: none">

  <main class="buy-now-container">

    <section class="buynow-section">

      <section class="buynow-image-container">
        <img src="assets/img/mirror.jpg" class="buynow-image">
      </section>

      <section class="text">

        <h1 class="product-name-buynow">LUNA CHAIR</h1>

        <div class="description-container">
          <p class="description-buynow">
            The Luna Chair is a modern, stylish seating option designed for comfort and aesthetics, often featuring sleek lines and ergonomic support. It's suitable for contemporary living rooms or office spaces.
          </p>
        </div>

        <div class="price-sec">
          <div class="price-section">
            <p class="price-text tit">Price :</p>
            <p class="price-rs num">RS.3500.00</p>
          </div>

          <div class="qty-section">
            <p class="available-qty tit">Available :</p>
            <p class="price-text num">56</p>
          </div>
        </div>

        <div class="qty-container">
          <p class="tit">Quantity</p>
          <input type="number" class="qty">
        </div>

        <div class="button-group-buynow">
          <button class="buy-now-btn b-btn">Buy Now</button>
          <button class="addcart-btn b-btn">Add to Cart</button>
        </div>


      </section>


    </section>

  </main>




</main>


<main id="details" class="active">

  <section class="details-section">

    <div class="details-container">
      <img class="details-logo" src="assets/img/tracking.png" alt="Tracking">
      <p class="type">Order Tracking</p>
      <p class="desc">Track real time your order</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/shipping.png" alt="Shipping">
      <p class="type">Free Shipping</p>
      <p class="desc">you wil love at great low prices</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/payment.png" alt="Payment">
      <p class="type">Flexible Payment</p>
      <p class="desc">pay with multiple payments</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/delivery.png" alt="Delivery">
      <p class="type">Fast Delivery</p>
      <p class="desc">Experience the joy of fast shipping</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/24hours.png" alt="24Hours Customer Support">
      <p class="type">Premium Support</p>
      <p class="desc">Outstanding premium support</p>
    </div>

  </section>


</main>

<main id="footer-page" class="active">

  <footer class="footer-page">

    <section class="footer-image-section">
      <div class="footer-text-section">
        <p class="footer-title">BROWSE MODERN TODAY!</p>
        <p class="footer-desc">Dive into our collection of contemporary furniture and decor,</p>
        <p class="footer-desc">meticulously designed elevate your living spaces</p>
      </div>
    </section>


    <section class="last-footer-page">

      <div>
        <p class="footer-text">DecoraLUX</p>
        <p class="footer-text2">stay informed about new arrivals</p>
      </div>


      <div>
        <p class="address">4523 Roayal Ln.Messa,<br>Sri Lanka</p>
        <p class="ftxt">+(94)774510748</p>
        <p class="ftxt"> decorlux@gmail.com</p>
      </div>


    </section>


  </footer>


</main>









<script src="assets/lib/jquery-3.7.1.min.js"></script>
<script src="assets/script/nav_popup.js"></script>
<script src="assets/script/buy-now-navigate.js"></script>

</body>
</html>