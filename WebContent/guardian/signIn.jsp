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


<!-- �Ź���� ���� bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
Shadowbox.init({players:["iframe"]});
function idcheck()
{
	window.open({
		content:'../guardian/idcheck.jsp',
		title:'���̵��ߺ�üũ',
		player:'iframe',
		width:300,
		height:200
	});
}
</script>
<!-- �Ź���� ���� bootstrap �� -->
	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
		

			<!-- header ����  -->
			
			<jsp:include page="header.jsp"/>
			<!-- header �� -->
		

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
		
		<!-- ȸ������ �� �߰��� ��� �� -->
			<div class="container">
			<div class="row">
			<form class="form-horizontal">
		<fieldset>
		
		<!-- ȸ������ â -->
		<legend>ȸ������</legend>
		
		<!-- ID�Է�-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="Name">���̵�</label>  
		  <div class="col-md-2"> 
		  <input id="Name" name="Name" type="text" placeholder="UserID (Email)" class="form-control input-md" required=""></div>
			<input type=button class='btn btn-sm' value='�ߺ�üũ' onclick="idcheck()">
		</div>
		
		<!-- ��й�ȣ �Է�-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="passwordinput">��й�ȣ <font size="2" color=red> (��й�ȣ 8~10�� �Է�)</font></label>
		  	<div class="col-md-3">
		    <input id="passwordinput" name="passwordinput" type="password" placeholder="" class="form-control input-md" required=""></div>
		    <div class="col-md-3">
		    <input id="confirm_password" name="confirm_password" type="password" placeholder="Re-type password" class="form-control input-md" required="">
			</div>
		</div>
		
		<!-- �̸�-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">�̸�</label>
		  <div class="col-md-2">
		    <input id="name" name="confirm_password" type="text" placeholder="name" class="form-control input-md" required="">
		  </div>
		</div>
		
		<!-- �г���-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">����</label>
		 	 <div class="col-md-2">
		    <input id="nick" name="confirm_password" type="text" placeholder="nickname" class="form-control input-md" required="">
		     </div>
		    <input type=button class='btn btn-sm' value='�ߺ�üũ'>
		</div>
		
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">��ȭ��ȣ</label>
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
		
		<!-- ���� -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="gender">����</label>
		  <div class="col-md-4"> 
		    <label class="radio-inline" for="gender-0">
		      <input type="radio" name="gender" id="gender-0" value="Male" checked="checked">
		      	����	
		    </label> 
		    <label class="radio-inline" for="gender-1">
		      <input type="radio" name="gender" id="gender-1" value="Female">
		      	����
		    </label>
		  </div>
		</div>
		<!-- �����߰��� ��� -->
		<legend>�����߰��� ���</legend>
		
		<!-- �����߰��� ��ȣ�Է� -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">�����߰��� �ڰ�����ȣ</label>
		  <div class="col-md-4">
		    <input id="name" name="confirm_password" type="text" placeholder="-�� ���� ��� �����Ͽ� �Է����ּ���" class="form-control input-md" required="">
		  </div>
		   <input type=button class='btn btn-sm' value='���'>
		</div>
		
		<!-- ��ȣ�� -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">��ȣ��</label>
		  <div class="col-md-3">
		    <input id="name" name="confirm_password" type="text" class="form-control input-md" required="">
		  </div>
		</div>
		
		<!-- ��ȣ ��ȭ��ȣ-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="confirm_password">��ȣ ��ȭ��ȣ</label>
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
   			 <button id="login" name="login" class="btn">ȸ������</button>
  			 <button id="cencel" name="cencel" class="btn btn-primary">���</button>
  		</div>
	</div>
		</div>
		
		</fieldset>
		</form>
			</div>
		</div>
		<!-- ȸ������ �� �߰��� ��� �� �� -->
		<!-- END fh5co-contact -->
		
		<!-- footer ���� -->

	<jsp:include page="footer.jsp"/>
	
	<!-- footer ��-->
	

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

