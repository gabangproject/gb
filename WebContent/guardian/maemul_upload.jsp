
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
	$("#fileInput").on('change', function(){  // ���� ����Ǹ�
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();  // ���ϸ� ����
		}
		// ������ ���ϸ� ����
		$("#userfile").val(filename);
	});
});
</script>


<!-- ȸ������ ���� bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- ȸ������ ���� bootstrap �� -->




</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">


			<!-- header ����  -->

			<jsp:include page="header.jsp" />
			<!-- header �� -->


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

			<!-- �Ź� ��� �� -->
			<div class="container">
				<div class="row">
					<form class="form-horizontal">
						<fieldset>

							<!-- �Ź���� â -->
							<legend>�Ź����</legend>

							<!-- �Ź��ּ� -->
							<div class="form-group">
								<tr>
									<label class="col-md-4 control-label" for="firstname">�Ź��ּ�</label>
									<div class="col-md-3">
										<input id="firstname" name="firstname" type="text"
											placeholder="�⺻�ּ�" class="form-control input-md" size=20>
										<input id="firstname" name="firstname" type="text"
											placeholder="���ּ�" class="form-control input-md" size=20>
									</div>
									<input type=button class='btn btn-sm' value='�ּҰ˻�'>
								</tr>
							</div>


							<!-- �ŷ����� -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">�ŷ�����</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-0"> <input type="radio"
											name="radios0" id="radios-0" value="1" checked="checked">
											����
										</label> <label for="radios-1"> <input type="radio"
											name="radios0" id="radios-1" value="2"> ����
										</label> <label for="radios-2"> <input type="radio"
											name="radios0" id="radios-2" value="3"> ��Ÿ
										</label>
									</div>
								</div>
							</div>

							<!-- �ְ����� -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">�ְ�����</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-3"> <input type="radio"
											name="radios1" id="radios-3" value="3" checked="checked">
											����
										</label> <label for="radios-4"> <input type="radio"
											name="radios1" id="radios-4" value="4"> ����
										</label> <label for="radios-5"> <input type="radio"
											name="radios1" id="radios-5" value="5"> ����
										</label> <label for="radios-6"> <input type="radio"
											name="radios1" id="radios-6" value="6"> ���ǽ���
										</label>
									</div>
								</div>
							</div>



							<!-- ������ -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="mobno">������</label>
								<div class="col-md-4">
									<select
										class="custom-select mdb-select colorful-select dropdown-primary">
										<option selected>������ �����׸�</option>
										<option>���⼼</option>
										<option>������</option>
										<option>������</option>
										<option>���ͳ�</option>
										<option>��Ÿ</option>
									</select>
								</div>
							</div>

							<!-- ���������� ����  -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">����������</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-7"> <input type="radio"
											name="radios2" id="radios-7" value="7" checked="checked">
											����
										</label> <label for="radios-8"> <input type="radio"
											name="radios2" id="radios-8" value="8"> ����
										</label>
									</div>

								</div>
							</div>

							<!-- ��������  -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="radios">��������</label>
								<div class="col-md-4">
									<div class="radio">
										<label for="radios-9"> <input type="radio"
											name="radios3" id="radios-9" value="9" checked="checked">
											����
										</label> <label for="radios-10"> <input type="radio"
											name="radios3" id="radios-10" value="10"> ����
										</label>
									</div>

								</div>
							</div>

							<!-- �ǹ�����  -->
							<div class="form-group" id="�ǹ�����">
								<label class="col-md-4 control-label" for="mobno">�ǹ�����</label>
								<div class="col-md-4">
									<select class="custom-select">
										<option selected>�ǹ� ������ �Է��ϼ���</option>

										<option value="1">1��</option>
										<option value="2">2��</option>
										<option value="3">3��</option>
										<option value="4">4��</option>
										<option value="5">5��</option>
									</select>
								</div>
							</div>
									
								<!-- ����÷��  -->
							<div class="form-group">
								<label for="InputSubject1">����÷��</label>
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
						<button id="login" name="login" class="btn">���</button>
						<button id="cencel" name="cencel" class="btn btn-primary">���</button>
					</div>
				</div>
				</fieldset>
				</form>
			</div>
		</div>
	<!-- ȸ������ �� �߰��� ��� �� �� -->
	<!-- END fh5co-contact -->

	<!-- footer ���� -->

	<jsp:include page="footer.jsp" />

	<!-- footer ��-->


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

