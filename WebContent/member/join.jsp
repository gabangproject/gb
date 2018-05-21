<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 매물등록 관련 bootstrap -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css"> -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../main/js/bootstrap.min.js"></script>


<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({players:["iframe"]});
function idcheck()
{
	Shadowbox.open({
		content:'../member/idcheck.jsp',
		title:'아이디중복체크',
		player:'iframe',
		width:300,
		height:200
	});
}
function nickcheck()
{
	Shadowbox.open({
		content:'../member/nickcheck.jsp',
		title:'닉네임 중복체크',
		player:'iframe',
		width:300,
		height:200
	});
}
$(function(){
	/* $('.seller').attr("required",false); */
	var password = document.getElementById("password");
	var confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
		
	if(password.value != confirm_password.value) {
	  confirm_password.setCustomValidity("비밀번호가 일치하지 않습니다.");
	} else {
	  confirm_password.setCustomValidity('');
	}

	}

	 password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword; 
	
	$('#sellerform').hide();
	$('#seller').click(function(){
		$('#sellerform').toggle();
		
		var check=$('#seller').prop( "checked" );
		if(check==true)
			{
			$('#sellerform input').attr("required",true);
			}
		else
			{
			$('#sellerform input').attr("required",false);
			}
		
			
		
	})
});
</script>
<!-- 매물등록 관련 bootstrap 끝 -->
</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section" style="padding: 98px">
		<div class="container">
			
			<div class="row">
				 <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>회원가입</h3>
				</div>
			</div>


		<!-- 회원가입 및 중개사 등록 폼 -->
		
			<div class="row">

				<form class="form-horizontal" id="join" name="frm" method="post" action="../member/join_ok.jsp">
					
					<fieldset form="join">
					
					<!-- <legend class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					회원가입
					</legend> -->
					
					<!-- ID입력-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="id">아이디
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="id" name="id" type="text" placeholder="UserID (Email)" class="form-control" required>
						</div>
						<input type=button class='btn btn-sm' value='중복체크' onclick="idcheck()">
					</div>


					<!-- 비밀번호 입력-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="password">비밀번호
							<font size="2" color=red> (비밀번호 8~12자 입력)</font>
						</label>
						<div class="col-md-3">
							<input id="password" minlength="8" maxlength="12" name="password" type="password" placeholder="password"
								class="form-control" required>
						</div>
						<div class="col-md-3">
							<input id="confirm_password" name="confirm_password" type="password" placeholder="Re-type password"
								class="form-control" required>
						</div>
					</div>


					<!-- 이름-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name">이름</label>
						<div class="col-md-2">
							<input id="name" name="name" type="text" placeholder="이름" class="form-control" required>
						</div>
					</div>


					<!-- 닉네임-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nick">별명</label>
						<div class="col-md-2">
							<input id="nick" name="nick" type="text" placeholder="닉네임" class="form-control" required>
						</div>
						<input type=button class='btn btn-sm' value='중복체크'	onclick="nickcheck()">
					</div>


					<!-- 전화번호 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="phone">전화번호</label>
						<div id="phone">
							<div class="col-xs-1">
								<select class="form-control" name="phone1">
									<option>010</option>
									<option>02</option>
									<option>031</option>
									<option>032</option>
									<option>053</option>
									<option>041</option>
								</select>
							</div>
							<div class="col-xs-2">
								<input id="phone2" name="phone2" type="text" class="form-control" required>
							</div>
						</div>
					</div>

					<!-- 성별 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="radios">성별</label>
						<div class="col-md-4">
							<div class="radio">
								<label class="radios-0" for="gender-0">
									<input type="radio" name="gender" id="gender-0" value="0" checked="checked"> 남자
								</label>
								
								<label class="radios-1" for="gender-1">
									<input type="radio" name="gender" id="gender-1" value="1">여자
								</label>
							</div>
						</div>
					</div>

					 <!-- 공인중개사 등록여부 -->

					<div class="form-group">
						<label class="col-md-4 control-label" for="seller">공인중개사 등록여부</label>
						<div class="col-md-4" style="padding-top: 7px">
							<input type="checkbox" class="form-check-input" id="seller" name="seller" value="">
							<label class="form-check-label" for="seller">등록을 원하시면 체크해	주세요</label>
						</div>
					</div>
				
					</fieldset>

					<!-- 공인중개사 등록하겠다는 표시를 누르면 등록폼이 활성화 -->

					
					<fieldset id="sellerform" form="join">
						<!-- 공인중개사 등록 -->
						<legend style="text-align: center;">공인중개사 등록</legend>

						<!-- 공인중개사 번호입력 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="slicense">공인중개사 자격증번호</label>
							<div class="col-md-4">
								<input id="license" name="license" type="text" placeholder="-가 있을 경우 포함하여 입력해주세요"
									class="form-control">
							</div>
							<input type="file" value="중개등록증 첨부">
						</div>


						<!-- 상호명 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="company_name">상호명</label>
							<div class="col-md-3">
								<input id="company_name" name="company_name" type="text" class="form-control">
							</div>
						</div>
						
						<!-- 중개인 사진 -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="photo">중개소 및 중개인 사진 등록</label>
							<div class="col-md-3">
								<input id="photo" name="photo" type="file">
							</div>
						</div>


						<!-- 상호 전화번호-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="company_tel">상호 전화번호</label>
							<div id="company_tel">
								<div class="col-xs-1">
									<select class="form-control" name="company_tel1">
										<option>010</option>
										<option>02</option>
										<option>031</option>
										<option>032</option>
										<option>053</option>
										<option>041</option>
									</select>
								</div>
								<div class="col-xs-2">
									<input id="company_tel2" name="company_tel2" type="text" class="form-control">
								</div>
							</div>
						</div>
						
						</fieldset>
						
						
					
					<!-- seller form 끝 -->
					
					
					<div class="form-group" style="text-align: center">
						<input type=submit id="join" name="join" class="btn" value="가입">
						<input type=button id="cencel" name="cencel" class="btn btn-primary" value="취소">
					</div>
				
					
				</form>
				<!-- 회원가입 및 중개사 등록 폼 끝 -->
				
			
		</div> 
			<!-- row 끝 -->
	</div>
		<!-- container 끝  -->

</div>
<!-- work-section 끝 -->
		
	

</body>
</html>