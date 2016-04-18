<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
Successfully created : ${it} logged in.

<br/>
<br/>
<br/>

<%-- <form method="GET" action="<%=request.getContextPath()%>/rest/user/login" >
		<table>
			<tr>
				<td>Log In</td>
			</tr>
			<tr>
				<td>Email Id</td>
				<td><input type="text" name="email"  size=30></td>	
			</tr>
			<tr>										
				<td>Password</td>
				<td><input type="password" name="password"  size=30></td>	
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>	
			</tr>
			
		</table>

	</form> --%>
	
	<div class="Container">

		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#popUpWindow">Login</button>

		<div class="modal fade" id="popUpWindow">
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
</html>