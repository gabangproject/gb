<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 우편번호 검색창  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
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
</script>
<!-- 회원가입 관련 bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

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
				<div
					class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>매물등록</h3>
				</div>
			</div>
		</div>

		<!-- 매물 등록 폼 -->
		<div class="container">
			<div class="row">
				<form class="form-horizontal">
					<fieldset>



						<!-- 매물주소 -->
						<div class="form-group">
							<tr>
								<label class="col-md-4 control-label" for="firstname">매물주소</label>
								<div class="col-md-3">
								<input type="text" id="sample4_postcode" class="form-control input-md" placeholder="우편번호">
								<input type="text" id="sample4_roadAddress" class="form-control input-md" placeholder="도로명주소">
								<input type="text" id="sample4_jibunAddress" class="form-control input-md" placeholder="지번주소">
								<input type="text" class="form-control input-md" placeholder="상세주소">
								<span id="guide" style="color:#999"></span> <!-- 주소를 클릭하면 창이 사라진다 -->
								</div>
								<input type=button class='btn btn-sm' onclick="sample4_execDaumPostcode()" value="주소검색">
							</tr>
						</div>


						<!-- 거래형태 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">거래형태</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-0"> 
									<input type="radio" name="radios0" id="radios-0" value="1" checked="checked">
									전세
									</label> 
									<label for="radios-1"> 
									<input type="radio" name="radios0" id="radios-1" value="2">
									 월세
									</label> 
									<label for="radios-2"> 
									<input type="radio" name="radios0" id="radios-2" value="3"> 
									기타
									</label>
								</div>
							</div>
						</div>

						<!-- 주거형태 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">주거형태</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-3"> <input type="radio"
										name="radios1" id="radios-3" value="3" checked="checked">
										원룸
									</label> <label for="radios-4"> <input type="radio"
										name="radios1" id="radios-4" value="4"> 투룸
									</label> <label for="radios-5"> <input type="radio"
										name="radios1" id="radios-5" value="5"> 주택
									</label> <label for="radios-6"> <input type="radio"
										name="radios1" id="radios-6" value="6"> 오피스텔
									</label>
								</div>
							</div>
						</div>
						
						<!-- 관리비 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="mobno">관리비 포함항목</label>
							<div class="col-md-4">
								<input type="checkbox" name="chk_info" value="전기세">전기세
								<input type="checkbox" name="chk_info" value="수도세">수도세<br>
								<input type="checkbox" name="chk_info" value="가스비">가스비
								<input type="checkbox" name="chk_info" value="인터넷">인터넷
								<input type="checkbox" name="chk_info" value="기타">기타
							</div>
						</div>	

						<!-- 엘리베이터 유무  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">엘리베이터</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-7"> <input type="radio"
										name="radios2" id="radios-7" value="7" checked="checked">
										있음
									</label> <label for="radios-8"> <input type="radio"
										name="radios2" id="radios-8" value="8"> 없음
									</label>
								</div>
							</div>
						</div>

						<!-- 주차공간  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">주차공간</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-9"> <input type="radio"
										name="radios3" id="radios-9" value="9" checked="checked">
										있음
									</label> <label for="radios-10"> <input type="radio"
										name="radios3" id="radios-10" value="10"> 없음
									</label>
								</div>

							</div>
						</div>
						
						<!-- 해당층  -->
						<div class="form-group" id="해당층">
							<label class="col-md-4 control-label" for="mobno">전체/해당층</label>
							<div class="col-md-1">
								<input type="text" id="floor" class="form-control input-md">
							</div>
							<div style="float: left; width: 4%;">전체층</div>
							<div class="col-md-1">
								<input type="text" id="floor2" class="form-control input-md">
							</div>
							<div style="float: left; width: 4%;">해당층</div>
						</div>
						
						<!-- 보증금  -->
						<div class="form-group row" id="보증금" >
							<label class="col-md-4 control-label" for="mobno">보증금</label>
								<div class="col-md-1">
								<input type="text" id="million" class="form-control input-md">
								</div>
								<div style="float: left; width: 2%;">억</div>
								<div class="col-md-1">
								<input type="text" id="won" class="form-control input-md">
								</div>
								<div style="float: left; width: 4%;">만원</div>
								
						</div>
						
						<!-- 전용면적 --> 
						<div class="form-group row" id="전용면적" >
							<label class="col-md-4 control-label" for="mobno">전용/공급면적</label>
								<div class="col-md-1">
								<input type="text" id="" class="form-control input-md" placeholder="전용면적">
								</div>
								<div style="float: left; width: 2%;">m^2</div>
								<div class="col-md-1">
								<input type="text" id="" class="form-control input-md" placeholder="공급면적">
								</div>
								<div style="float: left; width: 4%;">m^2</div>
						</div>
						
						<!-- 파일첨부  -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="file">파일첨부</label>
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
								<button id="login" name="login" class="btn">등록</button>
								<button id="cencel" name="cencel" class="btn btn-primary">취소</button>
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

