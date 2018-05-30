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

<!-- 회원가입 관련 bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 회원가입 관련 bootstrap 끝 -->


<!-- shadowbox bootstrap  -->
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>


<script>



//input 입력값 유효성 체크 함수(eamil이면 eamil형식 전화번호면 전화번호 형식에 맞는지 확인하는 함수) 
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
		input.setCustomValidity("숫자 또는 .만 입력해주세요.");
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
	 title:'이미지 업로드',
	 player:'iframe',
	 width:500,
	 height:350
 });	
 
}

 $(document).ready(function () {
	 
	 
	 
	 $('#upload').click(function() {
		 
	//체크박스에(옵션부분) 최소 한개 이상 체크 하면 required 속성이 해제되는 함수
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
					<h3>매물등록</h3>
					<small class="text-muted">
					<span class="text-danger">*</span>
      				은 필수입력
    				</small>
				</div>
			</div>
		

		<!-- 매물 등록 폼 -->
		
			<div class="row" >
				

				
				<form id="maemul_upload" class="form-horizontal" method="post" action="../main/upload.do">
							
					<fieldset form="maemul_upload">
						
						
						
						
						<!-- 매물주소 -->
						<div class="form-group">
							
								<label class="col-md-4 control-label" for="firstname">매물주소
								<span class="text-danger">*</span>
								</label>
								
								<div class="col-sm-4">
								<input type="text" id="postcode" name="postcode" class="form-control sri" placeholder="우편번호" 
								style="background-color:white" onclick="searchPostcode()" readonly required>
								
								<input type="text" id="address" name="address" class="form-control sri" placeholder="주소" 
								style="margin-top:5px;margin-bottom:5px; background-color:white" onclick="searchPostcode()" readonly required>
								
								<input type="text" id="detailAddress" name="detailAddress" class="form-control sri" placeholder="상세주소" required>
								
								</div>
								<input type=button class='btn btn-sm' onclick="searchPostcode()" value="주소검색">
								<!-- x,y좌표값 얻어옴 -->
								<input type="hidden" id="x_position" name="x_position">
								<input type="hidden" id="y_position" name="y_position">
						</div>
						
						<!-- 매물 위치 표시할 지도 -->
						<div class="form-group">
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none; margin:0px auto"></div>
						</div>
						
						<!-- 파일첨부  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="img">매물사진 등록
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<input type="button" id="img" onclick="fileUpload()" value="사진 등록" required>		
							</div>
						</div>

						
						
						<!-- 거래형태 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">거래형태
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


						<!-- 방구조 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">방구조
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
						
						<!-- 건물형태 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">건물형태
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
						
						
						<!-- 관리비  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="manage_fee">관리비</label>
								<div class="col-md-2 sub">
									<input type="text" id="manage_fee" name="manage_fee" class="form-control" 
									style="width:45%; display:inline;" onblur="pCheck(this)">
									<label for="manage_fee">만원</label>
								</div>
								
						</div>
						
						
						<!-- 옵션 -->
						<div class="form-group ">
							<label class="col-md-4 control-label" for="opts">옵션
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


						<!-- 엘리베이터 유무  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">엘리베이터
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-4">
								<div class="radio" >
									<label for="radios-7">
									<input type="radio"	name="elev" id="radios-7" value="1" checked="checked" required >있음
									</label>
									<label for="radios-8">
									<input type="radio"	name="elev" id="radios-8" value="0" required>없음
									</label>
								</div>
							</div>
						</div>


						<!-- 주차공간  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">주차공간
							<span class="text-danger">*</span>
							</label>							
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-9"> 
									<input type="radio"	name="parking_lot" id="radios-9" value="1" checked="checked" required>가능
									</label>
									
									<label for="radios-10">
									<input type="radio" name="parking_lot" id="radios-10" value="0" required>불가능
									</label>
								</div>

							</div>
						</div>
						
						
						<!-- 해당층  -->
						<div class="form-group">
						
							<label class="col-md-4 control-label" for="mobno">해당층
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-1">
								<input type="text" name="floor1" class="form-control" required>
							</div>
							
							<label class="col-md-1 control-label" for="mobno">전체층
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-1">
								<input type="text" name="floor2" class="form-control" required>
							</div>
							
						</div>
						
						
						<!-- 보증금  -->
						<div class="form-group">
							<label class="col-md-4 control-label">보증금
							<span class="text-danger">*</span>
							</label>
								<div class="col-md-2 sub">
								<input type="text" name="deposit1" class="form-control" style="width:45%; display:inline;"
								onblur="pCheck(this)">
								<label for="deposit1">억</label>
								</div>
								
								<div class="col-md-2 sub">
								<input type="text" name="deposit2" class="form-control" style="width:45%; display:inline;"
								onblur="pCheck(this)" required>
								<label for="deposit2">만원</label>
								</div>

						</div>
						
						
						<!-- 월세  -->
						<div class="form-group">
							<label class="col-md-4 control-label" >월세</label>
								<div class="col-md-2 sub">
								<input type="text" id="monthly_rent1" name="monthly_rent1" class="form-control" 
								style="width:45%; display:inline;" onblur="pCheck(this)">
								<label for="monthly_lent1">억</label>
								</div>
								
								<div class="col-md-2 sub">
								<input type="text" id="monthly_rent2" name="monthly_rent2" class="form-control" 
								style="width:45%; display:inline;" onblur="pCheck(this)">
								<label for="monthly_lent2">만원</label>
								</div>
								
						</div>
						
						
						<!-- 전용면적 --> 
						<div class="form-group">
							<label class="col-md-4 control-label" for="gross_area">전용면적
							<span class="text-danger">*</span>
							</label>
								<div class="col-md-2 sub">
								<input type="text" id="gross_area" name="gross_area" class="form-control" 
								style="width:45%; display:inline;" onblur="pCheck(this)" required>
								<label for="gross_area">m<sup>2</sup></label>
								
								</div>		
						</div>
						
						
						<!-- 입주가능일  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="moving_date">입주가능일
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-5">
								<input type="text" id="moving_date" name="moving_date" class="form-control" required>
							</div>								
						</div>
						
						<!-- 매물 제목?  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="detail_title">매물 한줄 표현</label>
							<div class="col-md-5">
								<input type="text" id="detail_title" name="detail_title" class="form-control" placeholder="매물에 대한 한줄 설명을 작성해 주세요.">
							</div>								
						</div>
						
						<!-- 인근전철역  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="near_subway">인근전철역
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-5">
								<input type="text" id="near_subway" name="near_subway" class="form-control" 
								placeholder="인근 전철역을 작성해 주세요." required>
							</div>								
						</div>
						
						
						<!-- 매물 설명  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="description">매물설명
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-5">
								<textarea class="form-control" rows="5" id="description" name="description" required></textarea>
							</div>								
						</div>

						<div class="form-group text-center" >
							
							<input type=submit id="upload" name="upload" class="btn" value="등록">
						    <input type=button id="cencel" name="cencel" class="btn btn-primary" value="취소">
						</div>
						
					</fieldset>
					
				</form>
				<!-- 등록 폼 전체 사이즈 조정 -->
				
			</div>
			<!--  row 끝-->
				
		</div>
		<!-- container 끝 -->
		
	</div>
	<!-- work section 끝 -->
	
	
<!-- 주소검색 관련 다음 api -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function searchPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
				
                
            	 // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                
             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
				
             // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;
                
             	// 커서를 상세주소 필드로 이동한다.
                document.getElementById('detailAddress').focus();
             	
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        $('#x_position').val(result.y);
                        $('#y_position').val(result.x);
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
	
</body>
</html>

