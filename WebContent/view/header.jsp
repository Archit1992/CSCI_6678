<%@page import="command.LoginUserCommand"%>
<%@page import="command.GetUserCommand"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.mongodb.BasicDBObject" %>
<%@page import="command.LoginUserCommand" %>


<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Wish List</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Page 1</a></li>
					<li><a href="#">Page 2</a></li>
					<li><a href="#">Page 3</a></li>
					<% 
						String ObjId=(String)session.getAttribute("sessionlog");
						LoginUserCommand command=new LoginUserCommand();
						String fName=command.execute(ObjId);
						
					%>
					<li style="padding-left: 550px;"><a href="#">
						<%=fName %>
					</a>
					</li>
					<li style="padding-left: 10px;"><a href="#">Logout</a></li>

				</ul>
			</div>
		</nav>