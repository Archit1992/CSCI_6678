<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IMDB Register</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

	<%-- <form method="POST"
		action="<%=request.getContextPath()%>/rest/user/create">
		<table>
			<tr>
				<td>Sign Up</td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname" size=30></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname" size=30></td>
			</tr>
			<tr>
				<td>Email Id</td>
				<td><input type="text" name="email" size=30></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" size=30></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>

		</table>

	</form>
 --%>


	<div class="Container">

		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#popUpWindow">Register</button>
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#popUpLogin">Login</button>
			
			
		<div class="modal fade" id="popUpWindow">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<form role="form" method="POST"
							action="<%=request.getContextPath()%>/rest/user/create">
							<div class="form-group">
								<input type="text" class="form-control" name="fname"
									placeholder="First Name" required="">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="lname"
									placeholder="Last Name" required="">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="email"
									placeholder="email" required="">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password"
									placeholder="password" required="">
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary btn-block">Log
									In</button>
							</div>

						</form>
					</div>



				</div>
			</div>
		</div>
	
	
		<div class="modal fade" id="popUpLogin">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<form role="form" method="GET"
							action="<%=request.getContextPath()%>/rest/user/login">
							
							<div class="form-group">
								<input type="text" class="form-control" name="email"
									placeholder="email" required="">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password"
									placeholder="password" required="">
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary btn-block">Log In</button>
							</div>

						</form>
					</div>



				</div>
			</div>
		</div>
		
	</div>
</body>

<script>
	/* function fName(){
		
		var user=document.getElementById("fn").value;
		var password = document.getElementById("pswd").value;
		
		alert("Hello Archit");
		alert("UserName:"+user+"</br>Password: "+password);
		alert("Link: http://localhost/IMDB_MongoLAB/rest/user/"+user+"/"+password);
		window.location="http://localhost/IMDB_MongoLAB/rest/user/"+user+"/"+password;
	} */
</script>
</html>