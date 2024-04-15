

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register page</title>

        <!-- css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--font-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--own-css-->
        <link href="Css/style.css" rel="stylesheet" type="text/css"/>

        <!--        banner-->
        <style>
            .jumbotron{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 69% 92%, 32% 100%, 0 89%, 0 0)
            }
        </style> 
    </head>
    <body>


        <!--        navbar-->
        <%@include file="Normal_navbar.jsp" %>

        <main class="Primary-background jumbotron  " style="padding-bottom:90px;">
            <div class="container">

                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center Primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here

                        </div>
                        <div class="card-body">

                            <form id="reg-form" action="RegisteredServlet"  method="post">


                                <div class="form-group">
                                    <label for="User_Name">User Name</label>
                                    <input name="User_name" type="text" class="form-control" id="User_Name" aria-describedby="emailHelp" placeholder="Enter user name...">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="User_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email...">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="User_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your Password....">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select Gender</label>
                                    <br>
                                    <input type="radio"  id="Male" name="Gender" value="Male">Male
                                    <input type="radio"  id="Female" name="Gender" value="Female">Female
                                </div>


    
                                <div class="form-group">
                                    <textarea name="About" class="form-control" id="area" rows="5" placeholder="Enter something about yourself....."> </textarea>
                                </div>

                                <div class="form-check">
                                    <input name="reddis" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions </label>
                                </div>

                                <div class="container text-center " id="loader" style="display:none" >
                                    <span class="	fa fa-refresh fa-3x fa-spin"></span>
                                    <h4>please wait</h4>
                                </div>


                                <br>
                                <div class="continer text-center " id="loader" style="display:none">
                                     <span class="fa fa-refresh fa-spin fa-4x"></span>
                                     <h4> please wait..</h4>
                                </div>
                                
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>

                            </form>


                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>

        </main>





        <!--    javascript  -->
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="javascript/javascripted.js" type="text/javascript"></script>
<!--    <script>
        $(document).ready(function(){
            alert("hello ")
        })
    </script>-->
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js" integrity="sha512-bztGAvCE/3+a1Oh0gUro7BHukf6v7zpzrAb3ReWAVrt+bVNNphcl2tDTKCBr5zk7iEDmQ2Bv401fX3jeVXGIcA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!--        implement ajax to create jaise hi form submit ho homepage chala jaye-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
          <script>
             
             $(document).ready(function(){
            
                 console.log("loaded....");
                 
               $('#reg-form').on('submit' ,function(event){
              
                  event.preventDefault();
              
                  let form = new FormData(this);
                  
                  
                  // send for Register Servlet
                  
                 // console.log(form);
                  
                // hide the submit button
                $("#submit-btn").hide();
                $("#loader").show();
                 $.ajax({
                     
                     url: "RegisteredServlet",
                     type: 'POST',
                     data: form,
                     
                     success: function(data, textStatus ,jqXHR){
                    
                         console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            // check the data 
                      if(data.trim()==='done')
                      {
                          
                      
                         swal("Registration successfully . we are going to Redirect loginpage")
                         .then((value) => {
                         window.location = "loginpage.jsp";
                       });
                       
                       }else
                       {
                         swal(data);
                       }
                     
                         
                         
                     },
                     error: function(jqXHR , textStatus , errorThrown){
                    
//                        console.log(jqXHR);
                           $("#submit-btn").show();
                           $("#loader").hide();
                           
                         swal("something went wrong ... please try again ..")
                       
                     
                    },
                    processData: false,
                    contentType: false
                     
                     
                 });
             });  
        });
             
      </script>



</body>
</html>
