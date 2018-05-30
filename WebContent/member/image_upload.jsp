<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style type="text/css">
.files input {
    outline: 2px dashed #92b0b3;
    outline-offset: -10px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear;
    padding: 120px 0px 85px 35%;
    text-align: center !important;
    margin: 0;
    width: 100% !important;
}
.files input:focus{     outline: 2px dashed #92b0b3;  outline-offset: -10px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear; border:1px solid #92b0b3;
 }
.files{ position:relative}
.files:after {  pointer-events: none;
    position: absolute;
    top: 60px;
    left: 0;
    width: 50px;
    right: 0;
    height: 56px;
    content: "";
    background-image: url(https://image.flaticon.com/icons/png/128/109/109612.png);
    display: block;
    margin: 0 auto;
    background-size: 100%;
    background-repeat: no-repeat;
}
.color input{ background-color:#f1f1f1;}
.files:before {
    position: absolute;
    bottom: 10px;
    left: 0;  pointer-events: none;
    width: 100%;
    right: 0;
    height: 57px;
    content: " or drag it here. ";
    display: block;
    margin: 0 auto;
    color: #2ea591;
    font-weight: 600;
    text-transform: capitalize;
    text-align: center;
}
</style>
<script>
$(function(){//window.onload ->윈도우가 커졌을 때
	$('#ok').click(function(){
		
		//id라는 id설정이 되어있는 것의 value값을 id변수에 넣는다.
		var id=$('#id').val();
		
		//id의 값이 공백이면 id에 focus를 둔다.
		if(id.trim()=="")
			{
				$('#id').focus();
				return;
			}
		
		//아니면 ajax를 활용해서 처리
		$.ajax({
			//type 방식으로 매개변수를 보낸다.
			type:'post',
			
			//idcheck_ok.jsp로
			url:'idcheck_ok.jsp',
			//id 값을 id라는 이름으로
			data:{"id":id},//앞에 있는 id는 변수명 뒤에있는 id는 변수에 해당하는 값
			
			//ajax가 성공하면
			success:function(res)//res가 url로 보낸 뒤 return한 결과값 
				{
				
			    	var html="";
			    	if(res.trim()==0)
			    	{
			    		html="<tr><td>"+id+"는(은) 사용 가능한 아이디입니다</td></tr>"
			    		    +"<tr><td class='text-center'><input type='button' class='btn btn-sm btn-success' onclick=ok() value=확인></td></tr>";
			    	}																						//이번튼을 클릭하면 ok함수 실행
			    	else
			    	{
			    		html="<tr><td>"+id+"는(은) 사용중인 아이디입니다</td></tr>";
			    	}
			    	//위의 조건에 맞춰  html변수에 들어간 값을 result라는 id를 가진 태그가 감싸고 있는곳에 html의 내용을 삽입해라(html태그를 사용했으니 태그도 같이 들어감)
			    	$('#result').html(html);
			    }
			});
	});
});
 /* function ok()
{	
	 if($('input[name=img]').value!=null)
	 {
		 $('#complete').text('등록완료')
	 }
	
}  */
</script>
</head>
<body>
<div class="container">
	<div class="row">
	  <div class="col-md-6">
	      <form id="maemul_upload2" class="form-horizontal" method="post" enctype="multipart/form-data" action="../main/imageUpload.do">
           
              
              
              
              <div class="form-group files">
                <label>사진 등록 </label>
                <input type="file" name="img" multiple="multiple"
									style="apperance: none;	-webkit-apperance: none;" required>
              </div>
              
              <input type=submit class='btn btn-sm' id="ok" value="사진 등록" style="margin:0px auto">
              <div id="complete"></div>
            
          </form>
	      
	      
	  </div>
	   
	</div>
</div>
</body>
</html>