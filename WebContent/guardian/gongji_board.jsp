<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style type="text/css">
.btn-group .btn {
	transition: background-color .3s ease;
}

.panel-table .panel-body {
	padding: 0;
}

.table>thead>tr>th {
	border-bottom: none;
}

.panel-footer, .panel-table .panel-body .table-bordered {
	border-style: none;
	margin: 0;
}

.panel-table .panel-body .table-bordered>thead>tr>th:first-of-type {
	text-align: center;
	width: 50px;
}

.panel-table .panel-body .table-bordered>thead>tr>th.col-tools {
	text-align: center;
	width: 120px;
}

.panel-table .panel-body .table-bordered>thead>tr>th:last-of-type,
	.panel-table .panel-body .table-bordered>tbody>tr>td:last-of-type {
	border-right: 0;
}

.panel-table .panel-body .table-bordered>thead>tr>th:first-of-type,
	.panel-table .panel-body .table-bordered>tbody>tr>td:first-of-type {
	border-left: 0;
}

.panel-table .panel-body .table-bordered>tbody>tr:first-of-type>td {
	border-bottom: 0;
}

.panel-table .panel-body .table-bordered>thead>tr:first-of-type>th {
	border-top: 0;
}

.pagination>li>a, .pagination>li>span {
	border-radius: 50% !important;
	margin: 0 5px;
}

.pagination {
	margin: 0;
}
</style>

</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">


			<!-- header 시작  -->

			<jsp:include page="header.jsp" />
			<!-- header 끝 -->


			<div class="fh5co-hero fh5co-hero-2">
				<div class="fh5co-overlay"></div>
				<div class="fh5co-cover fh5co-cover_2 text-center"
					data-stellar-background-ratio="0.5"
					style="background-image: url(images/blog-3.jpg);">
					<div class="desc animate-box">
						<h2>Contact Us</h2>
						<span>Lovely Crafted by <a href="http://frehtml5.co/"
							target="_blank" class="fh5co-site-name">FREEHTML5.co</a></span>
					</div>
				</div>
			</div>
			<!-- end:header-top -->

			<div class="container">
				<div class="row">
					<nav class="navbar navbar-default">
						<div class="container">
							<div class="navbar-header">
								<span class="navbar-brand">Bootstrap Table Panel</span>
							</div>
							<div class="col-xs-12 col-md-4">

								<div class="form-group">

									<div class="input-group">
										<input type="text" class="form-control input-md" name="search">
										<div class="input-group-btn">
											<button type="button" class="btn btn-md btn-warning">
												<span class=" glyphicon glyphicon-search"></span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</nav>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="panel panel-default panel-table">
							<div class="panel-heading">
								<div class="row">
									<div class="col col-xs-6">
										<h3 class="panel-title">Panel title</h3>
									</div>
									<div class="col col-xs-6 text-right">
										<div class="pull-right">
											<div class="btn-group" data-toggle="buttons">
												<label class="btn btn-success btn-filter active"
													data-target="completed"> <input type="radio"
													name="options" id="option1" autocomplete="off" checked>
													내가 작성한 글 보기
												</label> <label class="btn btn-warning btn-filter"
													data-target="pending"> <input type="radio"
													name="options" id="option2" autocomplete="off">
													Pending
												</label> <label class="btn btn-default btn-filter" data-target="all">
													<input type="radio" name="options" id="option3"
													autocomplete="off"> All
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-body">
								<table id="mytable"
									class="table table-striped table-bordered table-list">
									<thead>
										<tr>
											<th class="col-check"><input type="checkbox"
												id="checkall" onclick="test()" /></th>
											<th class="col-tools">번호</th>
											<th class="hidden-xs">작성자</th>
											<th class="col-text">제목</th>
											<th class="col-text">수정 및 삭제</th>
										</tr>
									</thead>
									<tbody>
										<tr data-status="completed">
											<td align="center"><input type="checkbox"
												class="checkthis" /></td>

											<td class="hidden-xs">1</td>
											<td>John Doe</td>
											<td>johndoe@example.com</td>
											<td align="center"><a class="btn btn-default"><span
													class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
												<a class="btn btn-danger"><span
													class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
											</td>
										</tr>
										<tr data-status="pending">
											<td align="center"><input type="checkbox"
												class="checkthis" /></td>

											<td class="hidden-xs">2</td>
											<td>Jen Curtis</td>
											<td>jencurtis@example.com</td>
											<td align="center"><a class="btn btn-default"><span
													class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
												<a class="btn btn-danger"><span
													class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
											</td>
										</tr>
									</tbody>
								</table>

							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col col-xs-offset-3 col-xs-6">
										<nav aria-label="Page navigation" class="text-center">
											<ul class="pagination">
												<li><a href="#" aria-label="Previous"> <span
														aria-hidden="true">«</span>
												</a></li>
												<li class="active"><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">5</a></li>
												<li><a href="#" aria-label="Next"> <span
														aria-hidden="true">»</span>
												</a></li>
											</ul>
										</nav>
									</div>
									<div class="col col-xs-3">
										<div class="pull-right">
											<button type="button" class="btn btn-primary">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
												Add row
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<p class="navbar-text">A simple example of how-to put a
								bordered table within a panel. Responsive, place holders in
								header/footer for buttons or pagination.</p>
						</div>
					</nav>
				</div>
			</div>
			<!-- END fh5co-contact -->

			<!-- END map -->


			<jsp:include page="footer.jsp" />


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
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

</body>
</html>

