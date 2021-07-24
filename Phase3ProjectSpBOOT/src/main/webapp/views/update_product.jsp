<%@include file="admin_home_header.jsp" %>

<br />
<br />

<h2 class="text-light text-center" style="font-weight: bold;font-family: Copperplate Gothic;">Update Product</h2>

<br />
<br />
				<form action="<%=request.getContextPath()%>/admin/updateproduct" method="post" enctype="multipart/form-data">
						<div class="container bg-light col-6 offset-3 shadow-lg rounded">
						<br />
						<%Product p=(Product)request.getAttribute("update_product");%>
						<h4 class="text-primary text-center">Product Id - <%=p.getProduct_id()%></h4>
						<input type="hidden" name="updateproductid" value=<%=p.getProduct_id()%>>
						<br />
						<div class="mb-3 text-secondary" style="font-weight: bold;">
						Product Name
						<input name="product_name" type="text" value="<%=p.getProduct_name()%>" placeholder="Enter Product Name" class="form-control" required="required">
						</div>
						<div class="mb-3 text-secondary" style="font-weight: bold;">
						Select Product Type
						<select name="product_type" class="form-select" required="required">
						<option value="<%=p.getProduct_type()%>"><%=p.getProduct_type()%> (Current Value)</option>
						<option value="Casual">Casual</option>
						<option value="Sports">Sports</option>
						<option value="Trendy">Trendy</option>
						<option value="Traditional">Traditional</option>
						<option value="Office Wear">Office Wear</option>
						</select>
						</div>
						<div class="mb-3 text-secondary" style="font-weight: bold;">
						Select Product For
						<select name="product_for" class="form-select" required="required">
						<option value="<%=p.getProduct_for()%>"><%=p.getProduct_for()%> (Current Value)</option>
						<option value="Men">Men</option>
						<option value="Women">Women</option>
						<option value="Children">Children</option>
						</select>
						</div>
						<div class="mb-3 text-secondary" style="font-weight: bold;">
						Current Product Image
						<br />
						<br />
						<img alt="..." src="<%=request.getContextPath()%>/Resources/uploads/<%=p.getProduct_image_name()%>" height="100px" width="200px">
						<br />
						<br />
						Upload New Product Image
						<input type="file" name="imagefile" class="form-control">
						</div>
						<div class="mb-3 text-secondary" style="font-weight: bold;">
						Product Price
						<input name="product_price" value="<%=p.getProduct_price()%>" type="number" min="0" max="2147483647" class="form-control" required="required">
						</div>
						<br/>
						<br/>
						<br/>
						
						<div align="center">
						<button class="btn btn-primary btn-lg" type="submit">Update the Values</button>
						</div>
						
						<br />
						<br />
						</div>
				</form>		



<br />
<br />
<br />
<br />

<%@include file="admin_home_footer.jsp" %>


