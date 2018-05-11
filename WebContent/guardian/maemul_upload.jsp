
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#fileInput").on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
		// 추출한 파일명 삽입
		$("#userfile").val(filename);
	});
});
</script>


<!-- 회원가입 관련 bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 회원가입 관련 bootstrap 끝 -->




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

			<!-- 매물 등록 폼 -->
			<div class="container">
				<div class="row">
					<form class="form-horizontal">
						<fieldset>

							<!-- 매물등록 창 -->
							<legend>매물등록</legend>

							<!-- 매물주소 -->
							<div class="form-group">
								<tr>
									<label class="col-md-4 control-label" for="firstname">매물주소</label>
									<div class="col-md-3">
										<input id="firstname" name="firstname" type="text"
											placeholder="기본주소" class="form-control input-md" size=20>
										<input id="firstname" name="firstname" type="text"
											placeholder="상세주소" class="form-control input-md" size=20>
									</div>
									<input type=button class='btn btn-sm' value='주소검색'>
								</tr>
							</div>


							<!-- 거래형태 -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">거래형태</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-0"> <input type="radio"
											name="radios0" id="radios-0" value="1" checked="checked">
											전세
										</label> <label for="radios-1"> <input type="radio"
											name="radios0" id="radios-1" value="2"> 월세
										</label> <label for="radios-2"> <input type="radio"
											name="radios0" id="radios-2" value="3"> 기타
										</label>
									</div>
								</div>
							</div>

							<!-- 주거형태 -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">주거형태</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-3"> <input type="radio"
											name="radios1" id="radios-3" value="3" checked="checked">
											원룸
										</label> <label for="radios-4"> <input type="radio"
											name="radios1" id="radios-4" value="4"> 투룸
										</label> <label for="radios-5"> <input type="radio"
											name="radios1" id="radios-5" value="5"> 주택
										</label> <label for="radios-6"> <input type="radio"
											name="radios1" id="radios-6" value="6"> 오피스텔
										</label>
									</div>
								</div>
							</div>



							<!-- 관리비 -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="mobno">관리비</label>
								<div class="col-md-4">
									<select
										class="custom-select mdb-select colorful-select dropdown-primary">
										<option selected>관리비 포함항목</option>
										<option>전기세</option>
										<option>수도세</option>
										<option>가스비</option>
										<option>인터넷</option>
										<option>기타</option>
									</select>
								</div>
							</div>

							<!-- 엘리베이터 유무  -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">엘리베이터</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-7"> <input type="radio"
											name="radios2" id="radios-7" value="7" checked="checked">
											있음
										</label> <label for="radios-8"> <input type="radio"
											name="radios2" id="radios-8" value="8"> 없음
										</label>
									</div>

								</div>
							</div>

							<!-- 주차공간  -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">주차공간</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-9"> <input type="radio"
											name="radios3" id="radios-9" value="9" checked="checked">
											있음
										</label> <label for="radios-10"> <input type="radio"
											name="radios3" id="radios-10" value="10"> 없음
										</label>
									</div>

								</div>
							</div>

							<!-- 건물층수  -->
							<div class="form-group" id="건물층수">
								<label class="col-md-4 control-label" for="mobno">건물층수</label>
								<div class="col-md-4">
									<select class="custom-select">
										<option selected>건물 층수를 입력하세요</option>

										<option value="1">1층</option>
										<option value="2">2층</option>
										<option value="3">3층</option>
										<option value="4">4층</option>
										<option value="5">5층</option>
									</select>
								</div>
							</div>
									
								<!-- 파일첨부  -->
							<div class="form-group">
								<label for="InputSubject1">파일첨부</label>
								 <input id="fileInput"
									filestyle="" type="file" data-class-button="btn btn-default"
									data-class-input="form-control" data-button-text=""
									data-icon-name="fa fa-upload" class="form-control"
									tabindex="-1"
									style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">

								<div class="bootstrap-filestyle input-group">

								<input type="text" id="userfile" class="form-control"
										name="userfile" disabled="" > 
										<span class="group-span-filestyle input-group-btn" tabindex="0">

										<label for="fileInput" class="btn btn-default "> 
										<span class="glyphicon fa fa-upload"></span>
									</label>
									</span>
								</div>
							</div>
						</div>

				<div class="form-group">
					<div style="text-align: center">
						<button id="login" name="login" class="btn">등록</button>
						<button id="cencel" name="cencel" class="btn btn-primary">취소</button>
					</div>
				</div>
				</fieldset>
				</form>
			</div>
		</div>
	<!-- 회원가입 및 중개사 등록 폼 끝 -->
	<!-- END fh5co-contact -->

	<!-- footer 시작 -->

	<jsp:include page="footer.jsp" />

	<!-- footer 끝-->


	</div>
	<!-- END fh5co-page -->


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

