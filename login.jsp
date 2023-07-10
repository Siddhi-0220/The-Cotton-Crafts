<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="component/all_css.jsp"%>
        <style type="text/css">
            .back-img2{
                background: url("Image/home.jpg");
                height: 100vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
         </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
         <div class="container-fluid back-img2">
         <div class="row mt-10">
             <div class="col-md-4 offset-md-4"><br> <br>
                 <div class="card">
                     <div class="card-body px-5">
                         <%@include file="component/message.jsp" %>
                         <h3 class="text-center"> Login here </h3>
                     <form action="LoginServlet" method="post">
                     <div class="form-group">
                        <label for="email" class="form-label">Email</label>
                        <input name="user_email" type="email" class="form-control" id="name" placeholder="Enter your Email-id" aria-describedby="emailHelp">
                    </div>
                     
                     <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input name = "user_password" type="password" class="form-control" id="name" placeholder="Enter your password" aria-describedby="emailHelp">
                     </div><br>
                     
                      <a href="register.jsp" class="text-center d-block mb-2">if not Registered Click here! </a>
                         
                     <div class="container text-center">
                           
                         <button  class="btn btn-success">Login</button>
                         <button  class="btn btn-warning">Reset</button>
                     </div>
                    </form>
                         
                     </div> 
                 </div>
             </div>
         </div>
    </div>
    </body>
</html>
