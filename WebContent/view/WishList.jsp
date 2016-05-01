<%@page import="com.fasterxml.jackson.databind.introspect.TypeResolutionContext.Basic"%>
<%@page import="java.util.Iterator"%>
<%@page import="command.GetAllUserWishes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="command.LoginUserCommand"%>
<%@page import="command.GetUserCommand"%>
<%@page import="com.mongodb.BasicDBObject" %>
<%@page import="com.mongodb.DBObject" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>IMDB Wish List</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script type="text/javascript">
	var x;
	$(document).ready(function() {
	
		$('#sub').click(function() {
			
			var sessionData=$('#sessionDetail').val();
			var resultElement = $('#response');
			
			})
		
		$('#addWish').click(function add(){
			alert(x);
			//window.location.href="http://localhost:8080/saasunh/rest/user/add?"+x;
		});
			
	})
</script>
</head>
<body>
			
			
	<div class="container">

		
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="jumbotron">
			<h1>IMDB Wish List</h1>
			<p>Wishes for Movie/Season/Episodes</p>
		</div>

		
		<!-- ~~Carousel HTML5 Content ~~ -->
		
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="img-responsive" src="img/imdbThird.png" alt="Imdb">
				</div>
				<div class="item">
					<img class="img-responsive" src="img/imdbFirst.png" alt="Imdb">
				</div>
				<div class="item">
					<img class="img-responsive" src="img/imdbSecond.png" alt="Imdb">
				</div>
				<div class="item">
					<img class="img-responsive" src="img/imdbForth.png" alt="Imdb">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<!--  ================/Carousel HTML5 Content ================================== -->



		<br />
		

		<br/><br/>
		<!--  ================ FORM HTML5 Content ================================== -->
		<div>
			
			<table  cellpadding="10px" style="border-style:solid;" id="table">
				<thead>
					<tr>
						<th style="border-style:solid; text-align: center">Poster</th>
						<th style="border-style:solid; text-align: center">Title</th>
						<th style="border-style:solid; text-align: center">IMDB ID</th>
						<th style="border-style:solid; text-align: center">Released Day</th>
						<th style="border-style:solid; text-align: center">Released Month</th>
						<th style="border-style:solid; text-align: center">Released Year</th>
						<th style="border-style:solid; text-align: center">Action</th>
					</tr>
				</thead>
				<% 
						String ObjId=(String)session.getAttribute("sessionlog");
						GetAllUserWishes wishes =new GetAllUserWishes();
						List<DBObject> list= wishes.execute(ObjId);
						Iterator itr= list.iterator();
						
						while(itr.hasNext()){
							
						BasicDBObject dbObj= (BasicDBObject)itr.next();
						String image= dbObj.getString("poster");
						String name=dbObj.getString("name");
						String imdbIdM=dbObj.getString("imdbId");
						String day=dbObj.getString("day");
						String month=dbObj.getString("month");
						String year=dbObj.getString("year");
						
				%>
				<tr>
					<td><img src="<%=image%>" id="Poster" style="border-style:solid; text-align: center;" width="300px" height="70px" /></td>
					
					<td id="Title" style="border-style:solid; text-align: center;" width="200px"><%=name %></td>
					
					<td id="Type" style="border-style:solid; text-align: center;" width="200px"><%=imdbIdM%></td>
					
					<td id="imdbRating" style="border-style:solid; text-align: center" width="200px"><%=day%></td>
					<td id="imdbId" style="border-style:solid; text-align: center" width="200px"><%=month%></td>
					<td id="Released" style="border-style:solid; text-align: center" width="200px"><%=year%></td>
					<td id="Add" style="border-style:solid; text-align: center" width="200px">
						<input type="button" value="Delete" class="btn btn-danger" id="addWish" onclick="add()">
					</td>
				</tr>
				
				<% } %>

			</table>


		</div>
		<div>
		</div>

		<!--  ================ /FORM HTML5 Content ================================== -->
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />


		<!--  ================ PAGER HTML5 Content ================================== -->
		<div>
			<ul class="pager">
				<li class="previous"><a href="#">Previous</a></li>
				<li class="next"><a href="#">Next</a></li>
			</ul>
		</div>
		<!--  ================ /PAGER HTML5 Content ================================== -->


		<!--  ================ COLS HTML5 Content ================================== -->

		<div class="row">
			<div class="col-sm-4">
				<h3>Column 1</h3>
				<p>line 1</p>
				<p>line 2</p>
			</div>
			<div class="col-sm-4">
				<h3>Column 2</h3>
				<p>line 1</p>
				<p>line 2</p>
			</div>
			<div class="col-sm-4">
				<h3>Column 3</h3>
				<p>line 1</p>
				<p>line 2</p>
			</div>
		</div>
		<!--  ================ /COLS HTML5 Content ================================== -->
	</div>
	<script type="text/javascript">
		
	</script>
</body>


</html>