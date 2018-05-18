<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- �����ȣ �˻�â  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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

<!-- �ּҰ˻� ��ư ������ ������ �ִ� �ּҰ˻�â���� �̵� -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample4_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
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
								<input type="text" id="sample4_postcode" class="form-control input-md" placeholder="�����ȣ">
								<input type="text" id="sample4_roadAddress" class="form-control input-md" placeholder="���θ��ּ�">
								<input type="text" id="sample4_jibunAddress" class="form-control input-md" placeholder="�����ּ�">
								<input type="text" class="form-control input-md" placeholder="���ּ�">
								<span id="guide" style="color:#999"></span> <!-- �ּҸ� Ŭ���ϸ� â�� ������� -->
								</div>
								<input type=button class='btn btn-sm' onclick="sample4_execDaumPostcode()" value="�ּҰ˻�">
							</tr>
						</div>


						<!-- �ŷ����� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�ŷ�����</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-0"> 
									<input type="radio" name="radios0" id="radios-0" value="1" checked="checked">
									����
									</label> 
									<label for="radios-1"> 
									<input type="radio" name="radios0" id="radios-1" value="2">
									 ����
									</label> 
									<label for="radios-2"> 
									<input type="radio" name="radios0" id="radios-2" value="3"> 
									��Ÿ
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
							<label class="col-md-4 control-label" for="mobno">������ �����׸�</label>
							<div class="col-md-4">
								<input type="checkbox" name="chk_info" value="���⼼">���⼼
								<input type="checkbox" name="chk_info" value="������">������<br>
								<input type="checkbox" name="chk_info" value="������">������
								<input type="checkbox" name="chk_info" value="���ͳ�">���ͳ�
								<input type="checkbox" name="chk_info" value="��Ÿ">��Ÿ
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
						
						<!-- �ش���  -->
						<div class="form-group" id="�ش���">
							<label class="col-md-4 control-label" for="mobno">��ü/�ش���</label>
							<div class="col-md-1">
								<input type="text" id="floor" class="form-control input-md">
							</div>
							<div style="float: left; width: 4%;">��ü��</div>
							<div class="col-md-1">
								<input type="text" id="floor2" class="form-control input-md">
							</div>
							<div style="float: left; width: 4%;">�ش���</div>
						</div>
						
						<!-- ������  -->
						<div class="form-group row" id="������" >
							<label class="col-md-4 control-label" for="mobno">������</label>
								<div class="col-md-1">
								<input type="text" id="million" class="form-control input-md">
								</div>
								<div style="float: left; width: 2%;">��</div>
								<div class="col-md-1">
								<input type="text" id="won" class="form-control input-md">
								</div>
								<div style="float: left; width: 4%;">����</div>
								
						</div>
						
						<!-- ������� --> 
						<div class="form-group row" id="�������" >
							<label class="col-md-4 control-label" for="mobno">����/���޸���</label>
								<div class="col-md-1">
								<input type="text" id="" class="form-control input-md" placeholder="�������">
								</div>
								<div style="float: left; width: 2%;">m^2</div>
								<div class="col-md-1">
								<input type="text" id="" class="form-control input-md" placeholder="���޸���">
								</div>
								<div style="float: left; width: 4%;">m^2</div>
						</div>
						
						<!-- ����÷��  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="file">����÷��</label>
							<div class="col-md-4">
							<input id="fileInput"
								filestyle="" type="file" data-class-button="btn btn-default"
								data-class-input="form-control" data-button-text=""
								data-icon-name="fa fa-upload" class="form-control" tabindex="-1"
								style="position: absolute; clip: rect(0px, 0px, 0px, 0px);">

							<div class="bootstrap-filestyle input-group">

								<input type="text" id="userfile" class="form-control"
									name="userfile" disabled="">
									<span class="group-span-filestyle input-group-btn" tabindex="0">
									<label for="fileInput" class="btn btn-default "> 
									<span class="glyphicon fa fa-upload"></span>
										</div>
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

