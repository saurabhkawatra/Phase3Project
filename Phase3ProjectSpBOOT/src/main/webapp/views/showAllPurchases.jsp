<%@page import="com.SportyShoes.MODELS.Purchase_Entry"%>
<%@include file="admin_home_header.jsp" %>


<br />
<br />
<h1 class="text-light text-center" style="font-family: Copperplate Gothic;">All Purchases</h1>

<br />
<br />
<br />
<br />
<br />

					<div class="container col-10 offset-1 bg-light shadow-lg rounded">
							<br /><br />
							<h3 class="text-primary" align="center" style="font-family: Copperplate Gothic;">All Purchase Details</h3>
							<br /><br />
							<table class="table table-dark">
								<thead class="sticky-top" style="top:83px; z-index: 0;">
								<tr align="center" style="vertical-align: middle;"><td  align="left"><b>S.No.</b></td><th scope="col">Purchase Entry Id</th><th scope="col">Purchased Product ID</th><th scope="col">Purchased Product Name</th><th scope="col">Purchased Product Image</th><th scope="col">Purchased Product-Type</th><th scope="col">Purchased Product-Category For</th><th scope="col">Purchased By UserId</th><th scope="col">Purchased By Customer-Name</th><th scope="col">Customer's Username</th><th scope="col">Purchase-Date</th></tr>                       
								</thead>
								<tbody class="table-success">
								<%if(request.getAttribute("purchaseList")!=null){List<Purchase_Entry> purchaseList=new ArrayList<>();
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
									                                
																					<% c++; } } } %>
																				
								</tbody>
							</table>
							<br /><br /><br /><br />
					</div>





<%@include file="admin_home_footer.jsp" %>