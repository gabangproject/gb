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
function openIdChk(){
    
    window.name = "parentForm";
    window.open("../member/idcheck.jsp",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
}
</script>
<!-- �Ź���� ���� bootstrap �� -->
</head>
<body>



	
	<!-- end:header-top -->
<div id="fh5co-work-section" style="padding:98px">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>ȸ������</h3>
						</div>
					</div>
				</div>


	<!-- ȸ������ �� �߰��� ��� �� -->
	<div class="container">
		<div class="row">
			<fieldset>
				<form class="form-horizontal">

					<!-- ID�Է�-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="Name">���̵�</label>
						<div class="col-md-2">
							<input id="Name" name="Name" type="text"
								placeholder="UserID (Email)" class="form-control input-md"
								required="">
						</div>
						<input type=button class='btn btn-sm' value='�ߺ�üũ'
							onclick="openIdChk()">
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
						<input type="button" value="���" class='btn btn-sm'>

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
							<input type=submit id="login" name="login" class="btn" value="����">
							<input type=button id="cencel" name="cencel" class="btn btn-primary" value="���">
						</div>
					</div>		
				</form>
			</fieldset>
		</div>
	</div>
	<!-- ȸ������ �� �߰��� ��� �� �� -->
</div>
</body>
</html>