<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">
    <title>JSP - Hello World</title>
</head>
<body>
<div class="half">
    <div class="bg order-1 order-md-2" style="background-image: url('/images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-6">
                    <div class="form-block">
                        <div class="text-center mb-5">
                            <h3>Login to <strong>Airplan</strong></h3>
                            <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
                        </div>
                        <form action="LoginServlet" method="post">
                            <c:if test="${not empty erreurLogin}">
                                <p style="color: red;">${erreurLogin}</p>
                            </c:if>
                            <div class="form-group first">
                                <label for="nomUtilisateur">Username</label>
                                <input type="text" class="form-control" placeholder="your name" id="nomUtilisateur" name="nomUtilisateur" required>
                            </div>
                            <div class="form-group last mb-3">
                                <label for="motDePasse">Password</label>
                                <input type="password" class="form-control" placeholder="Your Password" id="motDePasse" name="motDePasse" required>
                            </div>

                            <div class="d-sm-flex mb-5 align-items-center">
                                <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Remember me</span>
                                    <input type="checkbox" checked="checked"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span>
                            </div>
                            <p>Pas encore inscrit ? <a href="signup.jsp">S'inscrire</a></p>
                            <button type="submit" value="Log In" class="btn btn-block btn-primary" >Log In</button>


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>



<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script></body>
</html>