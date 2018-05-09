<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Guardian &mdash; 100% Free Fully Responsive HTML5
	Template by FREEHTML5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="css/superfish.css">

<link rel="stylesheet" href="css/style.css">


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">

			<!-- header 시작 -->
			<jsp:include page="header.jsp" />
			<!-- header 끝 -->


			<div class="fh5co-hero fh5co-hero-2">
				<div class="fh5co-overlay"></div>
				<div class="fh5co-cover fh5co-cover_2 text-center"
					data-stellar-background-ratio="0.5"
					style="background-image: url(images/blog-2.jpg);">
					<div class="desc animate-box">
						<h2>테마 검색</h2>
						<span>Lovely Crafted by <a href="http://frehtml5.co/"
							target="_blank" class="fh5co-site-name">FREEHTML5.co</a></span>
					</div>
				</div>
			</div>
			<!-- end:header-top -->
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<h2>Write</h2>
				</div>

				<div class="panel-body">
					

					<div class="container">
						<form action="insert.php" method="post">
							
							<form role="form">
								<div class="row">
									<div class="col-md-6">
										
										<div class="form-group">
											<label for="name">NAME</label> <input type="text"
												class="form-control" name="name" id="name"
												placeholder="Enter name">
										</div>
									</div>


									
									<div class="col-md-6">
										<div class="form-group">
											<label for="pass">Password</label> <input type="password"
												class="form-control" name="pass" id="pass"
												placeholder="Enter password">
										</div>
									</div>

								</div>
								
								<div class="form-group">
									<label for="email">Email address</label> <input type="email"
										class="form-control" name="email" id="email"
										placeholder="Enter email">
								</div>

								
								<div class="form-group">
									<label for="subject">Title</label> <input type="text"
										class="form-control" name="subject" id="subject"
										placeholder="Enter title">
								</div>

								
								<div class="form-group">
									<label for="content">Comment:</label>
									<textarea class="form-control" rows="10" name="content"
										id="content"></textarea>
									
									

								</div>


								
								<div class="form-group">
									<label for="File">File input</label> <input type="file" id="File">
								</div>

								
								<div class="center-block" style='width: 200px'>
									<input type="submit" value="저장하기"> 
									<input type="reset"	value="다시쓰기"> 
									<input type="button" value="Back" onclick="history.back(1)">
								</div>
								


							</form>
							
						</form>
						

					</div>
				</div>
				<!--panel end-->
			</div>

		</div>


		<!-- END fh5co-work-section -->

		<footer>
			<div id="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 text-center">
							<p class="fh5co-social-icons">
								<a href="#"><i class="icon-twitter2"></i></a> <a href="#"><i
									class="icon-facebook2"></i></a> <a href="#"><i
									class="icon-instagram"></i></a> <a href="#"><i
									class="icon-dribbble2"></i></a> <a href="#"><i
									class="icon-youtube"></i></a>
							</p>
							<p>
								Copyright 2016 Free Html5 <a href="#">Guardian</a>. All Rights
								Reserved. <br>Made with <i class="icon-heart3"></i> by <a
									href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> /
								Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->


	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

</body>
</html>

