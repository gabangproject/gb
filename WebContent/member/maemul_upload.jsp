<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- ȸ������ ���� bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- ȸ������ ���� bootstrap �� -->

<style>
.sub label,.form-check-label
{
font-weight: 500;
}

</style>

<script>



//��Ÿ �׸��� üũ�ϸ� ��Ÿ������ �Է��� �� �ִ� ĭ�� ����� �ϴ� �̺�Ʈ
$(function(){
	
	$('.ncs').attr("required",true);
	
	/* $('#opt-4').click(function(){
		
		
	var check=$('#opt-4').prop( "checked" );
	var html="";
	if(check==true)
		{
		$('#opt-4').attr("required",true);
		html="<input id='opt-4-detail' name='opt-4' type='text' placeholder='�̸�' class='form-control' required>";
		}
	else
		{
		$('#opt-4').attr("required",false);
		}
	
	$('#for-opt-4').html(html);
	
	
	} */
	
}); 
</script>
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
								<input type="text" id="postcode" name="postcode" class="form-control sri" placeholder="�����ȣ" onclick="searchPostcode()" readonly>
								
								<input type="text" id="address" name="address" class="form-control sri" placeholder="�ּ�" style="margin-top:5px;margin-bottom:5px;" 
								onclick="searchPostcode()" readonly>
								
								<input type="text" id="detailAddress" name="detailAddress" class="form-control sri" placeholder="���ּ�">
								<!-- x,y��ǥ�� ���� -->
								<input type="hidden" id="x_position" name="x_position">
								<input type="hidden" id="y_position" name="y_position">
								</div>
								<input type=button class='btn btn-sm' onclick="searchPostcode()" value="�ּҰ˻�">
								
						</div>
						
						<!-- �Ź� ��ġ ǥ���� ���� -->
						<div class="form-group">
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none; margin:0px auto"></div>
						</div>
						
						
						<!-- ����÷��  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="file">�Ź����� ���
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<input type="file" name="img" multiple="multiple"
									style="apperance: none;	-webkit-apperance: none;">		
							</div>
						</div>


						<!-- �ŷ����� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�ŷ�����
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-0"> 
										<input type="radio" name="deal_type" id="radios-0" value="0" checked="checked"> ����
									</label> 
									<label for="radios-1"> 
										<input type="radio" name="deal_type" id="radios-1" value="1"> ����
									</label> 
									
								</div>
							</div>
						</div>


						<!-- �ְ����� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">�ְ�����
							<span class="text-danger">*</span>
							</label>
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
								<div class="col-md-2 sub">
									<input type="text" id="manage_fee" class="form-control" style="width:45%; display:inline;">
									<label for="manage_fee">����</label>
								</div>
								
						</div>
						
						
						<!-- ������ �����׸� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="opts">������ �����׸�</label>

							<div class="col-md-4" style="margin-top:7px">
								<div class="check">
									<label for="opt-0" class="form-check-label">
									<input type="checkbox" id="opt-0" name="opt" value="0">���⼼
									</label>
									<label for="opt-1" class="form-check-label">
									<input type="checkbox" id="opt-1" name="opt" value="1">������
									</label>
									<label for="opt-2" class="form-check-label">
									<input type="checkbox" id="opt-2" name="opt" value="2">������
									</label>
									<label for="opt-3" class="form-check-label">
									<input type="checkbox" id="opt-3" name="opt" value="3">���ͳ�
									</label>
									<label for="opt-4" class="form-check-label">
									<input type="checkbox" id="opt-4" name="opt" value="4">��Ÿ
									</label>
								</div>
								<div id="for-opt-4"></div>
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
						
							<label class="col-md-4 control-label" for="mobno">�ش���
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-1">
								<input type="text" id="floor1" class="form-control">
							</div>
							
							<label class="col-md-1 control-label" for="mobno">��ü��
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-1">
								<input type="text" id="floor2" class="form-control">
							</div>
							
						</div>
						
						
						<!-- ������  -->
						<div class="form-group">
							<label class="col-md-4 control-label">������
							<span class="text-danger">*</span>
							</label>
								<div class="col-md-2 sub">
								<input type="text" id="deposit1" class="form-control" style="width:45%; display:inline;">
								<label for="deposit1">��</label>
								</div>
								
								
								<div class="col-md-2 sub">
								<input type="text" id="deposit2" class="form-control" style="width:45%; display:inline;">
								<label for="deposit2">����</label>
								</div>

						</div>
						
						
						<!-- ����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" >����</label>
								<div class="col-md-2 sub">
								<input type="text" id="monthly_lent1" class="form-control" style="width:45%; display:inline;" >
								<label for="monthly_lent1">��</label>
								</div>
								
								<div class="col-md-2 sub">
								<input type="text" id="monthly_lent2" class="form-control" style="width:45%; display:inline;" >
								<label for="monthly_lent2">����</label>
								</div>
								
						</div>
						
						
						<!-- ������� --> 
						<div class="form-group">
							<label class="col-md-4 control-label" for="gross_area">�������
							<span class="text-danger">*</span>
							</label>
								<div class="col-md-2 sub">
								<input type="text" id="gross_area" class="form-control" style="width:45%; display:inline;" >
								<label for="gross_area">m<sup>2</sup></label>
								
								</div>		
						</div>
						
						
						<!-- ���ְ�����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="moving_date">���ְ�����
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-5">
								<input type="text" id="moving_date" class="form-control">
							</div>								
						</div>
						
						<!-- �Ź� ����?  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="detail_title">�Ź� ���� ǥ��</label>
							<div class="col-md-5">
								<input type="text" id="detail_title" class="form-control" placeholder="�Ź��� ���� ���� ������ �ۼ��� �ּ���.">
							</div>								
						</div>
						
						
						<!-- �Ź� ����  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="description">�Ź�����</label>
							<div class="col-md-5">
								<textarea class="form-control" rows="5" id="description"></textarea>
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
<!-- <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function searchPostcode() {
    	//daum ��ü�� Postcode��� �޼ҵ� ����
        new daum.Postcode({
        		//oncomplete��� �̸����� function(data) �Լ� ����
            oncomplete: function(data) {
            	 // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
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
            	}
            
        }).open();
    }
</script> -->

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

