
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#fileInput").on(
						'change',
						function() { // ���� ����Ǹ�
							if (window.FileReader) { // modern browser
								var filename = $(this)[0].files[0].name;
							} else { // old IE
								var filename = $(this).val().split('/').pop()
										.split('\\').pop(); // ���ϸ� ����
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






	<div id="fh5co-work-section">
		<div class="container">
			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>�Ź����</h3>
				</div>
			</div>
		</div>

		<!-- �Ź� ��� �� -->
		<div class="container">
			<div class="row">
				<form class="form-horizontal">
					<fieldset>



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
								<select	class="form-control" id="exampleFormControlSelect1"">
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
							
								<select class="form-control" id="exampleFormControlSelect1">
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
							<label for="InputSubject1">����÷��</label> <input id="fileInput"
								filestyle="" type="file" data-class-button="btn btn-default"
								data-class-input="form-control" data-button-text=""
								data-icon-name="fa fa-upload" class="form-control" tabindex="-1"
								style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">

							<div class="bootstrap-filestyle input-group">

								<input type="text" id="userfile" class="form-control"
									name="userfile" disabled=""> <span
									class="group-span-filestyle input-group-btn" tabindex="0">

									<label for="fileInput" class="btn btn-default "> <span
										class="glyphicon fa fa-upload"></span>
								</label>
								</span>
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
	</div>
	</div>
</body>
</html>

