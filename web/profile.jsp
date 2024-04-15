<%-- 
    Document   : profile
    Created on : 16-Mar-2024, 3:51:58 pm
    Author     : AKASH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="blog.entities.User"%>
<%@page import="blog.servlets.AddPostServlet"%>
<%@page import="blog.entities.Message"%>
<%@page import="blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blog.dao.PostDao"%>
<%@page import="blog.helper.ConnectionProvider"%>

<%@page errorPage="Error_page.jsp" %>
<%
    
User user =(User)session.getAttribute("currentUser");
if(user==null)
{
  response.sendRedirect("loginpage.jsp");
}
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile page</title>

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

        <!--    Navbar  -->

        <nav class="navbar navbar-expand-lg navbar-dark Primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-audio-description"></span>Tech blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Learn programimg Language <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">C language</a>
                            <a class="dropdown-item" href="#">python</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">java programing</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link able" href="#">Contact us</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link able"  data-toggle="modal" data-target="#add-post-modal" >Post</a>
                    </li>



                </ul>


                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link able" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user fa-user-circle "></span><%=user.getName() %></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link able" href="LogoutServlet"><span class="fa fa-user "></span>Logout</a>
                    </li>

                </ul>

            </div>
        </nav>



        <!--        end navbar-->


        <%
           Message m = (Message)session.getAttribute("msg");
           if(m!=null)
           {
        %>

        <div class="alert <%= m.getCssClass() %>" role="alert">
            <%= m.getContent() %>
        </div>
        <%
            session.removeAttribute("msg");
        }
        %>
















        <!--profile model-->
        <!-- Button trigger modal -->
        <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-Modal">
          Launch demo modal
        </button>-->

        <!-- profile Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header Primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel"> Tech Blog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="Pics/<%= user.getProfile()%> "class="image-fluid" style="border-radius: 50%; max-width:100px">
                            <br>
                            <h3 class="modal-title mt-3" id="exampleModalLabel"> <%=user.getName()%></h3>

                            <!--   user           details-->

                            <!--                            hiding for table date-->
                            <div id="profilehide">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%= user.getId() %></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender() %></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Registration-Date :</th>
                                            <td> <%= user.getDatetime().toString() %></td>
                                        </tr>
                                    </tbody>
                                </table>                    
                            </div>
                            <!--<!-- end of profile modal -->




                            <!--                                    profile editing -->
                            <div id="profile-edit" style="display:none">
                                <h6 class="mt-2" style="color:red;">Please Edit Carefully... </h6>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId() %></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" name="user_Name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email"  class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>

                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="text"  class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>

                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender().toUpperCase() %></td>
                                        </tr>

                                        <tr>
                                            <td>About :</td>
                                            <td> <textarea rows="2" class="from-control" name="user_about"><%= user.getAbout()%></textarea></td>
                                        </tr>

                                        <tr>
                                            <td>New Profile-Pic :</td>
                                            <td><input type="file" name="image" class="form-control"></td>
                                        </tr>

                                    </table>

                                    <!--                                        button-->
                                    <div class="container">
                                        <button style="border-radius:12px; width: 25%"  type="submit" name="saveButton" class="Btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>



                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="editprofile" type="button" class="btn btn-primary"> Edit </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- add post modal -->
        
<!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
            Launch demo modal
        </button>-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Provides the post Title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addpost">
                            
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>----Select Category---</option>
                                    <% 
                                    PostDao post = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = post.getAllCategories();
                                      for(Category c:list)
                                    {
                                      
                                    
                                    %>
                                    <option value="<%= c.getCid() %>"><%= c.getName()%> </option>
                                   
                                    <%
                                     }
                                    %>
                                </select>
                            </div>
                           
                            
                            <div class="form-group">
                                <input name="pTitle" type="text"  placeholder="Enter post Title:" class="form-control">
                            </div>
                           
                           
                            
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height:200px" placeholder="Enter your Content:"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height:200px" placeholder="Enter your code....(if any) "></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label>Select your pic...</label>
                                <br>
                                <input type="file" name="Pic">
                            </div>
                            
<!--                            <div class="">
                                <label>Link any social media.</label>
                                <input type="url" name="url">
                            </div>-->
                                <div class="container text-center" >
                                    <button type="submit" class="btn btn-outline-primary" >DO post</button>
                                </div>
                        </form>
                          
                    </div>
                </div>
            </div>
        </div>


        <!-- end post modal -->




        <!--       
        <%= user.getName() %>
        <br>
        <%= user.getEmail() %>
        <br>
        <%= user.getAbout() %>
        -->



        <!--        javascript-->


        <!--        js-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--    own javascript-->
        <script src="javascript/javascripted.js" type="text/javascript"> </script>
<!--        sweet alert-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>




        <script>
            $(document).ready(function () {
                let editstatus = true;

                $('#editprofile').click(function () {
//                   alert("calling complete...");
//                   
                    if (editstatus === false)
                    {
                        $("#profilehide").hide();

                        $("#profile-edit").show();
                        editstatus = true;
                        $(this).text("Back");  // button click second time
                    } else {
                        $("#profilehide").show();

                        $("#profile-edit").hide();
                        editstatus = false;
                        $(this).text("Edit");
                    }




                });
            });


        </script>
        
<!--        now add post js-->
<Script>
 $(document).ready(function (e){
     alert("hello");
     
     $("#addpost").on("submit" , function (event){
         event.preventDefault();
         console.log("heool");
         
         console.log(this);
         
         let form = new FormData(this);
         // now requesting to server
         
         console.log(form);
         
         $.ajax({
             url:"AddPostServlet",
             type:'POST',
             data:form,
             success: function (data , textStatus , jqXHR){
                 // success
                 console.log(data);
                 console.log("helloo");
                 console.log(textStatus,jqXHR);
                 if(textStatus === 'success')
                 {
                     swal("Good job!", "Saved succssfully ..", "success");
                 }
                 else{
                     swal("Error", "Something went wrong try again..", "error");
                 }
                 
                 
             },
             error: function (jqXHR , textStatus , errorThrown){
                 // error
                    swal("Error", "Something went wrong try again ...", "error");
             },
             processData:false,
             contentType:false
             
                     
         });
     });
         
 });
    
</script>
    




    </body>
</html>
