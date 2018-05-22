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
	width:400px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		//id��� id�� ���� �±��� value���� id��� ������ ����
		var compTel=$('#compTel').val();
		//id�� �����̶��
		if(compTel.trim()=="")
			{	//id��� id�� ���� �±׿� �ٽ�
				$('#compTel').focus();
				return;
			}
		//ajax ���� - ajax�� ������ request�� ������ response�� ������ �����Ǿ� �ִ� �Լ��� ����
		$.ajax({
			type:'post',
			url:'../main/compTel_ok.do', // �� ������
			data:{"compTel":compTel}, // ����� ��������
			/* async:false, */
			success:function(res) // �����
		    {
		    	 var html="";
		    	
		    	 if(res.trim()==0)
		    	{
		    		html="<tr><td>"+compTel+"��(��) ��� ������ ��ȭ��ȣ�Դϴ�</td></tr>"
		    		    +"<tr><td class='text-center'><input type='button' class='btn btn-sm btn-success' onclick=ok() value=Ȯ��></td></tr>";
		    	}
		    	else
		    	{
		    		html="<tr><td>"+compTel+"��(��) ������� ��ȭ��ȣ�Դϴ�</td></tr>";
		    	}
		    	$('#result').html(html); 
		    }
		});
	});
});
function ok()
{
	parent.frm.compTel.value=$('#compTel').val();
	parent.Shadowbox.close();
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
			<tr>
				<td>�߰��� ��ȭ��ȣ:<input type=text size=10 id=compTel>
					<input type=button value="�ߺ�üũ" class="btn btn-sm btn-danger" id="checkBtn">
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