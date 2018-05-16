<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
@import
	url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css')
	;

#team {
	background: #eee !important;
}

.btn-primary:hover, .btn-primary:focus {
	background-color: #108d6f;
	border-color: #108d6f;
	box-shadow: none;
	outline: none;
}

.btn-primary {
	color: #fff;
	background-color: #007b5e;
	border-color: #007b5e;
}

section {
	padding: 60px 0;
}

section .section-title {
	text-align: center;
	color: #007b5e;
	margin-bottom: 50px;
	text-transform: uppercase;
}

#team .card {
	border: none;
	background: #ffffff;
}

.image-flip:hover .backside, .image-flip.hover .backside {
	-webkit-transform: rotateY(0deg);
	-moz-transform: rotateY(0deg);
	-o-transform: rotateY(0deg);
	-ms-transform: rotateY(0deg);
	transform: rotateY(0deg);
	border-radius: .25rem;
}

.image-flip:hover .frontside, .image-flip.hover .frontside {
	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.mainflip {
	-webkit-transition: 1s;
	-webkit-transform-style: preserve-3d;
	-ms-transition: 1s;
	-moz-transition: 1s;
	-moz-transform: perspective(1000px);
	-moz-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transition: 1s;
	transform-style: preserve-3d;
	position: relative;
}

.frontside {
	position: relative;
	-webkit-transform: rotateY(0deg);
	-ms-transform: rotateY(0deg);
	z-index: 2;
	margin-bottom: 30px;
}

.backside {
	position: absolute;
	top: 0;
	left: 0;
	background: white;
	-webkit-transform: rotateY(-180deg);
	-moz-transform: rotateY(-180deg);
	-o-transform: rotateY(-180deg);
	-ms-transform: rotateY(-180deg);
	transform: rotateY(-180deg);
	-webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	-moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
}

.frontside, .backside {
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transition: 1s;
	-webkit-transform-style: preserve-3d;
	-moz-transition: 1s;
	-moz-transform-style: preserve-3d;
	-o-transition: 1s;
	-o-transform-style: preserve-3d;
	-ms-transition: 1s;
	-ms-transform-style: preserve-3d;
	transition: 1s;
	transform-style: preserve-3d;
}

.frontside .card, .backside .card {
	min-height: 312px;
}

.backside .card a {
	font-size: 18px;
	color: #007b5e !important;
}

.frontside .card .card-title, .backside .card .card-title {
	color: #007b5e !important;
}

.frontside .card .card-body img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
}
</style>
</head>
<body>
	


			<div class="fh5co-hero fh5co-hero-2">
				<div class="fh5co-overlay"></div>
				<div class="fh5co-cover fh5co-cover_2 text-center"
					data-stellar-background-ratio="0.5"
					style="background-image: url(images/blog-2.jpg);">
					<div class="desc animate-box">
						<h2>좋아요 많은 업자 출력 예시</h2>
					</div>
				</div>
			</div>
			<!-- end:header-top -->


			<section id="team" class="pb-5">
				<div class="container">
					<h5 class="section-title h1">Best Seller</h5>
					<div class="row">
					
					
					
						<!-- best 좋아요 업자 출력 -->
					
					<c:forEach var="i" begin="1" end="6">
						<div class="col-xs-12 col-sm-6 col-md-4">
							<div class="frontside">
								<div class="card">
									<div class="card-body text-center">
										<p>
											<img class=" img-fluid"
												src="https://sunlimetech.com/portfolio/boot4menu/assets/imgs/team/img_01.png"
												alt="card image">
										</p>
										<h4 class="card-title">홍길동</h4>
										<p class="card-text">This is basic card with image on top,
											title, description and button.</p>
											
									<!-- 좋아요 부분 -->
											<div>
												<span> 
													<i id="like4" class="glyphicon glyphicon-thumbs-up" style="margin:10px">10</i> 
														
													<i id="dislike4" class="glyphicon glyphicon-thumbs-down">10</i>	
												</span>
											</div>
									<!-- 좋아요 부분 -->
											<br>
											<a href="list.jsp" class="btn btn-primary btn-sm">
											<i class="fa fa-plus">해당 매물 보기</i>
										</a>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
				<!-- best 좋아요 업자 출력 -->
			</div>
		</div>
	</section>


	

</body>
</html>

