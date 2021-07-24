<%@page import="com.SportyShoes.MODELS.Product"%>
<%@page import="com.SportyShoes.MODELS.User"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.SportyShoes.MODELS.Product"%>
<%@page import="com.SportyShoes.MODELS.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>SportyShoes Customer Dashboard</title>
</head>
<body class="bg-primary">

		<%User u1=(User)request.getSession(false).getAttribute("user_customer");
				String f[];
				String firstname="";
				if(u1==null){
					response.sendRedirect(request.getContextPath()+"/login");
				}else if(!u1.getUser_type().equals("customer")) {
					response.sendRedirect(request.getContextPath()+"/login");
				}
				if(u1!=null)
				{
					f=u1.getUser_Realname().split(" ");
					firstname=f[0];
				}
			%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container-fluid">
            <img class="navbar-brand" src="<%=request.getContextPath()%>/Resources/logo2.png" style="height:3%;width:3%;"/>
            <img class="navbar-brand" src="<%=request.getContextPath()%>/Resources/logotext.gif" style="height:15%;width:15%;"/>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/customer/customer-home" style="font-family: 'Lucida Bright';font-weight:bolder;">Home</a>
                    </li>

 
                    <li class="nav-item">
                       
                    </li>
                </ul>
                <%-- <form action="<%=request.getContextPath()%>/logout" method="post" class="d-flex"> --%>
                
                			<a class="nav-link text-light">Hello, <%=firstname%> &nbsp;</a>		
                    		<a class="btn btn-outline-danger" href="<%=request.getContextPath()%>/logout">Logout</a>
                    
                <!-- </form> -->
            </div>
        </div>
    </nav>
			
			
	<h1></h1>
    <br />
    <br />
    <br />
    <br />
    
    <div class="container" style="width:700px;">
    <div class="shadow-lg p-3 mb-5 bg-dark rounded" align="center">
    <img src="<%=request.getContextPath()%>/Resources/logo2.png" style="height:20%;width:20%;" />
    <img src="<%=request.getContextPath()%>/Resources/logotext.gif" style="height:30%;width:30%;" />
    </div>
    </div>
	
	<br />
    <br />
    <h1 style="text-align: center; color: cornsilk;">Browse And Buy Here</h1>
    <br />
    <br />
    <br />
    <div class="container">
    <table class="table table-borderless table-striped">
    <tbody>
 		<tr>
    				<%List<Product> productlist=(List<Product>)request.getAttribute("productlist");int x=0; for(Product p: productlist) { if(x%4==0) { %> </tr><tr align="center"> <%}%>
    			<td>
    				<div class="card bg-body shadow-lg rounded" style="width: 20rem;background-color: activeborder;">
                        <img src="<%=request.getContextPath()%>/Resources/uploads/<%=p.getProduct_image_name()%>" width="200px" height="160px" class="card-img-top" alt="...">
                        <div class="card-body">
                            <span class="card-text" style="text-align:left;font-size: 20px;">Name : </span><span class="text-primary" style="font-size: 30px;color: black;text-align: center;"><%=p.getProduct_name()%></span>
                            <h5 class="card-text text-center">For : <span class="text-primary" style="font-size: 30px;color: black;"><%=p.getProduct_for()%></span></h5>
                            <h5 class="card-text text-center">Type : <span class="text-primary" style="font-size: 30px;color: black;"><%=p.getProduct_type()%></span></h5>
                            <h5 class="card-text text-center">Price : Rs.<span class="text-primary" style="font-size: 30px;color: black;"><%=p.getProduct_price()%></span></h5>
                            
                            <a class="btn btn-success" data-bs-toggle="modal" data-bs-target="#buy<%=p.getProduct_id()%>" style="font-weight: bold;font-size: 30px">&nbsp;&nbsp;Buy&nbsp;&nbsp;</a>
                        </div>
                    </div>
                </td>
                <div class="modal fade" id="buy<%=p.getProduct_id()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-dark">
									      	<div class="container" align="center">
									        <h5 class="modal-title text-light" id="exampleModalLabel"><b style="font-size:30px">Buy Product</b></h5>
									        </div>
									        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
							      <form action="<%=request.getContextPath()%>/customer/buyproduct" method="post">
									      <div class="modal-body">
									                      
									                      <input type="hidden" name="buyproductid" value="<%=p.getProduct_id()%>">
									                      <%if(u1!=null){ %>
									                      <input type="hidden" name="buyuserid" value="<%=u1.getUser_id()%>">
									                      <%} %>								                      
									                      <div class="container" align="center">
									                      <div class="card bg-body shadow-lg rounded" style="width: 20rem;background-color: activeborder;">
										                        <img src="<%=request.getContextPath()%>/Resources/uploads/<%=p.getProduct_image_name()%>" width="200px" height="160px" class="card-img-top" alt="...">
										                        <div class="card-body">
										                            <span class="card-text" style="text-align:left;font-size: 20px;">Name : </span><span class="text-primary" style="font-size: 30px;color: black;text-align: center;"><%=p.getProduct_name()%></span>
										                            <h5 class="card-text text-center">For : <span class="text-primary" style="font-size: 30px;color: black;"><%=p.getProduct_for()%></span></h5>
										                            <h5 class="card-text text-center">Type : <span class="text-primary" style="font-size: 30px;color: black;"><%=p.getProduct_type()%></span></h5>
										                            <h5 class="card-text text-center">Price : Rs.<span class="text-primary" style="font-size: 30px;color: black;"><%=p.getProduct_price()%></span></h5>
										                            
										                        </div>
										                    </div>
										               		</div>
									      
											</div>
												      <div class="modal-footer bg-dark">
												      		<div class="container" align="center">
													       <button type="submit" class="btn btn-success"><b style="font-size:20px">Confirm Purchase</b></button>
													       <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
													       </div>
												      </div>
										      </form>
												    </div>
												  </div>
												</div>		      
    			<% x++; } %>	
    	</tr>
    </tbody>
    </table>
    </div>			

    
    
    
    <br />
    <br />
    <br />
    <br />
    <br />
    

    <h6 style="text-align:center; color:cornsilk; font-weight:bold">&#64;Project By Saurabh Kawatra</h6>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />













    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    
    <%if(request.getAttribute("purchasedproductidbycustomer")!=null) { int productid=(int)request.getAttribute("purchasedproductidbycustomer");for(Product pro:productlist){if(pro.getProduct_id()==productid){%>
									<div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="purchasedone" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-primary">
									      	<div class="container" align="center">
									        <h5 class="modal-title text-light" align="center" id="exampleModalLabel">Purchase Status</h5>
									        </div>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
												<div class="modal-body">
															<h3 align="center" class="text-success"><b> Product Purchase Successfull!!!</b></h3>
																<br /><br />
																
																<div class="container" align="center">
											                      <div class="card bg-body shadow-lg rounded" style="width: 20rem;background-color: activeborder;">
												                        <img src="<%=request.getContextPath()%>/Resources/uploads/<%=pro.getProduct_image_name()%>" width="200px" height="160px" class="card-img-top" alt="...">
												                        <div class="card-body">
												                            <span class="card-text" style="text-align:left;font-size: 20px;">Name : </span><span class="text-primary" style="font-size: 30px;color: black;text-align: center;"><%=pro.getProduct_name()%></span>
												                            <h5 class="card-text text-center">For : <span class="text-primary" style="font-size: 30px;color: black;"><%=pro.getProduct_for()%></span></h5>
												                            <h5 class="card-text text-center">Type : <span class="text-primary" style="font-size: 30px;color: black;"><%=pro.getProduct_type()%></span></h5>
												                            <h5 class="card-text text-center">Price : Rs.<span class="text-primary" style="font-size: 30px;color: black;"><%=pro.getProduct_price()%></span></h5>
												                            
												                        </div>
												                    </div>
												               	</div>
												               		
												</div>
									<div class="modal-footer bg-light">
										<div class="container" align="center">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><h6>&nbsp;&nbsp;&nbsp;<b style="vertical-align: middle;font-size:120%">OK</b>&nbsp;&nbsp;&nbsp;</h6></button>
								        </div>
								      </div>
								    </div>
								  </div>
								</div>

									 <script>
													window.onload(abc());
													function abc() {
													    var abc=new bootstrap.Modal(document.getElementById('purchasedone'),{keyboard: false});
													    abc.show();
													}
													
									</script>
										<%}}%>
										<%}%>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>