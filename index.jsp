
<%@page import="com.learn.cotton_crafts_2.helper.SessionFactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cotton Crafts: Home</title>
        <%@include file="component/all_css.jsp" %>
        <style type="text/css">
            .back-img{
                background: url("Image/home2.jpg");
                height: 80vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
       
    </head>
    <body>
        <%--<h1>Creating Session factory</h1>
        <%
         out.println("Factory  " + SessionFactoryProvider.getFactory()+"<br>"); 
         out.println("Factory  " + SessionFactoryProvider.getFactory()+"<br>"); 
         out.println("Factory  " + SessionFactoryProvider.getFactory()+"<br>"); 
        %>--%>
        
         <%@include file="component/navbar.jsp" %>
       <div class="container-fluid back-img">
           <h2 class="text-center text-primary"> The Cotton Crafts for Anannya</h2>
       </div>
      
    </body>
</html>
