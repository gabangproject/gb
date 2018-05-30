<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- shadowbox bootstrap  -->
<link rel="stylesheet" type="text/css" href="../member/shadow/css/shadowbox.css">

<!-- ȸ������ ���� bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- ȸ������ ���� bootstrap �� -->


<!-- shadowbox bootstrap  -->
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>


<script>



//input �Է°� ��ȿ�� üũ �Լ�(eamil�̸� eamil���� ��ȭ��ȣ�� ��ȭ��ȣ ���Ŀ� �´��� Ȯ���ϴ� �Լ�) 
function pCheck(input)
{
	
	var inputed=input.value;
	
	var checker=$(input).attr('name');
	
	var numberCheck="";
	
	switch(checker)
	{
	
	case 'deposit1':
	case 'deposit2':
	case 'manage_fee':
	case 'monthly_rent1':
	case 'monthly_rent1':
	case 'gross_area':
					numberCheck=/^[0-9.]*$/;
				    break;
	
	};
	
	if(numberCheck.test(inputed)==false)
		{
		input.setCustomValidity("���� �Ǵ� .�� �Է����ּ���.");
		//$("#upload").prop("disabled", true);
		}
	else{
		input.setCustomValidity("");
		
		}
}

Shadowbox.init({
	players:["iframe"]
});

function fileUpload()
{
 Shadowbox.open({
	 content:'../member/image_upload.jsp',
	 title:'�̹��� ���ε�',
	 player:'iframe',
	 width:500,
	 height:350
 });	
 
}

 $(document).ready(function () {
	 
	 
	 
	 $('#upload').click(function() {
		 
	//üũ�ڽ���(�ɼǺκ�) �ּ� �Ѱ� �̻� üũ �ϸ� required �Ӽ��� �����Ǵ� �Լ�
      var checked = $("input[type=checkbox]:checked").length;
	
      if(checked)
    	{
    	  $('[type="checkbox"]').attr("required",false);
    	}
      

    });
	 
	 
	 
}); 


</script>
<style>
.sub label,.form-check-label
{
font-weight: 500;
}

