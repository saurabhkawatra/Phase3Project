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

    <title>SportyShoes</title>
</head>
<body style="background-color:dodgerblue;">

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
    <br />
	<h1 style="text-align: center; color: cornsilk;">Login Page</h1>
    <br />
    <br />
    <br />
    <br />
    
    <div class="container" style="width:600px;">
	<div class="row">
	<div class="col">
  				
  				
  				<div class="card text-center">
			  	<div class="card-header">
			  	  Sign In
			 	 </div>
			 		 <div class="card-body">
			   			 <form action="<%=request.getContextPath()%>/signin" method="post">
							<%if(request.getAttribute("invalidcheck")!=null) {%>
							<h4 class="text-danger">Invalid Username or Password!!!!</h4>
							<%}%>
							<div class="mb-3">
							<h3>Username</h3>
							<input name="username" placeholder="Enter Username" style="text-align:center" type="text" class="form-control" id="Inputusername" aria-describedby="emailHelp" required="required">
							<div id="emailHelp" class="form-text">We never share your details with anyone else.</div>
							</div>
				
							<div class="mb-3">
							<h3>Password</h3>
							<input name="password" placeholder="Enter Password" style="text-align:center" type="password" class="form-control" id="InputPassword" required="required">
							</div>
				
							<h1 style="text-align: center;"><button type="submit" class="btn btn-primary">Sign in</button></h1>
				
						</form>
						
						<br />
						<br />
						<br />
						<h6>Not a member yet...</h6>
						<h3 style="color:blue"><a href="" data-bs-toggle="modal" data-bs-target="#register">Register here</a></h3>
						<br />
						<h6>Admin Registration Here...</h6>
						<h3><a class="text-secondary" href="" data-bs-toggle="modal" data-bs-target="#adminregister">Admin Register here</a></h3>
						
					</div>
				</div>
  				
	</div>
	</div>
	</div>
    			
			    
									<div class="modal fade" id="register" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-secondary">
									        <h5 class="modal-title text-light" id="exampleModalLabel">Customer Sign-Up</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
							      <form action="<%=request.getContextPath()%>/register" method="post">
									      <div class="modal-body">
												        	<input type="hidden" name="typeofuser" value="customer">
												        	<div class="mb-3">
															Enter your Name
															<input name="name" type="text" placeholder="Enter Name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your Date of Birth
															<input name="dob" type="date" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your City
															<input name="city" type="text" placeholder="Enter your current city" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your Phone Number
															<input name="phonenumber" type="number" placeholder="Enter your phone number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter Preferred Username
															<input name="username" type="text" placeholder="Enter username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your Passsword
															<input name="password" type="password" placeholder="Enter Password for your account" class="form-control" id="exampleInputPassword1" required="required">
															</div>
															
									      </div>
								      <div class="modal-footer bg-secondary">
								        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
								        <button type="submit" class="btn btn-primary">Sign Up</button>
								      </div>
						      </form>
								    </div>
								  </div>
								</div>
								
								
								<div class="modal fade" id="adminregister" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-secondary">
									        <h5 class="modal-title text-light" id="exampleModalLabel">Admin Sign-Up</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
							      <form action="<%=request.getContextPath()%>/register" method="post">
									      <div class="modal-body">
												        	<input type="hidden" name="typeofuser" value="admin">
												        	<div class="mb-3">
															Enter your Name
															<input name="name" type="text" placeholder="Enter Name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your Date of Birth
															<input name="dob" type="date" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your City
															<input name="city" type="text" placeholder="Enter your current city" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your Phone Number
															<input name="phonenumber" type="number" placeholder="Enter your phone number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter Preferred Username
															<input name="username" type="text" placeholder="Enter username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
															</div>
															<div class="mb-3">
															Enter your Passsword
															<input name="password" type="password" placeholder="Enter Password for your account" class="form-control" id="exampleInputPassword1" required="required">
															</div>
															
									      </div>
								      <div class="modal-footer bg-secondary">
								        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
								        <button type="submit" class="btn btn-primary">Sign Up</button>
								      </div>
						      </form>
								    </div>
								  </div>
								</div>
	


	<br />
    <br />
    <br />

    <h6 style="text-align:center;color:cornsilk;font-weight:bold">&#64;Project By Saurabh Kawatra</h6>

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
    
    							<%if(request.getAttribute("registrationsuccessful")!=null) { String username=(String)request.getAttribute("registrationsuccessful");String typeofuser=(String)request.getAttribute("typeofuser");%>
									<div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="registrationdone" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header bg-primary">
									      	<div class="container" align="center">
									        <h5 class="modal-title text-light" align="center" id="exampleModalLabel">Registration Status</h5>
									        </div>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
												<div class="modal-body">
															<h3 align="center" class="text-success"><b><%if(typeofuser.equals("admin")){%>Admin<%} else {%>Customer<%}%> Registration Successfull!!!</b></h3>
																<br /><br />
																<h5 align="center">Make Note of your username :-</h5><h5 align="center"><b class="text-danger"><%=username %></b></h5>
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
													    var abc=new bootstrap.Modal(document.getElementById('registrationdone'),{keyboard: false});
													    abc.show();
													}
													
									</script>

										<%}%>

</body>
</html>