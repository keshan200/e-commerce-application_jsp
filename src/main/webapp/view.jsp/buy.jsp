<%--
  Created by IntelliJ IDEA.
  User: kesha
  Date: 2/3/2025
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>buy-now</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Edu+SA+Beginner:wght@500&family=Figtree:wght@300..900&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Lexend:wght@300&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playwrite+IN:wght@100..400&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="../assets/styles/buy-now.css">
</head>
<body>

<main id="buy-now-page">

    <main class="buy-now-container">

        <section class="buynow-section">

            <section class="buynow-image-container">
                <img src="../assets/img/mirror.jpg" class="buynow-image">
            </section>

            <section class="text">

                <h1 class="product-name">LUNA CHAIR</h1>

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




</body>
</html>