</style>
</head>
<body>
	<div id="fh5co-work-section">
		<div class="container">
		
		
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>�Ź����</h3>
					<small class="text-muted">
					<span class="text-danger">*</span>
      				�� �ʼ��Է�
    				</small>
				</div>
			</div>
		

		<!-- �Ź� ��� �� -->
		
			<div class="row" >
				

				
				<form id="maemul_upload" class="form-horizontal" method="post" action="../main/upload.do">
							
					<fieldset form="maemul_upload">
						
						
						
						
						<!-- �Ź��ּ� -->
						<div class="form-group">
							
								<label class="col-md-4 control-label" for="firstname">�Ź��ּ�
								<span class="text-danger">*</span>
								</label>
								
								<div class="col-sm-4">
								<input type="text" id="postcode" name="postcode" class="form-control sri" placeholder="�����ȣ" 
								style="background-color:white" onclick="searchPostcode()" readonly required>
								
								<input type="text" id="address" name="address" class="form-control sri" placeholder="�ּ�" 
								style="margin-top:5px;margin-bottom:5px; background-color:white" onclick="searchPostcode()" readonly required>
								
								<input type="text" id="detailAddress" name="detailAddress" class="form-control sri" placeholder="���ּ�" required>
								
								</div>
								<input type=button class='btn btn-sm' onclick="searchPostcode()" value="�ּҰ˻�">
								<!-- x,y��ǥ�� ���� -->
								<input type="hidden" id="x_position" name="x_position">
								<input type="hidden" id="y_position" name="y_position">
						</div>
						
						<!-- �Ź� ��ġ ǥ���� ���� -->
						<div class="form-group">
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none; margin:0px auto"></div>
						</div>
						
						<!-- ����÷��  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="img">�Ź����� ���
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<input type="button" id="img" onclick="fileUpload()" value="���� ���" required>		
							</div>
						</div>

						
						
						<!-- �ŷ����� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�ŷ�����
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<div class="radio">
								
									<c:forEach var="deal" items="${deal_type }" varStatus="d">
										<label for="radios-d${d.index }"> 
											<input type="radio" name="deal_type" id="radios-d${d.index }" value="${d.index }" required> ${deal}
										</label> 
									</c:forEach>
									
								</div>
							</div>
						</div>


						<!-- �汸�� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�汸��
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<div class="radio">
								
									<c:forEach var="room" items="${room_type }" varStatus="r">
										<label for="radios-r${r.index }">
										<input type="radio"	name="room_type" id="radios-r${r.index }" value="${r.index }" required>${room } 
										</label> 
									</c:forEach>
									
								</div>
							</div>
						</div>
						
						<!-- �ǹ����� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�ǹ�����
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<div class="radio">
								
									<c:forEach var="building" items="${building_type }" varStatus="b">
										<label for="radios-b${b.index }">
											<input type="radio"	name="building_type" id="radios-b${b.index }" 
											value="${b.index }" required>${building } 
										</label> 
									</c:forEach>
									

								</div>
							</div>
						</div>
						
						
						<!-- ������  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="manage_fee">������</label>
								<div class="col-md-2 sub">
									<input type="text" id="manage_fee" name="manage_fee" class="form-control" 
									style="width:45%; display:inline;" onblur="pCheck(this)">
									<label for="manage_fee">����</label>
								</div>
								
						</div>
						
						
						<!-- �ɼ� -->
						<div class="form-group ">
							<label class="col-md-4 control-label" for="opts">�ɼ�
							<span class="text-danger">*</span>
							</label>

							<div class="col-md-4 options" style="margin-top:7px">
								<div class="checkbox-group">
									
									<c:forEach var="option" items="${opt }" varStatus="n">
										<label for="opt-${n.index }" class="form-check-label">
										<input type="checkbox" id="opt-${n.index }" name="opt" value="${n.index }" 
										required>${option }
										</label>
									</c:forEach>
									
								</div>
								<div id="for-opt-4"></div>
							</div>
						</div>	


						<!-- ���������� ����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">����������
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<div class="radio" >
									<label for="radios-7">
									<input type="radio"	name="elev" id="radios-7" value="1" checked="checked" required >����
									</label>
									<label for="radios-8">
									<input type="radio"	name="elev" id="radios-8" value="0" required>����
									</label>
								</div>
							</div>
						</div>


						<!-- ��������  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">��������
							<span class="text-danger">*</span>
							</label>							
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-9"> 
									<input type="radio"	name="parking_lot" id="radios-9" value="1" checked="checked" required>����
									</label>
									
									<label for="radios-10">
									<input type="radio" name="parking_lot" id="radios-10" value="0" required>�Ұ���
									</label>
								</div>

							</div>
						</div>
						
						
						<!-- �ش���  -->
						<div class="form-group">
						
							<label class="col-md-4 control-label" for="mobno">�ش���
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-1">
								<input type="text" name="floor1" class="form-control" required>
							</div>
							
							<label class="col-md-1 control-label" for="mobno">��ü��
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-1">
								<input type="text" name="floor2" class="form-control" required>
							</div>
							
						</div>
						
						
						<!-- ������  -->
						<div class="form-group">
							<label class="col-md-4 control-label">������
							<span class="text-danger">*</span>
							</label>
								<div class="col-md-2 sub">
								<input type="text" name="deposit1" class="form-control" style="width:45%; display:inline;"
								onblur="pCheck(this)">
								<label for="deposit1">��</label>
								</div>
								
								<div class="col-md-2 sub">
								<input type="text" name="deposit2" class="form-control" style="width:45%; display:inline;"
								onblur="pCheck(this)" required>
								<label for="deposit2">����</label>
								</div>

						</div>
						
						
						<!-- ����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" >����</label>
								<div class="col-md-2 sub">
								<input type="text" id="monthly_rent1" name="monthly_rent1" class="form-control" 
								style="width:45%; display:inline;" onblur="pCheck(this)">
								<label for="monthly_lent1">��</label>
								</div>
								
								<div class="col-md-2 sub">
								<input type="text" id="monthly_rent2" name="monthly_rent2" class="form-control" 
								style="width:45%; display:inline;" onblur="pCheck(this)">
								<label for="monthly_lent2">����</label>
								</div>
								
						</div>
						
						
						<!-- ������� --> 
						<div class="form-group">
							<label class="col-md-4 control-label" for="gross_area">�������
							<span class="text-danger">*</span>
							</label>
								<div class="col-md-2 sub">
								<input type="text" id="gross_area" name="gross_area" class="form-control" 
								style="width:45%; display:inline;" onblur="pCheck(this)" required>
								<label for="gross_area">m<sup>2</sup></label>
								
								</div>		
						</div>
						
						
						<!-- ���ְ�����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="moving_date">���ְ�����
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-5">
								<input type="text" id="moving_date" name="moving_date" class="form-control" required>
							</div>								
						</div>
						
						<!-- �Ź� ����?  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="detail_title">�Ź� ���� ǥ��</label>
							<div class="col-md-5">
								<input type="text" id="detail_title" name="detail_title" class="form-control" placeholder="�Ź��� ���� ���� ������ �ۼ��� �ּ���.">
							</div>								
						</div>
						
						<!-- �α���ö��  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="near_subway">�α���ö��
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-5">
								<input type="text" id="near_subway" name="near_subway" class="form-control" 
								placeholder="�α� ��ö���� �ۼ��� �ּ���." required>
							</div>								
						</div>
						
						
						<!-- �Ź� ����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="description">�Ź�����
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-5">
								<textarea class="form-control" rows="5" id="description" name="description" required></textarea>
							</div>								
						</div>

						<div class="form-group text-center" >
							
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
	
	
<!-- �ּҰ˻� ���� ���� api -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };

    //������ �̸� ����
    var map = new daum.maps.Map(mapContainer, mapOption);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function searchPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = data.address; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����
				
                
            	 // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }
                
             // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
				
             // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('address').value = fullAddr;
                
             	// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('detailAddress').focus();
             	
                // �ּҷ� �� ������ �˻�
                geocoder.addressSearch(data.address, function(results, status) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //ù��° ����� ���� Ȱ��

                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        $('#x_position').val(result.y);
                        $('#y_position').val(result.x);
                        
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
	
</body>
</html>

