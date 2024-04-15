<%-- 
    Document   : index
    Created on : 07-Jan-2024, 9:34:22 pm
    Author     : AKASH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="blog.helper.ConnectionProvider" %>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
<!--        css-->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 
 
   <!--font-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<!--  own css-->
<link href="Css/style.css" rel="stylesheet" type="text/css"/>

<style>
    .jumbotron{
        clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 69% 92%, 32% 100%, 0 89%, 0 0)
    }
</style>


</head>

<body>
    <!-- <%
            
         Connection con=ConnectionProvider.getConnection();
        %> -->
         
<!--  <h1><%= con %></h1 -->        
        
        
        
<!--    homepage  -->
<!--    Navbar  -->
<%@include file="Normal_navbar.jsp" %>     
     
<!--        main-->

   <!--         Homepage-->

    <div class="container-fluid p-0 m-0">
            <div class="jumbotron Primary-background text-white">
                <div class="container">
                    <h4 class="display-4">Welcome to Tech Blog </h4>

                    <p>
                        Computer programming or coding is the composition of sequences of instructions, called programs, that computers can follow to perform tasks.  It involves designing and implementing algorithms, 
                    </p>
                    <p>
                        typically use high-level programming languages that are more easily intelligible to humans than machine code, which is directly executed by the central processing unit. Proficient programming usually requires expertise in several different subjects, including
                    </p>
                    <button class="btn btn-outline-light btn-lg">  <span class="fa fa-user-plus"></span> Start its Free.. </button>
                    <a href="loginpage.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle-o fa-spin"></span>  Login </a>
                </div>
            </div>

        </div>

        <!--cards-->

        <div class="container" >
<!--    row-1-->
            <div class="row ">
                <div class="col-md-4">

                    <div class="card" style="" > 
<!--                        <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Java programing</h5>
                            <p class="card-text">Some quick example and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary Primary-background text-white">Read more..</a>

                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">

                    <div class="card" style="" > 
<!--                        <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Java programing</h5>
                            <p class="card-text">Some quick example and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary Primary-background text-white">Read more..</a>

                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">

                    <div class="card" style="" > 
<!--                        <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Java programing</h5>
                            <p class="card-text">Some quick example and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary Primary-background text-white">Read more..</a>

                        </div>
                    </div>
                </div>

            </div>
            
            
<!--            row-2-->
            
                   <div class="row mt-2">
                <div class="col-md-4">

                    <div class="card" style="" > 
<!--                        <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Java programing</h5>
                            <p class="card-text">Some quick example and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary Primary-background text-white">Read more..</a>

                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">

                    <div class="card" style="" > 
<!--                        <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Java programing</h5>
                            <p class="card-text">Some quick example and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary Primary-background text-white">Read more..</a>

                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">

                    <div class="card" style="" > 
<!--                        <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <h5 class="card-title">Java programing</h5>
                            <p class="card-text">Some quick example and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary Primary-background text-white">Read more..</a>

                        </div>
                    </div>
                </div>

            </div>
        </div>

















        
        
<!--        js-->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--    own javascript-->
<script src="javascript/javascripted.js" type="text/javascript"></script>
  
    </body>
</html>
