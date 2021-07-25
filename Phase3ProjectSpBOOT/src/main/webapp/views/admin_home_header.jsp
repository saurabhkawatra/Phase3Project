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

    <title>SportyShoes Admin Dashboard</title>
</head>
<body style="background-color:dodgerblue;">

	<%User u1=(User)request.getSession(false).getAttribute("user_admin");
		String f[];
		String firstname="";
		if(u1==null){
			response.sendRedirect(request.getContextPath()+"/login");
		}else if(!u1.getUser_type().equals("admin")) {
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
                        <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/admin/admin-home" style="font-family: 'Lucida Bright';font-weight:bolder;">Home</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: 'Copperplate Gothic';font-weight:bold;">
                            Products
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#addproduct">Add Product</a></li>
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#removeproduct">Remove Product</a></li>
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#updateexistingproduct">Update Existing Product</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#showallproducts">Show All Products</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: 'Copperplate Gothic';font-weight:bold;">
                            Customers
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#searchcustomer">Search Customer</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/admin/showCustomers">Show All Customers</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-family: 'Copperplate Gothic';font-weight:bold;">
                            Purchase Reports
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#searchpurchase">Search Purchases</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/admin/showPurchases">Show All Purchases</a></li>
                        </ul>
                    </li>

                    

                    <li class="nav-item">
                       
                    </li>
                </ul>
                <%-- <form action="<%=request.getContextPath()%>/logout" method="post" class="d-flex"> --%>
                
                			<a class="nav-link text-primary" href="" data-bs-toggle="modal" data-bs-target="#changepassword" style="font-family:'Copperplate Gothic';font-weight:bolder;">Change Login<br/>&nbsp;&nbsp;&nbsp;&nbsp;Password</a>
                			<a class="nav-link text-light">Hello, <%=firstname%> &nbsp;</a>		
                    		<a class="btn btn-outline-danger" href="<%=request.getContextPath()%>/logout">Logout</a>
                    
                <!-- </form> -->
            </div>
        </div>
    </nav>
    
    <div class="modal fade" id="changepassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-secondary">
									        <h5 class="modal-title text-light" id="exampleModalLabel"><b>Change Login Password</b></h5>
									        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
							      <form action="<%=request.getContextPath()%>/admin/changePassword" method="post">
									      <div class="modal-body bg-dark">
												        
												        
												        <p class="text-center text-light"><b>Enter Current Password</b></p>
												        <div class="container">
												        <div class="col-10 offset-1">
														<input style="text-align: center;" name="oldpassword" type="password" class="form-control" placeholder="Current Password" required="required">
														</div>
														</div>
														<br />
														<p class="text-center text-light"><b>Enter New Password</b></p>
														<div class="container">
												        <div class="col-10 offset-1">
														<input style="text-align: center;" name="newpassword" type="password" id="chpassx1234" class="form-control" placeholder="New Password" required="required">
														</div>
														</div>
														
														
												        	
															
									      </div>
								      <div class="modal-footer bg-secondary">
									       <button type="submit" class="btn btn-primary">Change Password</button>
									       <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
								      </div>
						      </form>
								    </div>
								  </div>
								</div>
    
    
    
    
    
    <div class="modal fade" id="addproduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-secondary">
									        <h5 class="modal-title text-light" id="exampleModalLabel">Add New Product</h5>
									        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
							      <form action="<%=request.getContextPath()%>/admin/addproduct" enctype="multipart/form-data" method="post">
									      <div class="modal-body">
												        
												        	<div class="mb-3">
															Product Name
															<input name="product_name" type="text" placeholder="Enter Product Name" class="form-control" required="required">
															</div>
															<div class="mb-3">
															Select Product Type
															<select name="product_type" class="form-select" required="required">
															<option value="">Select</option>
															<option value="Casual">Casual</option>
															<option value="Sports">Sports</option>
															<option value="Trendy">Trendy</option>
															<option value="Traditional">Traditional</option>
															<option value="Office Wear">Office Wear</option>
															</select>
															</div>
															<div class="mb-3">
															Select Product For
															<select name="product_for" class="form-select" required="required">
															<option value="">Select</option>
															<option value="Men">Men</option>
															<option value="Women">Women</option>
															<option value="Children">Children</option>
															</select>
															</div>
															<div class="mb-3">
															Upload Product Image (Optional)
															<input type="file" name="imagefile" class="form-control">
															</div>
															<div class="mb-3">
															Product Price
															<input name="product_price" type="number" min="0" max="2147483647" class="form-control" required="required">
															</div>
															
									      </div>
								      <div class="modal-footer bg-secondary">
									       <button type="submit" class="btn btn-primary">Add Product</button>
									       <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
								      </div>
						      </form>
								    </div>
								  </div>
								</div>
								
								
								
								
	<div class="modal fade" id="removeproduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <div class="modal-header bg-danger sticky-top">
		      	<div class="container" align="center">
		        <h5 class="modal-title text-light" id="exampleModalLabel" style="font-weight: bold; font-family: Copperplate Gothic;">Remove Product</h5>
		        </div>
		        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
      <form action="<%=request.getContextPath()%>/admin/removeproducts" method="post">
		      <div class="modal-body">
					        
					        	<table class="table table-danger table-striped" style="text-align: center;">
					        		<thead class="sticky-top table-dark" style="top:63px"><tr><th>Select here</th><th>Product Id</th><th>Product Name</th><th>Product Type</th><th>Product For</th><th>Product Image</th><th>Product Price</th></tr></thead>
					        		
					        		<tbody>
					        											
					        											<%
					        					List<Product> productlist=new ArrayList<>();
					        					productlist=(List<Product>)request.getAttribute("productlist");
					        							for(Product p:productlist){
					        											%>
					        				<tr style="vertical-align: middle;"><td><input class="form-check-input" name="rem_products" value="<%=p.getProduct_id()%>" type="checkbox"></td><td><%=p.getProduct_id()%></td><td><%=p.getProduct_name()%></td><td><%=p.getProduct_type()%></td><td><%=p.getProduct_for()%></td><td><img src="<%=request.getContextPath()%>/Resources/uploads/<%=p.getProduct_image_name()%>" width="200px" height="100px"><p><%=p.getProduct_image_name()%></p></td><td><%=p.getProduct_price()%></td></tr>
					        				  <%}%>
					        		</tbody>
					        	
					        	
					        	
					        	</table>
								
		      </div>
	      <div class="modal-footer bg-light">
	      		<div class="container" align="center">
		       <button type="submit" class="btn btn-outline-danger">Remove Selected Products</button>
		       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
		       </div>
	      </div>
     </form>
	    </div>
	  </div>
	</div>
	
	
	
	
	
	
	<div class="modal fade" id="updateexistingproduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <div class="modal-header bg-success sticky-top">
		      	<div align="center" class="container">
		        <h5 class="modal-title text-light" id="exampleModalLabel" style="font-weight: bold;font-family: Copperplate Gothic;">Update A Product</h5>
		        </div>
		        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
					        
					        	<table class="table table-success table-striped" style="text-align: center;">
					        		<thead class="sticky-top table-dark" style="top:63px"><tr><th>Product Id</th><th>Product Name</th><th>Product Type</th><th>Product For</th><th>Product Image</th><th>Product Price</th><th></th></tr></thead>
					        		
					        		<tbody>
					        		
					        											<%
					        							for(Product p:productlist){
					        											%>
					        											
					        				<tr style="vertical-align: middle;"><td><%=p.getProduct_id()%></td><td><%=p.getProduct_name()%></td><td><%=p.getProduct_type()%></td><td><%=p.getProduct_for()%></td><td><img src="<%=request.getContextPath()%>/Resources/uploads/<%=p.getProduct_image_name()%>" width="200px" height="100px"><p><%=p.getProduct_image_name()%></p></td><td><%=p.getProduct_price()%></td><td><a class="btn btn-outline-success" href="<%=request.getContextPath()%>/admin/updateproduct/<%=p.getProduct_id()%>">Update</a></td></tr>                                                                                                
					        						
					        				 							 <%}%>
					        		</tbody>
					        	
					        	
					        	
					        	</table>
					        		
		      </div>
	      <div class="modal-footer bg-light">
	      		<div class="container" align="center">
		       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">&nbsp;&nbsp;OK&nbsp;&nbsp;</button>
		       </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	<div class="modal fade" id="showallproducts" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <div class="modal-header bg-secondary sticky-top">
		      	<div align="center" class="container">
		        <h5 class="modal-title text-light" id="exampleModalLabel" style="font-weight: bold;font-family: Copperplate Gothic;">List of all Products</h5>
		        </div>
		        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
					        
					        	<table class="table table-success table-striped" style="text-align: center;">
					        		<thead class="sticky-top table-dark" style="top:63px;vertical-align: middle;"><tr><th>Product Id</th><th>Product Name</th><th>Product Type</th><th>Product For</th><th>Product Image</th><th>Product Price</th></tr></thead>
					        		
					        		<tbody>
					        											
					        											<%
					        							for(Product p:productlist){
					        											%>
					        				<tr style="vertical-align: middle;"><td><%=p.getProduct_id()%></td><td><%=p.getProduct_name()%></td><td><%=p.getProduct_type()%></td><td><%=p.getProduct_for()%></td><td><img src="<%=request.getContextPath()%>/Resources/uploads/<%=p.getProduct_image_name()%>" width="200px" height="100px"><p><%=p.getProduct_image_name()%></p></td><td><%=p.getProduct_price()%></td></tr>
					        				  <%}%>
					        		</tbody>
					        	
					        	
					        	
					        	</table>
								
		      </div>
	      <div class="modal-footer bg-light">
	      		<div class="container" align="center">
		       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">&nbsp;&nbsp;OK&nbsp;&nbsp;</button>
		       </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<div class="modal fade" id="searchcustomer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-secondary">
									        <h5 class="modal-title text-light" id="exampleModalLabel">Search Customer</h5>
									        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
												        
												        	<div class="accordion accordion-flush" id="accordionFlushExample">
															  <div class="accordion-item">
															    <h2 class="accordion-header" id="flush-headingOne">
															      <button class="accordion-button collapsed text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
															        Search By Customer Name
															      </button>
															    </h2>
															    <form action="<%=request.getContextPath()%>/admin/searchcustomer" method="post">
															    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
																	      <div class="accordion-body">
																	      		
																	      		<input type="hidden" name="method" value="searchbyname">
																		        <label for="inputcustomername54" class="form-label">Customer Name</label>
																				<input type="text" name="customersearchbyname" id="inputcustomername54" class="form-control" placeholder="Enter Name for Search" required="required" aria-describedby="inputnameHelpBlock">
																				<div id="inputnameHelpBlock" class="form-text">Generates Multiple Results..And may not generate any Results..<b>Not Case Sensitive</b>..Results are displayed closest to the input key..</div>    
																		      	<br/><button type="submit" class="btn btn-outline-primary">Search Customer</button>
																	      	
																	      </div>
															    </div>
															    </form>
															  </div>
															  <div class="accordion-item">
															    <h2 class="accordion-header" id="flush-headingTwo">
															      <button class="accordion-button collapsed text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
															        Search By Customer Phone No
															      </button>
															    </h2>
															    <form action="<%=request.getContextPath()%>/admin/searchcustomer" method="post">
															    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
																	      <div class="accordion-body">
																	      		
																	      		<input type="hidden" name="method" value="searchbyphoneno">
																	      		<label for="inputcustomerphone34" class="form-label">Customer Phone No</label>
																				<input type="number" name="customersearchbyphoneno" id="inputcustomerphone34" class="form-control" placeholder="Enter Number for Search" required="required" aria-describedby="inputcustomerphoneHelpBlock">
																				<div id="inputcustomerphoneHelpBlock" class="form-text">Generates Multiple Results(in case where multiple customers have same phone number or have similar pattern or contain input key in them)..And may not generate any Results..<b>Not Case Sensitive</b>..Results are displayed closest to the input key..</div>                    
																		      	<br/><button type="submit" class="btn btn-outline-primary">Search Customer</button>
																	      
																	      </div>
															    </div>
															    </form>
															  </div>
															  <div class="accordion-item">
															    <h2 class="accordion-header" id="flush-headingThree">
															      <button class="accordion-button collapsed text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
															        Search By Customer Username
															      </button>
															    </h2>
															    <form action="<%=request.getContextPath()%>/admin/searchcustomer" method="post">
															    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
															      		<div class="accordion-body">
															      				
															      				<input type="hidden" name="method" value="searchbyusername">
															      				<label for="inputcustomerusername34" class="form-label">Customer Username</label>
																				<input type="text" name="customersearchbyusername" id="inputcustomerusername34" class="form-control" placeholder="Enter Number for Search" required="required" aria-describedby="inputcustomerusernameHelpBlock">
																				<div id="inputcustomerusernameHelpBlock" class="form-text">Generates Single Result..And may not generate any Results..<b>Not Case Sensitive</b>..Result is generated to the <b>exact pattern matching</b> to the input key while ignoring Case..</div>
																		      	<br/><button type="submit" class="btn btn-outline-primary">Search Customer</button>
															      				
															      		</div>                                               
															    </div>
															    </form>
															  </div>
															</div>
															
									      </div>
								      <div class="modal-footer bg-secondary">
									       <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
								      </div>
						      </form>
								    </div>
								  </div>
								</div>





	<div class="modal fade" id="searchpurchase" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-secondary">
									        <h5 class="modal-title text-light" id="exampleModalLabel">Search Purchases</h5>
									        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
												        
												        	<div class="accordion accordion-flush" id="accordionFlush2">
															  <div class="accordion-item">
															    <h2 class="accordion-header" id="flush-headingOne1">
															      <button class="accordion-button collapsed text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne1" aria-expanded="false" aria-controls="flush-collapseOne1">
															        Search By Particular Purchase Date
															      </button>
															    </h2>
															    <form action="<%=request.getContextPath()%>/admin/searchpurchase" method="post">
															    <div id="flush-collapseOne1" class="accordion-collapse collapse" aria-labelledby="flush-headingOne1" data-bs-parent="#accordionFlush2">
																	      <div class="accordion-body">
																	      		
																	      		<input type="hidden" name="method" value="particulardate">
																		        <label for="inputdate54" class="form-label">Select Date</label>
																				<input type="date" name="purchasesearchdate" id="inputdate54" class="form-control" required="required" aria-describedby="inputdateHelpBlock">
																				<div id="inputdateHelpBlock" class="form-text">Generates Multiple Results..And may not generate any Results..<b>Not Case Sensitive</b>..Results are displayed on the basis of <b>date purchased</b>..</div>    
																		      	<br/><button type="submit" class="btn btn-outline-primary">Search Purchases</button>
																	      	
																	      </div>
															    </div>
															    </form>
															  </div>
															  <div class="accordion-item">
															    <h2 class="accordion-header" id="flush-headingTwo2">
															      <button class="accordion-button collapsed text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo2" aria-expanded="false" aria-controls="flush-collapseTwo2">
															        Search By Range of Purchase Date
															      </button>
															    </h2>
															    <form action="<%=request.getContextPath()%>/admin/searchpurchase" method="post">
															    <div id="flush-collapseTwo2" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo2" data-bs-parent="#accordionFlush2">
																	      <div class="accordion-body">
																	      		
																	      		<input type="hidden" name="method" value="rangedate">
																	      		<label for="inputdaterange11" class="form-label">From Date</label>
																				<input type="date" name="purchasesearchfromdate" id="inputdaterange11" class="form-control" required="required">
																				<label for="inputdaterange12" class="form-label">To Date</label>
																				<input type="date" name="purchasesearchtodate" id="inputdaterange12" class="form-control" required="required" aria-describedby="inputdaterangeHelpBlock">
																				<div id="inputcustomerphoneHelpBlock" class="form-text">Generates Multiple Results..And may not generate any Results..<b>Not Case Sensitive</b>..Results are displayed in the <b>date range purchased</b>..</div>                    
																		      	<br/><button type="submit" class="btn btn-outline-primary">Search Purchases</button>
																	      
																	      </div>
															    </div>
															    </form>
															  </div>
															  <div class="accordion-item">
															    <h2 class="accordion-header" id="flush-headingThree3">
															      <button class="accordion-button collapsed text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree3" aria-expanded="false" aria-controls="flush-collapseThree3">
															        Search For Purchases By Category-For
															      </button>
															    </h2>
															    <form action="<%=request.getContextPath()%>/admin/searchpurchase" method="post">
															    <div id="flush-collapseThree3" class="accordion-collapse collapse" aria-labelledby="flush-headingThree3" data-bs-parent="#accordionFlush2">
															      		<div class="accordion-body">
															      				
															      				<input type="hidden" name="method" value="productcategoryfor">
															      				<label for="inputproductfor" class="form-label">Select Product Category-For</label>
																				<select name="searchpurchaseproductfor" id="inputproductfor" class="form-select" aria-describedby="thisisHelpBlock" required="required">
																				<option value="">Select</option>
																				<option value="Men">Men</option>
																				<option value="Women">Women</option>
																				<option value="Children">Children</option>
																				</select>
																				<div id="thisisHelpBlock" class="form-text">Generates Multiple Results..And may not generate any Results..<b>Not Case Sensitive</b>..Result is generated to the <b>product category</b> purchases..</div>
																		      	<br/><button type="submit" class="btn btn-outline-primary">Search Purchases</button>
															      				
															      		</div>                                               
															    </div>
															    </form>
															  </div>
															  <div class="accordion-item">
															    <h2 class="accordion-header" id="flush-headingFour4">
															      <button class="accordion-button collapsed text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour4" aria-expanded="false" aria-controls="flush-collapseFour4">
															        Search For Purchases By Product-Type
															      </button>
															    </h2>
															    <form action="<%=request.getContextPath()%>/admin/searchpurchase" method="post">
															    <div id="flush-collapseFour4" class="accordion-collapse collapse" aria-labelledby="flush-headingFour4" data-bs-parent="#accordionFlush2">
															      		<div class="accordion-body">
															      				
															      				<input type="hidden" name="method" value="producttype">
															      				<label for="inputforproducttype" class="form-label">Select Product-Type</label>
																				<select name="inputproducttype" id="inputforproducttype" class="form-select" aria-describedby="thisisalsoHelpBlock" required="required">
																				<option value="">Select</option>
																				<option value="Casual">Casual</option>
																				<option value="Sports">Sports</option>
																				<option value="Trendy">Trendy</option>
																				<option value="Traditional">Traditional</option>
																				<option value="Office Wear">Office Wear</option>
																				</select>
																				<div id="thisisalsoHelpBlock" class="form-text">Generates Multiple Results..And may not generate any Results..<b>Not Case Sensitive</b>..Result is generated to the <b>product-type</b> purchases..</div>
																		      	<br/><button type="submit" class="btn btn-outline-primary">Search Purchases</button>
															      				
															      		</div>                                               
															    </div>
															    </form>
															  </div>
															</div>
															
									      </div>
								      <div class="modal-footer bg-secondary">
									       <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
								      </div>
						      </form>
								    </div>
								  </div>
								</div>




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