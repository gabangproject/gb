<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css")
	;

@import
	url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700')
	;

h2 {
	float: left;
	width: 100%;
	color: #fff;
	margin-bottom: 40px;
	font-size: 14px;
	position: relartive;
	z-index: 3;
	margin-top: 30px
}

h2 span {
	font-family: 'Libre Baskerville', serif;
	display: block;
	font-size: 45px;
	text-transform: none;
	margin-bottom: 20px;
	margin-top: 30px;
	font-weight: 700
}

h2 a {
	color: #fff;
	font-weight: bold;
}

body {
	background: #24C6DC; /* fallback for old browsers */
	background: -webkit-linear-gradient(to bottom, #514A9D, #24C6DC);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to bottom, #514A9D, #24C6DC);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

.head {
	float: left;
	width: 100%;
}

.search-box {
	width: 95%;
	margin: 0 auto 40px;
	border: 1px solid black;
	
}

.listing-block {
	background: #fff;
	height: 500px;
	padding-top: 20px;
	overflow-y: scroll;
}

.media {
	background: #fff;
	position: relative;
	margin-bottom: 15px;
}

.media img {
	width: 200px;
	margin: 0;
	height: 136px;
}

.media-body {
	border: 1px solid #bcbcbc;
	border-left: 0;
	height: 136px;
}

.media .price {
	float: left;
	width: 100%;
	font-size: 30px;
	font-weight: 600;
	color: #4765AB;
}

.media .price small {
	display: block;
	font-size: 17px;
	color: #232323;
}

.media .stats {
	float: left;
	width: 100%;
	margin-top: 10px;
}

.media .stats span {
	float: left;
	margin-right: 10px;
	font-size: 15px;
}

.media .stats span i {
	margin-right: 7px;
	color: #4765AB;
}

.media .address {
	float: left;
	width: 100%;
	font-size: 14px;
	margin-top: 5px;
	color: #888;
}

.media .fav-box {
	position: absolute;
	right: 10px;
	font-size: 20px;
	top: 4px;
	color: #E74C3C;
}

.map-box {
	background-color: #A3CCFF;
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
						<h2>�Ź� ��� ��� ����</h2>
					</div>
				</div>
			</div>
			<!-- end:header-top -->
			<section class="head">
				<div class="container">
					<h2 class="text-center">
						<span>�Ź� ��� ���</span>
					</h2>
				</div>
			</section>
			
			<div class="clearfix"></div>
			<section class="search-box">
				<div class="container-fluid">
					<div class="row">
					
					<!--���� ���� �κ�  -->
						<div class="col-md-7 map-box mx-0 px-0">
							<iframe width="100%" height="495" frameborder="0" scrolling="no"
								marginheight="0" marginwidth="0"
								src="https://maps.google.co.uk/maps?f=q&source=s_q&hl=en&geocode=&815&sspn=8.047465,13.666992&ie=UTF8&hq=&hnear=15+Springfield+Way,+Hythe+CT21+5SH,+United+Kingdom&t=m&z=14&ll=51.077429,1.121722&output=embed"></iframe>
						</div>
					<!-- ���� ���� �κ� -->
					
						<div class="col-md-5 listing-block">

							
							
							<!-- ���� ũ�� ��ȯ�� ���� �ش� ���� �ȿ� ���ԵǾ� �ִ� �Ź����� ����Ʈ ��� �κ� -->
						<c:forEach var="i" begin="1" end="5">
							<div class="media">
								<div class="fav-box">
									<i class="fa fa-heart-o" aria-hidden="true"></i>
								</div>
								
								<img class="d-flex align-self-start"
									src="https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?h=350&auto=compress&cs=tinysrgb"
									alt="Generic placeholder image">
								<div class="media-body pl-3">
									<div class="price">
										$799,000<small>New York</small>
									</div>
									<div class="stats">
										<span><i class="fa fa-arrows-alt"></i>1678 Sq ft</span> <span><i
											class="fa fa-bath"></i>2 Beadrooms</span>
									</div>
									<div class="address">4062 Walnut Hill Drive Cincinnati</div>
								</div>
							</div>
							</c:forEach>
					<!-- ���� ũ�� ��ȯ�� ���� �ش� ���� �ȿ� ���ԵǾ� �ִ� �Ź����� ����Ʈ ��� �κ� -->
					
						</div>
					
						
						

					</div>
					
					
				</div>
				
			</section>
			

		
	
</body>
</html>

