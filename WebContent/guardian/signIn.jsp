<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<!-- �Ź���� ���� bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	Shadowbox.init({
		players : [ "iframe" ]
	});
	function idcheck() {
		window.open({
			content : '../guardian/idcheck.jsp',
			title : '���̵��ߺ�üũ',
			player : 'iframe',
			width : 300,
			height : 200
		});
	}
</script>
<!-- �Ź���� ���� bootstrap �� -->
</head>
<body>



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

	<!-- ȸ������ �� �߰��� ��� �� -->
	<div class="container">
		<div class="row">
			<fieldset>
				<form class="form-horizontal">


					<!-- ȸ������ â -->
					<legend>ȸ������</legend>

					<!-- ID�Է�-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="Name">���̵�</label>
						<div class="col-md-2">
							<input id="Name" name="Name" type="text"
								placeholder="UserID (Email)" class="form-control input-md"
								required="">
						</div>
						<input type=button class='btn btn-sm' value='�ߺ�üũ'
							onclick="idcheck()">
					</div>

					<!-- ��й�ȣ �Է�-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">��й�ȣ
							<font size="2" color=red> (��й�ȣ 8~10�� �Է�)</font>
						</label>
						<div class="col-md-3">
							<input id="passwordinput" name="passwordinput" type="password"
								placeholder="" class="form-control input-md" required="">
						</div>
						<div class="col-md-3">
							<input id="confirm_password" name="confirm_password"
								type="password" placeholder="Re-type password"
								class="form-control input-md" required="">
						</div>
					</div>

					<!-- �̸�-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">�̸�</label>
						<div class="col-md-2">
							<input id="name" name="confirm_password" type="text"
								placeholder="name" class="form-control input-md" required="">
						</div>
					</div>

					<!-- �г���-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">����</label>
						<div class="col-md-2">
							<input id="nick" name="confirm_password" type="text"
								placeholder="nickname" class="form-control input-md" required="">
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
							<input id="phone2" name="phone2" type="text"
								class="form-control input-xs" required="">
						</div>
						<div class="col-xs-2">
							<input id="phone3" name="phone3" type="text"
								class="form-control input-xs" required="">
						</div>
					</div>

					<!-- ���� -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="gender">����</label>
						<div class="col-md-4">
							<label class="radio-inline" for="gender-0"> <input
								type="radio" name="gender" id="gender-0" value="Male"
								checked="checked"> ����
							</label> <label class="radio-inline" for="gender-1"> <input
								type="radio" name="gender" id="gender-1" value="Female">
								����
							</label>
						</div>
					</div>
					<!-- �����߰��� ��� -->
					<legend>�����߰��� ���</legend>

					<!-- �����߰��� ��ȣ�Է� -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">�����߰���
							�ڰ�����ȣ</label>
						<div class="col-md-4">
							<input id="name" name="confirm_password" type="text"
								placeholder="-�� ���� ��� �����Ͽ� �Է����ּ���" class="form-control input-md"
								required="">
						</div>
						<input type=button class='btn btn-sm' value='���'>
					</div>

					<!-- ��ȣ�� -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">��ȣ��</label>
						<div class="col-md-3">
							<input id="name" name="confirm_password" type="text"
								class="form-control input-md" required="">
						</div>
					</div>

					<!-- ��ȣ ��ȭ��ȣ-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">��ȣ
							��ȭ��ȣ</label>
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
							<input id="phone2" name="phone2" type="text"
								class="form-control input-xs" required="">
						</div>
						<div class="col-xs-2">
							<input id="phone3" name="phone3" type="text"
								class="form-control input-xs" required="">
						</div>
					</div>

					<div class="form-group">
						<div style="text-align: center">
							<button id="login" name="login" class="btn">ȸ������</button>
							<button id="cencel" name="cencel" class="btn btn-primary">���</button>
						</div>
					</div>
					
				</form>
			</fieldset>

		</div>


	</div>

	<!-- ȸ������ �� �߰��� ��� �� �� -->
	






</body>
</html>

