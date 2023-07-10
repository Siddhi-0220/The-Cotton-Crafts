<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New user</title>
        
           <%@include file="component/all_css.jsp"%>
    </head>
    <body>
        
         <%@include file="component/navbar.jsp" %>
         <style type="text/css" >
            .back-img2{
                background: url("Image/home.jpg");
                height: 100vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
         </style>
       
         <div class="container-fluid back-img2"><br><br>
         <div class="row mt-10">
             <div class="col-md-4 offset-md-4">
                 <div class="card">
                     <div class="card-body px-5">
                         <h3 class="text-center"> Sign-up here </h3>
                     <form action="RegisterServlet" method="post">
                          <%@include file="component/message.jsp" %>
                     <div class="form-group">
                        <label for="name" class="form-label">Name</label>
                        <input  name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name" aria-describedby="emailHelp">
                     </div>
                     
                     <div class="form-group">
                        <label for="email" class="form-label">Email</label>
                        <input name="user_email" type="email" class="form-control" id="name" placeholder="Enter your Email-id" aria-describedby="emailHelp">
                    </div>
                     
                     <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input name = "user_password" type="password" class="form-control" id="name" placeholder="Enter your password" aria-describedby="emailHelp">
                    </div>
                     
                     <div class="form-group">
                        <label for=" " class="form-label">User Address</label>
                        <textarea name="user_address" class="form-control"  placeholder="Enter your address" ></textarea>
                     </div><br>
                     
                     <div class="container text-center">
                         <button class="btn btn-success">Register</button>
                        
                         <button class="btn btn-warning">Reset</button>
                     </div>
                    </form>
                         
                     </div> 
                    
                 </div>
             </div>
         </div>
    </div>
    </body>
</html>
