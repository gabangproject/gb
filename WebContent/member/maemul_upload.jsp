
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
									<input id="firstname" name="firstname" type="text"
										placeholder="기본주소" class="form-control input-md" size=20>
									<input id="firstname" name="firstname" type="text"
										placeholder="상세주소" class="form-control input-md" size=20>
								</div>
								<input type=button class='btn btn-sm' value='주소검색'>
							</tr>
						</div>


						<!-- 거래형태 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="radios">거래형태</label>
							<div class="col-md-4">
								<div class="radio">
									<label for="radios-0"> <input type="radio"
										name="radios0" id="radios-0" value="1" checked="checked">
										전세
									</label> <label for="radios-1"> <input type="radio"
										name="radios0" id="radios-1" value="2"> 월세
									</label> <label for="radios-2"> <input type="radio"
										name="radios0" id="radios-2" value="3"> 기타
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
							<label class="col-md-4 control-label" for="mobno">관리비</label>
							<div class="col-md-4">
								<select	class="form-control" id="exampleFormControlSelect1"">
									<option selected>관리비 포함항목</option>
									<option>전기세</option>
									<option>수도세</option>
									<option>가스비</option>
									<option>인터넷</option>
									<option>기타</option>
								</select>
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

						<!-- 건물층수  -->
						<div class="form-group" id="건물층수">
							<label class="col-md-4 control-label" for="mobno">건물층수</label>
							<div class="col-md-4">
							
								<select class="form-control" id="exampleFormControlSelect1">
									<option selected>건물 층수를 입력하세요</option>

									<option value="1">1층</option>
									<option value="2">2층</option>
									<option value="3">3층</option>
									<option value="4">4층</option>
									<option value="5">5층</option>
								</select>
							</div>
						</div>

						<!-- 파일첨부  -->
						<div class="form-group">
							<label for="InputSubject1">파일첨부</label> <input id="fileInput"
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

