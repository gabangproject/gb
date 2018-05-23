<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>





<!-- 로그인 ui 관련 부트스트랩 -->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


 


<style type="text/css">
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}

</style>

<script>
function join()
{
	window.parent.location.href="../main/join.do";
	
}


/* ajax 로그인 처리 코드상 문제 없는거 같으나 오류남
function loginCheck()
{
	//이메일 값
	var email = $('#email').val();
	var pwd = $('#pwd').val();
	
	
	 $.ajax({
		 type:'post',
         data : {"email" : email,"pwd" : pwd},
         url : "../main/login_ok.do",
         success : function(data) {
        	 var state=data.trim();
        	 
        	
             if (state == "NOID") 
             {
            	 
            	 //$('#email').setCustomValidity("등록되지 않은 ID입니다.");
                 
                 alert('등록되지 않은 ID입니다.');
                 
                 
             }  
             else if (state == "NOPWD") 
             {
            	 
            	 //$('#pwd').setCustomValidity("비밀번호가 일치하지 않습니다.");
            	 alert('비밀번호가 일치하지 않습니다.');
            	 //history.back();
            	 
                 
             }
             else 
             {

                 window.parent.location.href=parent.document.location.href;
            	 
             } 
             
             
         	}
     		});
	
}   */



</script>


</head>
<body>
<div class="container" >
    <div class="row">
    
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign in to GaBang</h1>
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120">
                
                <form class="form-signin" method=post action="../main/login_ok.do">
                
                <input type="text" class="form-control" id="email" name="email" placeholder="Email"  required autofocus>
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required>
                <!-- <input type="submit" class="btn-lg btn-primary btn-block" onclick="loginCheck()" value="로그인"> -->
                <button class="btn btn-lg btn-primary btn-block" type="submit" >로그인</button>
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">Remember me
                </label>
                <a href="#" class="pull-right need-help">Need help? </a>
                <span class="clearfix"></span>
                	
                </form>
                
            </div>
            
            <a class="text-center new-account" onclick="join()">회원가입 </a>
        </div>
        
    </div>
</div>

</body>

</html>