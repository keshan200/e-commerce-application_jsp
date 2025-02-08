<%--
  Created by IntelliJ IDEA.
  User: kesha
  Date: 2/8/2025
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>customer-register</title>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Edu+SA+Beginner:wght@500&family=Figtree:wght@300..900&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Lexend:wght@300&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playwrite+IN:wght@100..400&display=swap" rel="stylesheet">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <style>
        body {
            overflow: hidden;
            margin: 0;
            padding: 0;
        }

        #register-form {
            width: 100vw;
            height: 100vh;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #register-form::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: white;
            filter: blur(50%);
            z-index: -1;
        }

        #register-form-content {
            display: flex;
            width: 90vw;
            height: 90vh;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            z-index: 1000;
        }

        .register-img-section {
            flex: 1;
            position: relative;
            overflow: hidden;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .register-img-section video {
            position: absolute;
            top: 0;
            left: 0;
            width: 80%;
            height: 100%;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;


        }

        .form-section {
            flex: 1;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 50px;
        }
        .form{
            width: 35vw;
        }

        .reg-title{

            font-size: 3.5rem;
            color: black;
            font-weight: bold;
            font-family: "Inter", serif;
        }

        .form-control{
            padding: .660rem .75rem!important;
            background-color: #f5f5f5
        ;
        }

        .btnSI{
            width: 300px;
            text-align: center;
            background-color: black;
            color: white;
            font-family: "Inter", serif;
            border-radius: 20px;
            padding: 5px;
            margin-top: 20px;
        }

        .line{
            background-color: black;
            width: 200px;
            height: 1px;
        }
        .line-section{
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 5px;
        }

        .t{
            margin: 0;
            font-family: "Inter", serif;
            width: 150px;
            text-align: center;
        }

        .signup{
            display: flex;
            gap: 50px;
        }

        .signup>button{
            width: 230px;
            border: 1px solid black;
            text-align: center;
            background-color: white;
            color: black;
            font-family: "Inter", serif;
            border-radius: 20px;
            padding: 5px;
            font-size: 1.2rem;
        }

        .logo{
            width: 30px;
            height: auto;
            margin-right: 22px;
        }

    </style>


</head>
<body>


<main id="register-form" class="d-flex justify-content-center">


    <main id="register-form-content" style="width: 90vw;height: 90vh;">

        <section class="register-img-section">
            <video autoplay muted loop>
                <source src="assets/mp4/registerFormmp4.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </section>



        <section class="form-section"  style="width: 30vw;background-color: white ;">

             <div>
                 <div class="reg-title">Create new account</div>
                 <p>already have an account?<a href="admin.jsp">Log in</a></p>
             </div>


            <form class="row g-3 form"  action="customer-register" method="post">

                <div class="col-md-6">
                    <input type="text" class="form-control" id="fname" name="firstname" placeholder="First name" required>
                </div>

                <div class="col-md-6">
                    <input type="text" class="form-control" id="lname" name="lastname" placeholder="Last name" required>
                </div>

                <div class="col-12">
                    <input type="email" class="form-control" id="email" name="email" placeholder="example@gmail.com" required>
                </div>

                <div class="col-12">
                    <input type="password" class="form-control" id="pass" name="password" placeholder="password" required minlength="6">
                </div>

                <div style="display: flex;flex-direction: column">
                    <button type="submit" class="btnSI">Creat account</button>

                    <section class="line-section" style="margin-top: 30px">
                        <div class="line"></div><p class="t">or register with</p><div class="line"></div>
                    </section>
                </div>
            </form>


            <div class="signup">
                <button type="submit" class=""><img class="logo" src="assets/img/google.png">Google</button>
                <button type="submit" class=""><img class="logo" src="assets/img/apple.png">Apple</button>
            </div>

        </section>


    </main>


</main>









<script src="assets/lib/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
