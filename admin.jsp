
<%@page import="com.learn.cotton_crafts_2.entities.User"%>
<%@page import="com.learn.cotton_crafts_2.dao.CategoryDao"%>
<%@page import="com.learn.cotton_crafts_2.helper.SessionFactoryProvider"%>
<%@page import="com.learn.cotton_crafts_2.dao.ProductDao"%>
<%@ page import="java.util.List" %>
<%@page import="com.learn.cotton_crafts_2.entities.Category"%>

<%
    User user =(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message","You are logged in !!");
        response.sendRedirect("login.jsp");
        return;
}else
{
    if(user.getUserType().equals("normal user"))
    {
        session.setAttribute("message","You are not admin");
        response.sendRedirect("login.jsp");
        
        return;
    }
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cotton Crafts: Admin</title>
        <%@ include file="component/all_css.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="component/message.jsp" %>
            </div>
            <div class="row mt-3">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="Image/man.png" alt="user_icon">
                            </div>
                            
                            <h1 class="text-uppercase text-muted"> Users </h1>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="Image/list.png" alt="user_icon">
                            </div>
                            <h1 class="text-uppercase text-muted"> Categories </h1>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 100px" class="img-fluid rounded-circle" src="Image/box.png" alt="user_icon">
                            </div>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            
        </div>
            
        <div class="row mt-3">
            <div class="col-md-6">
                 <div class="card" data-bs-toggle="model" data-bs-target="#add-category-model">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 80px" class="img-fluid rounded-circle" src="Image/plus.png" alt="user_icon">
                            </div>
                            <p class="md-2"> Click here to add new category </p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
            </div>
            
            <div class="col-md-6">
                 <div class="card" data-bs-toggle="model" data-bs-target="#add-product-model">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 80px" class="img-fluid rounded-circle" src="Image/plus.png" alt="user_icon">
                            </div>
                            <p class="md-2">Click here to add new products</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
            </div>
                
        </div>
    </div>
    
    <!-- Button trigger modal -->
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-category-model">
  Category Details
</button>

<!-- Modal -->
<div class="modal fade" id="add-category-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
          
          <form action="ProductOperations" method="Post">
              <input type="hidden" name="operation" value="addcategory">
              <div class="form-group">
                  
                  <input type="text" class="form-control"  placeholder= "Enter Category Title" name="categoryTitle" required/>
              </div><br>
              <div class="form-group">
                  <textarea style="height: 250px;" class="form-control" placeholder="Enter Category Description" name="categoryDescription"></textarea>
                  
              </div>
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Category</button>
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
              
          </form>
      </div>
    </div>
  </div>
</div>
<!--*****************************************************************************************************************-->
<!--product model-->
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-product-model">
  Product Details
</button>

<!-- Modal -->
<div class="modal fade" id="add-product-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="ProductOperations" method="Post" enctype="multipart/form-data">
          <input type="hidden" name="operation" value="addproduct" />
          <div class="form-group">
              <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
          </div><br>
          
          <div class="form-group">
               <textarea style="height: 100px;" class="form-control" placeholder="Enter product description " name="pDesc" required ></textarea>
          </div><br>
          
          <div class="form-group">
              <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />
          </div><br>
          
          
          <div class="form-group">
              <input type="number" class="form-control" placeholder="Enter discount on product" name="pDiscount" required />
          </div>
          
          <div class="form-group">
              <input type="number" class="form-control" placeholder="Enter quantity of product" name="pQuantity" required />
          </div>
          
          
          <%
          CategoryDao cdao = new CategoryDao(SessionFactoryProvider.getFactory());   
          List<Category> list = cdao.getCategories();
         // List<String, Long> l= Helper.getCounts(SessionFactoryProvider.getFactory());
          %>
          <div class="form-group">
              <select name="catId" class="form-control" id="">
                  <%
                                for(Category c: list){   
                  %>
                  <option value="<%=c.getCategoryId()%>"> <%= c.getCategoryTitle()%></option>
                 
                  <% } %>
                  
              </select>  
          </div><br>
          
          <div class="form-group">
              <label for="pPhoto">Select Picture of Product</label><br> 
              <input type="file" id="pPhoto" name="pPhoto" required/> 
          </div><br>
          
          
          <div class="container text-center">
              <button class="btn btn-outline-success">Add Product</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              
          </div>
          
          
          
          </form>
      </div>
      
    </div>
  </div>
</div>


          
          
   
    </body>
    
</html>
