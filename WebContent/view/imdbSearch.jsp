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
	$(document).ready(function() {

		$('#sub').click(function() {
			alert('hello')
			var requestData = $('#search').val();
			var resultElement = $('#response');
			alert(requestData);
			
			$.ajax({
				url : 'http://www.omdbapi.com/',
				method : 'get',
				data : {t : requestData},
				success : function(data) {
					resultElement.html('Title: ' + data.Title +'<br/>'+'Released: ' +data.Released);
				}
			})
		
		})
	})
</script>

</head>
<body>

	<div class="container">

		<!--  ================ Navigationbar HTML5 Content ================================== -->

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
					<li style="padding-left: 550px;"><a href="#">Login</a></li>
					<li style="padding-left: 10px;"><a href="#">Sign up</a></li>

				</ul>
			</div>
		</nav>
		<!--  ================ /Navigationbar HTML5 Content ================================== -->

		<!--  ================ Jumbotron HTML5 Content ================================== -->
		<div class="jumbotron">
			<h1>IMDB Wish List</h1>
			<p>Wishes for Movie/Season/Episodes</p>
		</div>

		<!--  ================ /Jumbotron HTML5 Content ================================== -->

		<!--  ================ Carousel HTML5 Content ================================== -->
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
		<div class="panel-group" style="width: 1140px;" align="center">
			<div class="panel panel-default">
				<div class="panel-heading">

					<form class="form-inline" role="form">
						<h4 class="panel-title">
							<div class="form-group">

								<img class="img-responsive" src="img/IMDb-icon-300x167.png"
									style="height: 35px; width: 60px;">

							</div>
							<div class="form-group">
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										data-toggle="dropdown">
										Actions <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#">Movies</a></li>
										<li><a href="#">Series</a></li>
										<li><a href="#">Drama</a></li>
									</ul>
								</div>
							</div>
							<div class="form-group">
								<input type="search" class="form-control" id="search">
							</div>
							<button type="submit" class="btn btn-default" id="sub">Submit</button>
						</h4>
					</form>


				</div>
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">Panel Body</div>
					<div class="panel-footer">Panel Footer</div>
				</div>
			</div>
		</div>



		<!--  ================ FORM HTML5 Content ================================== -->
		<div id="response">
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