<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- �����ȣ �˻�â  -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<!-- <script type="text/javascript">
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
</script> -->

<!-- ȸ������ ���� bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('Address').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

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
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>�Ź����</h3>
				</div>
			</div>
		

		<!-- �Ź� ��� �� -->
		
			<div class="row">
			
				<!-- <div class="col-md-12" style="magrin:0px auto;"> -->
				
				<form id="maemul_upload" class="form-horizontal" enctype="multipart/form-data" action="../main/">
					
					<fieldset form="maemul_upload">

						<!-- �Ź��ּ� -->
						<div class="form-group">
							
								<label class="col-md-4 control-label" for="firstname">�Ź��ּ�</label>
								<div class="col-md-4">
								<input type="text" id="postcode" class="form-control" placeholder="�����ȣ">
								
								<input type="text" id="Address" class="form-control" placeholder="�ּ�" style="margin-top:5px;margin-bottom:5px;">
								
								<input type="text" id="jibunAddress" class="form-control" placeholder="�����ּ�" style="margin-bottom:5px;">
								
								<input type="text" id="detailAddress" class="form-control" placeholder="���ּ�">
								<span id="guide" style="color:#999"></span> <!-- �ּҸ� Ŭ���ϸ� â�� ������� -->
								</div>
								<input type=button class='btn btn-sm' onclick="sample4_execDaumPostcode()" value="�ּҰ˻�">
							
						</div>


						<!-- �ŷ����� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�ŷ�����</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-0"> 
										<input type="radio" name="radios0" id="radios-0" value="1" checked="checked"> ����
									</label> 
									<label for="radios-1"> 
										<input type="radio" name="radios0" id="radios-1" value="2"> ����
									</label> 
									<label for="radios-2"> 
									<input type="radio" name="radios0" id="radios-2" value="3"> �Ÿ�
									</label>
								</div>
							</div>
						</div>


						<!-- �ְ����� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�ְ�����</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-3">
									<input type="radio"	name="room_type" id="radios-3" value="0" checked="checked">���� 
									</label> 
									
									<label for="radios-4">
									<input type="radio" name="room_type" id="radios-4" value="1">����	
									</label> 
									
									<label for="radios-5"> 
									<input type="radio" name="room_type" id="radios-5" value="2">���ǽ���
									</label>
									
									<label for="radios-6">
									<input type="radio" name="room_type" id="radios-6" value="3">�ټ���/�ٰ���
									</label> 
								</div>
							</div>
						</div>
						
						
						<!-- ������  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="manage_fee">������</label>
								<div class="col-md-4">
									<input type="text" id="manage_fee" class="form-control">
								</div>
								<div style="float: left; width: 4%;">����</div>
						</div>
						
						
						<!-- ������ �����׸� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="opts">������ �����׸�</label>

							<div class="col-md-4">
							<div class="check">
								<label for="opt-0">
								<input type="checkbox" id="opt-0" name="opt" value="0">���⼼
								</label>
								<label for="opt-1">
								<input type="checkbox" id="opt-1" name="opt" value="1">������
								</label>
								<label for="opt-2">
								<input type="checkbox" id="opt-2" name="opt" value="2">������
								</label>
								<label for="opt-3">
								<input type="checkbox" id="opt-3" name="opt" value="3">���ͳ�
								</label>
								<label for="opt-4">
								<input type="checkbox" id="opt-4" name="opt" value="4">��Ÿ
								</label>
							</div>
							</div>
						</div>	


						<!-- ���������� ����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">����������</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-7">
									<input type="radio"	name="elev" id="radios-7" value="1" checked="checked">����
									</label>
									<label for="radios-8">
									<input type="radio"	name="elev" id="radios-8" value="0">����
									</label>
								</div>
							</div>
						</div>


						<!-- ��������  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">��������</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-9"> 
									<input type="radio"	name="parking_lot" id="radios-9" value="1" checked="checked">����
									</label>
									
									<label for="radios-10">
									<input type="radio" name="parking_lot" id="radios-10" value="0">�Ұ���
									</label>
								</div>

							</div>
						</div>
						
						
						<!-- �ش���  -->
						<div class="form-group">
						
							<label class="col-md-4 control-label" for="mobno">�ش���/��ü��</label>
							<div class="col-md-1">
								<input type="text" id="floor1" class="form-control">
							</div>
							<div style="float: left; width: 4%;">/</div>
							
							<div class="col-md-1">
								<input type="text" id="floor2" class="form-control">
							</div>
							<div style="float: left; width: 4%;">��ü��</div>
						</div>
						
						
						<!-- ������  -->
						<div class="form-group">
							<label class="col-md-4 control-label">������</label>
								<div class="col-md-1">
								<input type="text" id="deposit1" class="form-control">
								</div>
								<div style="float: left; width: 2%;">��</div>
								
								<div class="col-md-1">
								<input type="text" id="deposit2" class="form-control">
								</div>
								<div style="float: left; width: 4%;">����</div>
								
						</div>
						
						
						<!-- ����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" >����</label>
								<div class="col-md-1">
								<input type="text" id="monthly_lent1" class="form-control">
								</div>
								<div style="float: left; width: 2%;">��</div>
								
								<div class="col-md-1">
								<input type="text" id="monthly_lent2" class="form-control">
								</div>
								<div style="float: left; width: 4%;">����</div>
								
						</div>
						
						
						<!-- ������� --> 
						<div class="form-group">
							<label class="col-md-4 control-label" for="gross_area">�������</label>
								<div class="col-md-1">
								<input type="text" id="gross_area" class="form-control" placeholder="�������">
								</div>
								<div style="float: left; width: 2%;">m^2</div>
								
						</div>
						
						
						<!-- ����÷��  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="file">����÷��</label>
							<div class="col-md-4">
								<input type="file" name="filename[]" multiple="multiple" maxlength="2" style="apperance: none;
  									-webkit-apperance: none;" required> 
										
							</div>
						</div>
						
						
						<!-- ���ְ�����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="moving_date">���ְ�����</label>
							<div class="col-md-1">
								<input type="text" id="moving_date" class="form-control">
							</div>								
						</div>
						
						
						<!-- ���ְ�����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="description">�Ź�����</label>
							<div class="col-md-5">
								<textarea class="form-control" rows="5" id="description"></textarea>
							</div>								
						</div>

						<div class="form-group" style="text-align: center">
							
							<input type=submit id="upload" name="upload" class="btn" value="���">
						    <input type=button id="cencel" name="cencel" class="btn btn-primary" value="���">
						</div>
						
					</fieldset>
					
				</form>
				<!-- ��� �� ��ü ������ ���� -->
				
			</div>
			<!--  row ��-->
				
		</div>
		<!-- container �� -->
		
	</div>
	<!-- work section �� -->
		
	
</body>
</html>

