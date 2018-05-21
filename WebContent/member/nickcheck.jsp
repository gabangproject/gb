<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../main/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.row{
	width:280px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		//id라는 id를 가진 태그의 value값을 id라는 변수에 저장
		var nick=$('#nick').val();
		//id가 공백이라면
		if(nick.trim()=="")
			{	//id라는 id를 가진 태그에 다시
				$('#nink').focus();
				return;
			}
		//ajax 시작 - ajax는 서버에 request를 보내고 response를 받으면 내정되어 있던 함수가 실행
		$.ajax({
			type:'post',
			url:'../main/nick_ok.do', // 값 보내기
			data:{"nick":nick}, // 어떤값을 보낼건지
			/* async:false, */
			success:function(res) // 결과값
		    {
		    	 var html="";
		    	
		    	 if(res.trim()==0)
		    	{
		    		html="<tr><td>"+nick+"는(은) 사용 가능한 아이디입니다</td></tr>"
		    		    +"<tr><td class='text-center'><input type='button' class='btn btn-sm btn-success' onclick=ok() value=확인></td></tr>";
		    	}
		    	else
		    	{
		    		html="<tr><td>"+nick+"는(은) 사용중인 아이디입니다</td></tr>";
		    	}
		    	$('#result').html(html); 
		    }
		});
	});
});
function ok()
{
	parent.frm.nick.value=$('#nick').val();
	parent.Shadowbox.close();
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
			<tr>
				<td>닉네임:<input type=text size=10 id=nick>
					<input type=button value="중복체크" class="btn btn-sm btn-danger" id="checkBtn">
				</td>
			</tr>
			<tr class="warning">
				<table class="table" id="result">
				
				</table> 
			</tr>
			</table>
		</div>
	</div>
</body>
</html>