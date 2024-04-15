<%-- 
    Document   : Error_page
    Created on : 15-Feb-2024, 3:27:03 am
    Author     : AKASH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error page</title>
        
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
        <div class="container text-center" id="hp">
            <img src="image/error.png" alt="photo" class="img-fluid"/>
            <h3 class="display-3">Something went wrong !</h3>
            <%= exception %> 

             <div class="">
                <a href="index.jsp" class="btn primary-background btn-lg text-Blue mt-2"> Home </a>
             </div>

        </div>
   
    </body>
</html>
