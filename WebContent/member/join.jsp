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

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../main/js/bootstrap.min.js"></script>


<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript">

//입력값 중복검사 실시간 체크


function Check(input)
{
	
	var inputed = $(input).val();
	var checker=$(input).attr('name');
	
	
	 $.ajax({
		 type: 'post',
         data : {param : inputed, checker : checker },
         url : "../main/check_ok.do",
         success : function(data) {
        	 var count=data.trim();
        	 
             if(inputed=="") 
             {
            	 $("#join").prop("disabled", false);
                 $(input).css("background-color", "#FFCECE");
              	 //$(".signupbtn").css("background-color", "#aaaaaa");
                 //idCheck = 0;
             } 
             else if (count == '0') 
             {
                 $(input).css("background-color", "#B0F6AC");
                 $("#join").prop("disabled", false);
                 //idCheck = 1;
                 /* if(idCheck==1 && pwdCheck == 1) {
                     $(".signupbtn").prop("disabled", false);
                     $(".signupbtn").css("background-color", "#4CAF50");
                     signupCheck();
                 */
             }  
             else if (count == '1') 
             {	
            	 $("#join").prop("disabled", true);
                 $(input).css("background-color", "#FFCECE");
                 
                 //$(input).setCustomValidity("등록된 "+checker+"입니다.");
               	 //$(".signupbtn").prop("disabled", true);
                 //$(".signupbtn").css("background-color", "#aaaaaa");
                 
             }  
         }
     });
	
	
}



// input 입력값 유효성 체크 함수(eamil이면 eamil형식 전화번호면 전화번호 형식에 맞는지 확인하는 함수) 
function pCheck(input)
{
	
	var inputed=input.value;
	
	var checker=$(input).attr('name');
	
	var numberCheck="";
	
	switch(checker)
	{
	case 'phone': 
	case 'compTel':
					numberCheck=/^\d{2,3}-\d{3,4}-\d{4}$/g;
				    break;
	
	case 'license': 
					numberCheck=/^\d{5}-\d{4}-\d{5}$/g;
				    break;
	
	case 'email': 
					numberCheck=/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
				    break;
	
	};
	
	if(numberCheck.test(inputed)==false)
		{
		input.setCustomValidity(checker+" 형식이 잘못되었습니다.");
		}
	else{
		input.setCustomValidity("");
		}
}



$(function(){

	
	//비밀번호 재입력시 일치여부 확인
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
	
	
	//중개사 가입 체크하면 중개사 정보 입력 폼 생성
	$('#sellerform').hide();
	$('#seller').click(function(){
		$('#sellerform').toggle();
		
		var check=$('#seller').prop( "checked" );
		if(check==true)
			{
			$('#sellerform .sri').attr("required",true);
			
			}
		else
			{
			$('#sellerform input').attr("required",false);
			}
		
			
		
	});
	
	
	
	
	
	
});
</script>

<!-- 매물등록 관련 bootstrap 끝 -->


