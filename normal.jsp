

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.learn.cotton_crafts_2.entities.Product" %>
<%@page import="com.learn.cotton_crafts_2.entities.Category" %>
<%@page import="com.learn.cotton_crafts_2.dao.ProductDao" %>
<%@page import="com.learn.cotton_crafts_2.dao.CategoryDao"%>
<%@page import="com.learn.cotton_crafts_2.dao.ProductDao"%>
<%@page import="com.learn.cotton_crafts_2.helper.SessionFactoryProvider"%>
<%@ page import="java.util.List" %>

<%
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("warning_message","You are not logged in !!Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("admin user"))
        {
            session.setAttribute("warning_message","You are normal user !! Do not access this page ");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cotton Crafts: Normal user</title>
        <%@ include file="component/all_css.jsp" %>
    </head>
    <body>
        <%@ include file="component/navbar.jsp" %>
        <div class="container">
        <div class="row mt-3">
            
            
            <% 
                String cat= request.getParameter("category");
                //out.println(cat);
                
               
                ProductDao dao = new ProductDao(SessionFactoryProvider.getFactory());
                List<Product> list = dao.getAllProducts();
                if(cat!=null)
                {
                if (cat.trim() .equals("all")) {
                        list = dao.getAllProducts();
                }
                else 
                {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                }
            }
                
                CategoryDao cdo = new CategoryDao(SessionFactoryProvider.getFactory());
                List<Category> clist = cdo.getCategories();
            %>
            <!--show categories-->
            
            <div class="col-md-2">
                
                <div class="list-group">
                    <a href="normal.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                        All Products
                    </a>
            <%
                for (Category c : clist)
                {
            %>
             <a href="normal.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action">
                 <%=c.getCategoryTitle()%>       
             </a>    
            <%
                }
            %>
                 </div>
            </div>
          
            <!--show products-->
            
            <div class="col-md-10">
                
                <div class="row mt-4">
                    
                    <div class="col-md-12">
                         
                        <div class="card-columns">
                            <%
                              for(Product p:list){  
                            %>
                            <div class="card product-card">
                                <div class ="container text center">
                                <img src="Image/products/<%= p.getpPhoto() %>"  style="max-height: 270px;max-width:100%;width: auto;" class="card-img-top m-2" alt="">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title"><%=p.getpName() %></h4>
                                    
                                    <p class="card-text">
                                        <%=p.getpDesc()%>
                                    </p>
                                </div>
                                    <div class="card-footer">
                                        <button class="btn btn-warning text-white" onclick="add_to_cart(<%=p.getPid()%>,<%=p.getpName()%>,<%=p.getPriceAfterApplyDiscount()%>)">Add to Cart</button>
                                        <button class="btn btn-outline-primary">&#8377;<%= p.getPriceAfterApplyDiscount()%> <span class="discount-label"> <s>&#8377;<%=p.getpPrice()%> </s><%= p.getpDiscount()%>%off </span></button>
                                    </div>
                            </div>
                            <%  }
                                if(list.size()==0){
                                out.println("<h2> No item in this Category... </h2>");
                                }
                            %>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
        </div> 
              <!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">My Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          <div class="cart-body">
              
              
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    </body>
</html>
