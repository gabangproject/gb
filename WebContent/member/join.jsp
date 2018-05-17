<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<!-- 매물등록 관련 bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
function openIdChk(){
    
    window.name = "parentForm";
    window.open("../member/idcheck.jsp",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
}
</script>
<!-- 매물등록 관련 bootstrap 끝 -->
</head>
<body>



	
	<!-- end:header-top -->
<div id="fh5co-work-section" style="padding:98px">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>회원가입</h3>
						</div>
					</div>
				</div>


	<!-- 회원가입 및 중개사 등록 폼 -->
	<div class="container">
		<div class="row">
			<fieldset>
				<form class="form-horizontal">

					<!-- ID입력-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="Name">아이디</label>
						<div class="col-md-2">
							<input id="Name" name="Name" type="text"
								placeholder="UserID (Email)" class="form-control input-md"
								required="">
						</div>
						<input type=button class='btn btn-sm' value='중복체크'
							onclick="openIdChk()">
					</div>

					<!-- 비밀번호 입력-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">비밀번호
							<font size="2" color=red> (비밀번호 8~10자 입력)</font>
						</label>
						<div class="col-md-3">
							<input id="passwordinput" name="passwordinput" type="password"
								placeholder="" class="form-control input-md" required="">
						</div>
						<div class="col-md-3">
							<input id="confirm_password" name="confirm_password"
								type="password" placeholder="Re-type password"
								class="form-control input-md" required="">
						</div>
					</div>

					<!-- 이름-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">이름</label>
						<div class="col-md-2">
							<input id="name" name="confirm_password" type="text"
								placeholder="name" class="form-control input-md" required="">
						</div>
					</div>

					<!-- 닉네임-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">별명</label>
						<div class="col-md-2">
							<input id="nick" name="confirm_password" type="text"
								placeholder="nickname" class="form-control input-md" required="">
						</div>
						<input type=button class='btn btn-sm' value='중복체크'>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">전화번호</label>
						<div class="col-xs-2">
							<select class="form-control" id="exampleFormControlSelect1">
								<option>010</option>
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>053</option>
								<option>041</option>
							</select>
						</div>
						<div class="col-xs-2">
							<input id="phone2" name="phone2" type="text"
								class="form-control input-xs" required="">
						</div>
						<div class="col-xs-2">
							<input id="phone3" name="phone3" type="text"
								class="form-control input-xs" required="">
						</div>
					</div>

					<!-- 성별 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="gender">성별</label>
						<div class="col-md-4">
							<label class="radio-inline" for="gender-0"> <input
								type="radio" name="gender" id="gender-0" value="Male"
								checked="checked"> 남자
							</label> <label class="radio-inline" for="gender-1"> <input
								type="radio" name="gender" id="gender-1" value="Female">
								여자
							</label>
						</div>
					</div>
					<!-- 공인중개사 등록 -->
					<legend>공인중개사 등록</legend>

					<!-- 공인중개사 번호입력 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">공인중개사
							자격증번호</label>
						<div class="col-md-4">
							<input id="name" name="confirm_password" type="text"
								placeholder="-가 있을 경우 포함하여 입력해주세요" class="form-control input-md"
								required="">
						</div>
						<input type="button" value="등록" class='btn btn-sm'>

					</div>

					<!-- 상호명 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">상호명</label>
						<div class="col-md-3">
							<input id="name" name="confirm_password" type="text"
								class="form-control input-md" required="">
						</div>
					</div>

					<!-- 상호 전화번호-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirm_password">상호
							전화번호</label>
						<div class="col-xs-2">
							<select class="form-control" id="exampleFormControlSelect1">
								<option>010</option>
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>053</option>
								<option>041</option>
							</select>
						</div>
						<div class="col-xs-2">
							<input id="phone2" name="phone2" type="text"
								class="form-control input-xs" required="">
						</div>
						<div class="col-xs-2">
							<input id="phone3" name="phone3" type="text"
								class="form-control input-xs" required="">
						</div>
					</div>

					<div class="form-group">
						<div style="text-align: center">
							<input type=submit id="login" name="login" class="btn" value="가입">
							<input type=button id="cencel" name="cencel" class="btn btn-primary" value="취소">
						</div>
					</div>		
				</form>
			</fieldset>
		</div>
	</div>
	<!-- 회원가입 및 중개사 등록 폼 끝 -->
</div>
</body>
</html>