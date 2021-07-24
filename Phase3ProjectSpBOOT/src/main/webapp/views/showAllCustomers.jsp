<%@include file="admin_home_header.jsp" %>


<br />
<br />
<h1 class="text-light text-center" style="font-family: Copperplate Gothic;">All Customers</h1>

<br />
<br />
<br />
<br />
<br />

					<div class="container col-10 offset-1 bg-light shadow-lg rounded">
							<br /><br />
							<h3 class="text-primary" align="center" style="font-family: Copperplate Gothic;">All Customer Details</h3>
							<br /><br />
							<table class="table table-dark">
								<thead class="sticky-top" style="top:83px;">
								<tr align="center"><td  align="left"><b>S.No.</b></td><th scope="col">User Id</th><th scope="col">User Full Name</th><th scope="col">Username</th><th scope="col">User Phone No</th><th scope="col">User City</th><th scope="col">User DOB</th></tr>
								</thead>
								<tbody class="table-success">
								<%if(request.getAttribute("customerList")!=null){List<User> cusl=new ArrayList<>();cusl=(List<User>)request.getAttribute("customerList");int c=1; for(User u:cusl){%>
								
								<tr align="center"><td align="left"><b><%=c%></b></td><td><%=u.getUser_id()%></td><td><%=u.getUser_Realname()%></td><td><%=u.getUsername()%></td><td><%=u.getPhonenumber()%></td><td><%=u.getUser_city()%></td><td><%=u.getUser_dob().toString()%></td></tr>
								                                
													<% c++; }  } %>
								</tbody>
							</table>
							<br /><br /><br /><br />
					</div>





<%@include file="admin_home_footer.jsp" %>


