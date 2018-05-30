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
$(function(){//window.onload ->�����찡 Ŀ���� ��
	$('#ok').click(function(){
		
		//id��� id������ �Ǿ��ִ� ���� value���� id������ �ִ´�.
		var id=$('#id').val();
		
		//id�� ���� �����̸� id�� focus�� �д�.
		if(id.trim()=="")
			{
				$('#id').focus();
				return;
			}
		
		//�ƴϸ� ajax�� Ȱ���ؼ� ó��
		$.ajax({
			//type ������� �Ű������� ������.
			type:'post',
			
			//idcheck_ok.jsp��
			url:'idcheck_ok.jsp',
			//id ���� id��� �̸�����
			data:{"id":id},//�տ� �ִ� id�� ������ �ڿ��ִ� id�� ������ �ش��ϴ� ��
			
			//ajax�� �����ϸ�
			success:function(res)//res�� url�� ���� �� return�� ����� 
				{
				
			    	var html="";
			    	if(res.trim()==0)
			    	{
			    		html="<tr><td>"+id+"��(��) ��� ������ ���̵��Դϴ�</td></tr>"
			    		    +"<tr><td class='text-center'><input type='button' class='btn btn-sm btn-success' onclick=ok() value=Ȯ��></td></tr>";
			    	}																						//�̹�ư�� Ŭ���ϸ� ok�Լ� ����
			    	else
			    	{
			    		html="<tr><td>"+id+"��(��) ������� ���̵��Դϴ�</td></tr>";
			    	}
			    	//���� ���ǿ� ����  html������ �� ���� result��� id�� ���� �±װ� ���ΰ� �ִ°��� html�� ������ �����ض�(html�±׸� ��������� �±׵� ���� ��)
			    	$('#result').html(html);
			    }
			});
	});
});
 /* function ok()
{	
	 if($('input[name=img]').value!=null)
	 {
		 $('#complete').text('��ϿϷ�')
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
                <label>���� ��� </label>
                <input type="file" name="img" multiple="multiple"
									style="apperance: none;	-webkit-apperance: none;" required>
              </div>
              
              <input type=submit class='btn btn-sm' id="ok" value="���� ���" style="margin:0px auto">
              <div id="complete"></div>
            
          </form>
	      
	      
	  </div>
	   
	</div>
</div>
</body>
</html>