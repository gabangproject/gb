<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 우편번호 검색창  -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<!-- <script type="text/javascript">
	$(document).ready(
			
			
			function() {
				$("#fileInput").on(
						'change',
						function() { // 값이 변경되면
							if (window.FileReader) { // modern browser
								var filename = $(this)[0].files[0].name;
							} else { // old IE
								var filename = $(this).val().split('/').pop()
										.split('\\').pop(); // 파일명만 추출
							}
							// 추출한 파일명 삽입
							$("#userfile").val(filename);
						});
			});
</script> -->

<!-- 회원가입 관련 bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 회원가입 관련 bootstrap 끝 -->

<!-- 주소검색 버튼 누르면 다음에 있는 주소검색창으로 이동 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('Address').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

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
					<h3>매물등록</h3>
				</div>
			</div>
		

		<!-- 매물 등록 폼 -->
		
			<div class="row">
			
				<!-- <div class="col-md-12" style="magrin:0px auto;"> -->
				
				<form id="maemul_upload" class="form-horizontal" enctype="multipart/form-data" action="../main/">
					
					<fieldset form="maemul_upload">

						<!-- 매물주소 -->
						<div class="form-group">
							
								<label class="col-md-4 control-label" for="firstname">매물주소</label>
								<div class="col-md-4">
								<input type="text" id="postcode" class="form-control" placeholder="우편번호">
								
								<input type="text" id="Address" class="form-control" placeholder="주소" style="margin-top:5px;margin-bottom:5px;">
								
								<input type="text" id="jibunAddress" class="form-control" placeholder="지번주소" style="margin-bottom:5px;">
								
								<input type="text" id="detailAddress" class="form-control" placeholder="상세주소">
								<span id="guide" style="color:#999"></span> <!-- 주소를 클릭하면 창이 사라진다 -->
								</div>
								<input type=button class='btn btn-sm' onclick="sample4_execDaumPostcode()" value="주소검색">
							
						</div>


						<!-- 거래형태 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">거래형태</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-0"> 
										<input type="radio" name="radios0" id="radios-0" value="1" checked="checked"> 전세
									</label> 
									<label for="radios-1"> 
										<input type="radio" name="radios0" id="radios-1" value="2"> 월세
									</label> 
									<label for="radios-2"> 
									<input type="radio" name="radios0" id="radios-2" value="3"> 매매
									</label>
								</div>
							</div>
						</div>


						<!-- 주거형태 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">주거형태</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-3">
									<input type="radio"	name="room_type" id="radios-3" value="0" checked="checked">원룸 
									</label> 
									
									<label for="radios-4">
									<input type="radio" name="room_type" id="radios-4" value="1">투룸	
									</label> 
									
									<label for="radios-5"> 
									<input type="radio" name="room_type" id="radios-5" value="2">오피스텔
									</label>
									
									<label for="radios-6">
									<input type="radio" name="room_type" id="radios-6" value="3">다세대/다가구
									</label> 
								</div>
							</div>
						</div>
						
						
						<!-- 관리비  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="manage_fee">관리비</label>
								<div class="col-md-4">
									<input type="text" id="manage_fee" class="form-control">
								</div>
								<div style="float: left; width: 4%;">만원</div>
						</div>
						
						
						<!-- 관리비 포함항목 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="opts">관리비 포함항목</label>

							<div class="col-md-4">
							<div class="check">
								<label for="opt-0">
								<input type="checkbox" id="opt-0" name="opt" value="0">전기세
								</label>
								<label for="opt-1">
								<input type="checkbox" id="opt-1" name="opt" value="1">수도세
								</label>
								<label for="opt-2">
								<input type="checkbox" id="opt-2" name="opt" value="2">가스비
								</label>
								<label for="opt-3">
								<input type="checkbox" id="opt-3" name="opt" value="3">인터넷
								</label>
								<label for="opt-4">
								<input type="checkbox" id="opt-4" name="opt" value="4">기타
								</label>
							</div>
							</div>
						</div>	


						<!-- 엘리베이터 유무  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">엘리베이터</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-7">
									<input type="radio"	name="elev" id="radios-7" value="1" checked="checked">있음
									</label>
									<label for="radios-8">
									<input type="radio"	name="elev" id="radios-8" value="0">없음
									</label>
								</div>
							</div>
						</div>


						<!-- 주차공간  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">주차공간</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-9"> 
									<input type="radio"	name="parking_lot" id="radios-9" value="1" checked="checked">가능
									</label>
									
									<label for="radios-10">
									<input type="radio" name="parking_lot" id="radios-10" value="0">불가능
									</label>
								</div>

							</div>
						</div>
						
						
						<!-- 해당층  -->
						<div class="form-group">
						
							<label class="col-md-4 control-label" for="mobno">해당층/전체층</label>
							<div class="col-md-1">
								<input type="text" id="floor1" class="form-control">
							</div>
							<div style="float: left; width: 4%;">/</div>
							
							<div class="col-md-1">
								<input type="text" id="floor2" class="form-control">
							</div>
							<div style="float: left; width: 4%;">전체층</div>
						</div>
						
						
						<!-- 보증금  -->
						<div class="form-group">
							<label class="col-md-4 control-label">보증금</label>
								<div class="col-md-1">
								<input type="text" id="deposit1" class="form-control">
								</div>
								<div style="float: left; width: 2%;">억</div>
								
								<div class="col-md-1">
								<input type="text" id="deposit2" class="form-control">
								</div>
								<div style="float: left; width: 4%;">만원</div>
								
						</div>
						
						
						<!-- 월세  -->
						<div class="form-group">
							<label class="col-md-4 control-label" >월세</label>
								<div class="col-md-1">
								<input type="text" id="monthly_lent1" class="form-control">
								</div>
								<div style="float: left; width: 2%;">억</div>
								
								<div class="col-md-1">
								<input type="text" id="monthly_lent2" class="form-control">
								</div>
								<div style="float: left; width: 4%;">만원</div>
								
						</div>
						
						
						<!-- 전용면적 --> 
						<div class="form-group">
							<label class="col-md-4 control-label" for="gross_area">전용면적</label>
								<div class="col-md-1">
								<input type="text" id="gross_area" class="form-control" placeholder="전용면적">
								</div>
								<div style="float: left; width: 2%;">m^2</div>
								
						</div>
						
						
						<!-- 파일첨부  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="file">파일첨부</label>
							<div class="col-md-4">
								<input type="file" name="filename[]" multiple="multiple" maxlength="2" style="apperance: none;
  									-webkit-apperance: none;" required> 
										
							</div>
						</div>
						
						
						<!-- 입주가능일  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="moving_date">입주가능일</label>
							<div class="col-md-1">
								<input type="text" id="moving_date" class="form-control">
							</div>								
						</div>
						
						
						<!-- 입주가능일  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="description">매물설명</label>
							<div class="col-md-5">
								<textarea class="form-control" rows="5" id="description"></textarea>
							</div>								
						</div>

						<div class="form-group" style="text-align: center">
							
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
		
	
</body>
</html>

