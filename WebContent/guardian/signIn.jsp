<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Guardian &mdash; 100% Free Fully Responsive HTML5 Template by FREEHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
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
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300' rel='stylesheet' type='text/css'>
	
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


<!-- 매물등록 관련 bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
Shadowbox.init({players:["iframe"]});
function idcheck()
{
	window.open({
		content:'../guardian/idcheck.jsp',
		title:'아이디중복체크',
		player:'iframe',
		width:300,
		height:200
	});
}
</script>
<!-- 매물등록 관련 bootstrap 끝 -->
	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
		

			<!-- header 시작  -->
			
			<jsp:include page="header.jsp"/>
			<!-- header 끝 -->
		

		<div class="fh5co-hero fh5co-hero-2">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover fh5co-cover_2 text-center" data-stellar-background-ratio="0.5" style="background-image: url(images/blog-3.jpg);">
				<div class="desc animate-box">
					<h2>Contact Us</h2>
					<span>Lovely Crafted by <a href="http://frehtml5.co/" target="_blank" class="fh5co-site-name">FREEHTML5.co</a></span>
				</div>
			</div>
		</div>
		<!-- end:header-top -->
		
		<!-- 회원가입 및 중개사 등록 폼 -->
			<div class="container">
			<div class="row">
			<form class="form-horizontal">
		<fieldset>
		
		<!-- 회원가입 창 -->
		<legend>회원가입</legend>
		
		<!-- ID입력-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="Name">아이디</label>  
		  <div class="col-md-2"> 
		  <input id="Name" name="Name" type="text" placeholder="UserID (Email)" class="form-control input-md" required=""></div>
			<input type=button class='btn btn-sm' value='중복체크' onclick="idcheck()">
		</div>
		
		<!-- 비밀번호 입력-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="passwordinput">비밀번호 <font size="2" color=red> (비밀번호 8~10자 입력)</font></label>
		  	<div class="col-md-3">
		    <input id="passwordinput" name="passwordinput" type="password" placeholder="" class="form-control input-md" required=""></div>
		    <div class="col-md-3">
		    <input id="confirm_password" name="confirm_password" type="password" placeholder="Re-type password" class="form-control input-md" required="">
			</div>
		</div>
		
		<!-- 이름-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">이름</label>
		  <div class="col-md-2">
		    <input id="name" name="confirm_password" type="text" placeholder="name" class="form-control input-md" required="">
		  </div>
		</div>
		
		<!-- 닉네임-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">별명</label>
		 	 <div class="col-md-2">
		    <input id="nick" name="confirm_password" type="text" placeholder="nickname" class="form-control input-md" required="">
		     </div>
		    <input type=button class='btn btn-sm' value='중복체크'>
		</div>
		
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">전화번호</label>
		  <div class="col-xs-2">
		    <select class="form-control" id="exampleFormControlSelect1">
			<option>010</option>
			<option>02</option>
			<option>031</option>
			<option>032</option>
			<option>053</option>
			<option>041</option>
			</select>
			</div>
			<div class="col-xs-2">
		  	<input id="phone2" name="phone2" type="text" class="form-control input-xs" required="">
		  	</div>
		  	<div class="col-xs-2">
			<input id="phone3" name="phone3" type="text" class="form-control input-xs" required="">
			</div>
		</div>
		
		<!-- 성별 -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="gender">성별</label>
		  <div class="col-md-4"> 
		    <label class="radio-inline" for="gender-0">
		      <input type="radio" name="gender" id="gender-0" value="Male" checked="checked">
		      	남자	
		    </label> 
		    <label class="radio-inline" for="gender-1">
		      <input type="radio" name="gender" id="gender-1" value="Female">
		      	여자
		    </label>
		  </div>
		</div>
		<!-- 공인중개사 등록 -->
		<legend>공인중개사 등록</legend>
		
		<!-- 공인중개사 번호입력 -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">공인중개사 자격증번호</label>
		  <div class="col-md-4">
		    <input id="name" name="confirm_password" type="text" placeholder="-가 있을 경우 포함하여 입력해주세요" class="form-control input-md" required="">
		  </div>
		   <input type=button class='btn btn-sm' value='등록'>
		</div>
		
		<!-- 상호명 -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">상호명</label>
		  <div class="col-md-3">
		    <input id="name" name="confirm_password" type="text" class="form-control input-md" required="">
		  </div>
		</div>
		
		<!-- 상호 전화번호-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">상호 전화번호</label>
		  <div class="col-xs-2">
		    <select class="form-control" id="exampleFormControlSelect1">
			<option>010</option>
			<option>02</option>
			<option>031</option>
			<option>032</option>
			<option>053</option>
			<option>041</option>
			</select>
			</div>
			<div class="col-xs-2">
		  	<input id="phone2" name="phone2" type="text" class="form-control input-xs" required="">
		  	</div>
		  	<div class="col-xs-2">
			<input id="phone3" name="phone3" type="text" class="form-control input-xs" required="">
			</div>
		</div>
		
	<div class="form-group">
  		<div style="text-align:center">
   			 <button id="login" name="login" class="btn">회원가입</button>
  			 <button id="cencel" name="cencel" class="btn btn-primary">취소</button>
  		</div>
	</div>
		</div>
		
		</fieldset>
		</form>
			</div>
		</div>
		<!-- 회원가입 및 중개사 등록 폼 끝 -->
		<!-- END fh5co-contact -->
		
		<!-- footer 시작 -->

	<jsp:include page="footer.jsp"/>
	
	<!-- footer 끝-->
	

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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	</body>
</html>

