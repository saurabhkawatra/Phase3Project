<%@page import="com.SportyShoes.MODELS.Purchase_Entry"%>
<%@include file="admin_home.jsp" %>


<div class="modal fade" id="operationresult-1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <div class="modal-header bg-secondary sticky-top">
		      	<div align="center" class="container">
		        <h5 class="modal-title text-light" id="exampleModalLabel" style="font-weight: bold; font-family: Copperplate Gothic;">Operation Results</h5>
		        </div>
		        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      
		      
		      					<%if(request.getAttribute("passwordchangerequestresult")!=null) { String result=(String)request.getAttribute("passwordchangerequestresult"); if(result.equals("success")) {%>
		      					
		      								<h1 class="text-success" style="text-align: center;font-weight: bold;">Your Password is Successfully Updated!</h1>
		      								
		      								<%} else { %>
		      								
		      								<h1 class="text-danger" style="text-align: center;font-weight: bold;">Your Password Could Not be Updated due to Incorrect Current Password</h1>
		      					
		      					
		      						<%} } %>
		      					
		      					
		      					
					        
					        	<%if(request.getAttribute("addedproduct")!=null) { Product adp=(Product)request.getAttribute("addedproduct");%>
					        	
					        				<p class="text-success" style="text-align: center;font-weight: bold;">Product Added Successfully!</p>
					        				<p class="text-primary" style="text-align: center;font-weight: bold;">Product Details :-</p>
								        		<table class="table table-success table-striped" style="text-align: center;">
								        		<thead class="sticky-top table-dark" style="top:62px"><tr><th>Product Id</th><th>Product Name</th><th>Product Type</th><th>Product For</th><th>Product Image</th><th>Product Price</th></tr></thead>
								        		<tbody>								
								        		<tr style="vertical-align: middle;"><td><%=adp.getProduct_id()%></td><td><%=adp.getProduct_name()%></td><td><%=adp.getProduct_type()%></td><td><%=adp.getProduct_for()%></td><td><img src="<%=request.getContextPath()%>/Resources/uploads/<%=adp.getProduct_image_name()%>" width="200px" height="100px"><p><%=adp.getProduct_image_name()%></p></td><td><%=adp.getProduct_price()%></td></tr>            
								        		</tbody>
								        		</table>
					        	
					        		<%}%>
					        	
					        	
					        	<%if(request.getAttribute("removal_product_list")!=null) { List<Product> removedproducts=(List<Product>)request.getAttribute("removal_product_list");%>
					        					
					        					<p class="text-danger" style="text-align: center;font-weight: bold;"><%=removedproducts.size()%> Products Removed Successfully!</p>
					        					<p class="text-primary" style="text-align: center;font-weight: bold;">Removed Product Details :-</p>
								        		<table class="table table-danger table-striped" style="text-align: center;">
								        		<thead class="sticky-top table-dark" style="top:62px"><tr><th>Product Id</th><th>Product Name</th><th>Product Type</th><th>Product For</th><th>Image Name</th><th>Product Price</th></tr></thead>
								        		<tbody>	   <%for(Product adp:removedproducts) {%>							
								        		<tr style="vertical-align: middle;"><td><%=adp.getProduct_id()%></td><td><%=adp.getProduct_name()%></td><td><%=adp.getProduct_type()%></td><td><%=adp.getProduct_for()%></td><td><%=adp.getProduct_image_name()%></td><td><%=adp.getProduct_price()%></td></tr>            
								        													<%}%>
								        		</tbody>
								        		</table>	
					        		<%}%>
					        		
					        		
					        	<%if(request.getAttribute("updateproductresult")!=null) { Product adp=(Product)request.getAttribute("updateproductresult");Product oldp=(Product)request.getAttribute("oldproductdetails");%>
					        	
					        				<p class="text-success" style="text-align: center;font-weight: bold;">Product Updated Successfully!</p>
					        				
					        				<p class="text-warning" style="text-align: center;font-weight: bold;">Old Product Details :-</p>
								        		<table class="table table-warning table-striped" style="text-align: center;">
								        		<thead class="sticky-top table-dark" style="top:62px"><tr><th>Product Id</th><th>Product Name</th><th>Product Type</th><th>Product For</th><th>Product Image Name</th><th>Product Price</th></tr></thead>
								        		<tbody>								
								        		<tr style="vertical-align: middle;"><td><%=oldp.getProduct_id()%></td><td><%=oldp.getProduct_name()%></td><td><%=oldp.getProduct_type()%></td><td><%=oldp.getProduct_for()%></td><td><%=oldp.getProduct_image_name()%></td><td><%=oldp.getProduct_price()%></td></tr>            
								        		</tbody>
								        		</table>
					        				
					        				<p class="text-primary" style="text-align: center;font-weight: bold;">Updated Product Details :-</p>
								        		<table class="table table-success table-striped" style="text-align: center;">
								        		<thead class="sticky-top table-dark" style="top:62px"><tr><th>Product Id</th><th>Product Name</th><th>Product Type</th><th>Product For</th><th>Product Image</th><th>Product Price</th></tr></thead>
								        		<tbody>								
								        		<tr style="vertical-align: middle;"><td><%=adp.getProduct_id()%></td><td><%=adp.getProduct_name()%></td><td><%=adp.getProduct_type()%></td><td><%=adp.getProduct_for()%></td><td><img src="<%=request.getContextPath()%>/Resources/uploads/<%=adp.getProduct_image_name()%>" width="200px" height="100px"><p><%=adp.getProduct_image_name()%></p></td><td><%=adp.getProduct_price()%></td></tr>            
								        		</tbody>
								        		</table>
					        	
					        		<%}%>
					        		
					        	<%if(request.getAttribute("methodname")!=null) { String methodname=(String)request.getAttribute("methodname");%>
					        	
							        						<%if(methodname.equals("resultbyname")||methodname.equals("resultbyphoneno")) { List<User> reslist = new ArrayList<>();reslist=(List<User>)request.getAttribute("customersearchresult");%>
											        								<%if(reslist.isEmpty()) {%>
											        								<h1 class="text-danger" style="text-align: center;font-weight: bold;">No Results Found!</h1>
											        								<%}else{%>
											        										<h3 class="text-primary" align="center" style="font-family: Copperplate Gothic;">Search Results :-</h3>
											        										<br/>
											        										<h5 class="text-success" align="center" style="font-family: Copperplate Gothic;">( <%=reslist.size()%> ) Results Found</h5>
											        										<br/>
											        										<table class="table table-dark">
																								<thead class="sticky-top" style="top:63px;">
																								<tr align="center"><td  align="left"><b>S.No.</b></td><th scope="col">User Id</th><th scope="col">User Full Name</th><th scope="col">Username</th><th scope="col">User Phone No</th><th scope="col">User City</th><th scope="col">User DOB</th></tr>
																								</thead>
																								<tbody class="table-success">
																								<%int c=1; for(User u:reslist){%>
																								
																								<tr align="center"><td align="left"><b><%=c%></b></td><td><%=u.getUser_id()%></td><td><%=u.getUser_Realname()%></td><td><%=u.getUsername()%></td><td><%=u.getPhonenumber()%></td><td><%=u.getUser_city()%></td><td><%=u.getUser_dob().toString()%></td></tr>
																								                                
																													<% c++; }%>
																								</tbody>
																							</table>
																							
											        								<%}%>
							     
							        						<%}else { User u=(User)request.getAttribute("customersearchresult");%>
							        						
							        						
							        											<% if(u==null) {%>
							        											<h1 class="text-danger" style="text-align: center;font-weight: bold;">No Results Found!</h1>
							        											<%} else {%>
							        															<h3 class="text-primary" align="center" style="font-family: Copperplate Gothic;">Search Results :-</h3>
												        										<br/>
												        										<h5 class="text-success" align="center" style="font-family: Copperplate Gothic;">User Found</h5>
												        										<br/>
												        										<table class="table table-dark">
																									<thead class="sticky-top" style="top:63px;">
																									<tr align="center"><th scope="col">User Id</th><th scope="col">User Full Name</th><th scope="col">Username</th><th scope="col">User Phone No</th><th scope="col">User City</th><th scope="col">User DOB</th></tr>
																									</thead>
																									<tbody class="table-success">
																									
																									<tr align="center"><td><%=u.getUser_id()%></td><td><%=u.getUser_Realname()%></td><td><%=u.getUsername()%></td><td><%=u.getPhonenumber()%></td><td><%=u.getUser_city()%></td><td><%=u.getUser_dob().toString()%></td></tr>
																													
																									</tbody>
																								</table>
							        													<%}%>
							        													
							        													
							        						<%}%>
					        	
					        	<%}%>	
					        	
					        	<%if(request.getAttribute("purchaseList")!=null) { %>
					        	<h3 class="text-primary" align="center" style="font-family: Copperplate Gothic;">Search Results :-</h3>
								<br/>
					        	<table class="table table-dark">
								<thead class="sticky-top" style="top:83px;">
								<tr align="center" style="vertical-align: middle;"><td  align="left"><b>S.No.</b></td><th scope="col">Purchase Entry Id</th><th scope="col">Purchased Product ID</th><th scope="col">Purchased Product Name</th><th scope="col">Purchased Product Image</th><th scope="col">Purchased Product-Type</th><th scope="col">Purchased Product-Category For</th><th scope="col">Purchased By UserId</th><th scope="col">Purchased By Customer-Name</th><th scope="col">Customer's Username</th><th scope="col">Purchase-Date</th></tr>                       
								</thead>
								<tbody class="table-success">
																				<%List<Purchase_Entry> purchaseList=new ArrayList<>();
																				List<User> purchaseuserList=new ArrayList<>();
																				List<Product> purchaseproductList=new ArrayList<>();
																				purchaseList=(List<Purchase_Entry>)request.getAttribute("purchaseList");
																				purchaseuserList=(List<User>)request.getAttribute("purchase_userList");
																				purchaseproductList=(List<Product>)request.getAttribute("purchase_productList");
																				int c=1;
																				if(purchaseList.isEmpty())
																				{%><tr align="center" style="vertical-align: middle;color: red;"><td colspan="11"><h1>No Purchases Found...</h1></td></tr><%}
																				else {
																					for(Purchase_Entry pe:purchaseList){%>
									
									<tr align="center" style="vertical-align: middle;"><td align="left"><b><%=c%></b></td><td><%=pe.getPurchase_entry_id()%></td><td><%=purchaseproductList.get(c-1).getProduct_id()%></td><td><%=purchaseproductList.get(c-1).getProduct_name()%></td><td><img src="<%=request.getContextPath()%>/Resources/uploads/<%=purchaseproductList.get(c-1).getProduct_image_name()%>" width="200px" height="100px"></td><td><%=purchaseproductList.get(c-1).getProduct_type()%></td><td><%=purchaseproductList.get(c-1).getProduct_for()%></td><td><%=purchaseuserList.get(c-1).getUser_id()%></td><td><%=purchaseuserList.get(c-1).getUser_Realname()%></td><td><%=purchaseuserList.get(c-1).getUsername()%></td><td><%=pe.getPurchased_Date()%></td></tr>                                                                                                                           
									                                
																					<% c++; } } %>
																				
								</tbody>
								</table>
					        	<% } %>
					        	
					        	
					        	
					        	
								
		      </div>
	      <div class="modal-footer bg-light">
	      		<div class="container" align="center">
		       <button type="button" class="btn btn-lg btn-secondary" data-bs-dismiss="modal">&nbsp;&nbsp;OK&nbsp;&nbsp;</button>
		       </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
<script>
				window.onload(abc());
				function abc() {
				    var abc=new bootstrap.Modal(document.getElementById('operationresult-1'),{keyboard: false});
				    abc.show();
				}
				
</script>