</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section">
		<div class="container" >
			
			<div class="row" >
				 <div class=" text-center heading-section animate-box" > 
					<h3>회원가입</h3>
					<small class="text-muted">
					<span class="text-danger">*</span>
      				은 필수입력
    				</small>
				</div>
			</div>


		<!-- 회원가입 및 중개사 등록 폼 -->
		
			<div class="row">

				<form class="form-horizontal" id="join" name="frm" method="post" action="../main/join_ok.do">
					
					<fieldset form="join">
					
					
					<!-- ID입력-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="id">아이디
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="id" name="email" type="text" placeholder="UserID (Email)" class="form-control"   
							oninput="Check(this),pCheck(this)" onblur="Check(this)" style="background-color:white;" required>
							 
						</div>
					</div>


					<!-- 비밀번호 입력-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="password">비밀번호
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-3">
							<input id="password" minlength="8" maxlength="12" name="password" type="password" placeholder="password"
								class="form-control" required>
								<small id="passwordHelpInline" class="text-muted">
      							비밀번호 8~12자 입력
    							</small>
						</div>
						<div class="col-md-3">
							<input id="confirm_password" name="confirm_password" type="password" placeholder="Re-type password"
								class="form-control" required>
						</div>
					</div>


					<!-- 이름-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="name">이름
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="name" name="name" type="text" placeholder="이름" class="form-control" required>
						</div>
					</div>


					<!-- 닉네임-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="nick">별명
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="nick" name="nick" type="text" placeholder="닉네임" class="form-control" 
							oninput="Check(this)" style="background-color:white;" required>
						</div>
						<input type=button class='btn btn-sm' name="nick" value='중복체크'	onclick="sCheck(this)" >
					</div>


					<!-- 전화번호 -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="phone">전화번호
						<span class="text-danger">*</span>
						</label>
							<div class="col-md-3">
								<input id="phone" name="phone" type="text" class="form-control" oninput="Check(this),pCheck(this)"
								required placeholder="-를 포함하여 입력해주세요." title="-를 포함하여 입력해주세요.">
							</div>
							<input type=button class='btn btn-sm' name="phone" value='중복체크'	onclick="sCheck(this)">
						
					</div>

					<!-- 성별 -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="radios">성별
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-4" required>
							<div class="radio">
								<label class="radios-0" for="gender-0">
									<input type="radio" name="gender" id="gender-0" value="남자" checked="checked"> 남자
								</label>
								
								<label class="radios-1" for="gender-1">
									<input type="radio" name="gender" id="gender-1" value="여자">여자
								</label>
							</div>
						</div>
					</div>

					 <!-- 공인중개사 등록여부 -->

					<div class="form-group">
						<label class="col-md-2 control-label" for="seller">공인중개사 등록여부</label>
						<div class="col-md-4" style="padding-top: 7px">
							<input type="checkbox" class="form-check-input" id="seller" name="seller">
							<label class="form-check-label" for="seller">등록을 원하시면 체크해주세요</label>
						</div>
					</div>
				
					</fieldset>

					<!-- 공인중개사 등록하겠다는 표시를 누르면 등록폼이 활성화 -->

					
					<fieldset id="sellerform" form="join">
					
						<!-- 공인중개사 등록 -->
						<legend style="text-align: center;">공인중개사 등록</legend>

						<!-- 공인중개사 번호입력 -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="license">공인중개사 자격증번호
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-3">
								<input id="license" name="license" type="text" placeholder="-가 있을 경우 포함하여 입력해주세요" title="-를 포함하여 입력해주세요." 
								class="form-control sri" oninput="Check(this),pCheck(this)">
							</div>
							<!-- <input type="file" value="중개등록증 첨부"> -->
						</div>
						
						
						 <!-- 중개인 사진 -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="pic">중개소 및 중개인 사진 등록</label>
							<div class="col-md-3">
								<input id="pic" name="pic" type="file">
							</div>
						</div>  
						

						<!-- 상호명 -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="comp_name">상호명
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-3">
								<input id="comp_name" name="comp_name" type="text" class="form-control sri">
							</div>
						</div>
						
						
						<!-- 상호주소 -->
						<div class="form-group" >
							
								<label class="col-md-2 control-label" for="firstname">상호주소
								<span class="text-danger">*</span>
								</label>
								<div class="col-md-3">
								<input type="text" id="postcode" name="postcode" class="form-control sri" placeholder="우편번호" onclick="searchPostcode()" readonly>
								
								<input type="text" id="address" name="address" class="form-control sri" placeholder="주소" style="margin-top:5px;margin-bottom:5px;" 
								onclick="searchPostcode()" readonly>
								
								<input type="text" id="detailAddress" name="detailAddress" class="form-control sri" placeholder="상세주소">
								<!-- <span id="guide" style="color:#999"></span> 주소를 클릭하면 창이 사라진다 -->
								</div>
								<input type=button class='btn btn-sm' onclick="searchPostcode()" value="주소검색" >
							
						</div>


						<!-- 상호 전화번호-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="compTel">상호 전화번호
							<span class="text-danger">*</span>
							</label>
								
								<div class="col-md-3">
									<input id="compTel" name="compTel" type="text" class="form-control sri" oninput="Check(this),pCheck(this)" 
									placeholder="-를 포함하여 입력해주세요." title="-를 포함하여 입력해주세요.">
								</div>
						</div>
						
						<!-- 중개사 소개  -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="intro">중개사 소개</label>
							<div class="col-md-5">
								<textarea class="form-control" rows="5" id="intro" name="intro"></textarea>
							</div>								
						</div>
						
						</fieldset>
						
						
					
					<!-- seller form 끝 -->
					
					<fieldset id="butt" form="join">
					<div class="form-group" >
						<input type=submit id="join" name="join" class="btn" value="가입">
						<input type=button id="cencel" name="cencel" class="btn btn-primary" value="취소">
					</div>
					</fieldset>
					
				</form>
				<!-- 회원가입 및 중개사 등록 폼 끝 -->
				
			
		</div> 
			<!-- row 끝 -->
	</div>
		<!-- container 끝  -->

</div>
<!-- work-section 끝 -->
		
		
		
<!-- 주소검색 관련 다음 api -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function searchPostcode() {
    	//daum 객체에 Postcode라는 메소드 선언
        new daum.Postcode({
        		//oncomplete라는 이름으로 function(data) 함수 실행
            oncomplete: function(data) {
            	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
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
            	}
            
        }).open();
    }
</script>

</body>
</html>