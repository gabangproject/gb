<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- �Ź���� ���� bootstrap -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css"> -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../main/js/bootstrap.min.js"></script>


<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({players:["iframe"]});
function idcheck()
{
	Shadowbox.open({
		content:'../member/idcheck.jsp',
		title:'���̵��ߺ�üũ',
		player:'iframe',
		width:300,
		height:200
	});
}
function nickcheck()
{
	Shadowbox.open({
		content:'../member/nickcheck.jsp',
		title:'�г��� �ߺ�üũ',
		player:'iframe',
		width:300,
		height:200
	});
}
$(function(){
	/* $('.seller').attr("required",false); */
	var password = document.getElementById("password");
	var confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
		
	if(password.value != confirm_password.value) {
	  confirm_password.setCustomValidity("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	} else {
	  confirm_password.setCustomValidity('');
	}

	}

	 password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword; 
	
	$('#sellerform').hide();
	$('#seller').click(function(){
		$('#sellerform').toggle();
		
		var check=$('#seller').prop( "checked" );
		if(check==true)
			{
			$('#sellerform input').attr("required",true);
			}
		else
			{
			$('#sellerform input').attr("required",false);
			}
		
			
		
	})
});
</script>
<!-- �Ź���� ���� bootstrap �� -->
</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section" style="padding: 98px">
		<div class="container">
			
			<div class="row">
				 <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>ȸ������</h3>
				</div>
			</div>


		<!-- ȸ������ �� �߰��� ��� �� -->
		
			<div class="row">

				<form class="form-horizontal" id="join" name="frm" method="post" action="../member/join_ok.jsp">
					
					<fieldset form="join">
					
					<!-- <legend class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					ȸ������
					</legend> -->
					
					<!-- ID�Է�-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="id">���̵�
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="id" name="id" type="text" placeholder="UserID (Email)" class="form-control" required>
						</div>
						<input type=button class='btn btn-sm' value='�ߺ�üũ' onclick="idcheck()">
					</div>


					<!-- ��й�ȣ �Է�-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="password">��й�ȣ
							<font size="2" color=red> (��й�ȣ 8~12�� �Է�)</font>
						</label>
						<div class="col-md-3">
							<input id="password" minlength="8" maxlength="12" name="password" type="password" placeholder="password"
								class="form-control" required>
						</div>
						<div class="col-md-3">
							<input id="confirm_password" name="confirm_password" type="password" placeholder="Re-type password"
								class="form-control" required>
						</div>
					</div>


					<!-- �̸�-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name">�̸�</label>
						<div class="col-md-2">
							<input id="name" name="name" type="text" placeholder="�̸�" class="form-control" required>
						</div>
					</div>


					<!-- �г���-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nick">����</label>
						<div class="col-md-2">
							<input id="nick" name="nick" type="text" placeholder="�г���" class="form-control" required>
						</div>
						<input type=button class='btn btn-sm' value='�ߺ�üũ'	onclick="nickcheck()">
					</div>


					<!-- ��ȭ��ȣ -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="phone">��ȭ��ȣ</label>
						<div id="phone">
							<div class="col-xs-1">
								<select class="form-control" name="phone1">
									<option>010</option>
									<option>02</option>
									<option>031</option>
									<option>032</option>
									<option>053</option>
									<option>041</option>
								</select>
							</div>
							<div class="col-xs-2">
								<input id="phone2" name="phone2" type="text" class="form-control" required>
							</div>
						</div>
					</div>

					<!-- ���� -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="radios">����</label>
						<div class="col-md-4">
							<div class="radio">
								<label class="radios-0" for="gender-0">
									<input type="radio" name="gender" id="gender-0" value="0" checked="checked"> ����
								</label>
								
								<label class="radios-1" for="gender-1">
									<input type="radio" name="gender" id="gender-1" value="1">����
								</label>
							</div>
						</div>
					</div>

					 <!-- �����߰��� ��Ͽ��� -->

					<div class="form-group">
						<label class="col-md-4 control-label" for="seller">�����߰��� ��Ͽ���</label>
						<div class="col-md-4" style="padding-top: 7px">
							<input type="checkbox" class="form-check-input" id="seller" name="seller" value="">
							<label class="form-check-label" for="seller">����� ���Ͻø� üũ��	�ּ���</label>
						</div>
					</div>
				
					</fieldset>

					<!-- �����߰��� ����ϰڴٴ� ǥ�ø� ������ ������� Ȱ��ȭ -->

					
					<fieldset id="sellerform" form="join">
						<!-- �����߰��� ��� -->
						<legend style="text-align: center;">�����߰��� ���</legend>

						<!-- �����߰��� ��ȣ�Է� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="slicense">�����߰��� �ڰ�����ȣ</label>
							<div class="col-md-4">
								<input id="license" name="license" type="text" placeholder="-�� ���� ��� �����Ͽ� �Է����ּ���"
									class="form-control">
							</div>
							<input type="file" value="�߰������ ÷��">
						</div>


						<!-- ��ȣ�� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="company_name">��ȣ��</label>
							<div class="col-md-3">
								<input id="company_name" name="company_name" type="text" class="form-control">
							</div>
						</div>
						
						<!-- �߰��� ���� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="photo">�߰��� �� �߰��� ���� ���</label>
							<div class="col-md-3">
								<input id="photo" name="photo" type="file">
							</div>
						</div>


						<!-- ��ȣ ��ȭ��ȣ-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="company_tel">��ȣ ��ȭ��ȣ</label>
							<div id="company_tel">
								<div class="col-xs-1">
									<select class="form-control" name="company_tel1">
										<option>010</option>
										<option>02</option>
										<option>031</option>
										<option>032</option>
										<option>053</option>
										<option>041</option>
									</select>
								</div>
								<div class="col-xs-2">
									<input id="company_tel2" name="company_tel2" type="text" class="form-control">
								</div>
							</div>
						</div>
						
						</fieldset>
						
						
					
					<!-- seller form �� -->
					
					
					<div class="form-group" style="text-align: center">
						<input type=submit id="join" name="join" class="btn" value="����">
						<input type=button id="cencel" name="cencel" class="btn btn-primary" value="���">
					</div>
				
					
				</form>
				<!-- ȸ������ �� �߰��� ��� �� �� -->
				
			
		</div> 
			<!-- row �� -->
	</div>
		<!-- container ��  -->

</div>
<!-- work-section �� -->
		
	

</body>
</html>