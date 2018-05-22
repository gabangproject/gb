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
		//id��� id�� ���� �±��� value���� id��� ������ ����
		var id=$('#id').val();
		//id�� �����̶��
		if(id.trim()=="")
			{	//id��� id�� ���� �±׿� �ٽ�
				$('#id').focus();
				return;
			}
		//ajax ���� - ajax�� ������ request�� ������ response�� ������ �����Ǿ� �ִ� �Լ��� ����
		$.ajax({
			type:'post',
			url:'../main/idcheck_ok.do', // �� ������
			data:{"id":id}, // ����� ��������
			/* async:false, */
			success:function(res) // �����
		    {
		    	 var html="";
		    	
		    	 if(res.trim()==0)
		    	{
		    		html="<tr><td>"+id+"��(��) ��� ������ ���̵��Դϴ�</td></tr>"
		    		    +"<tr><td class='text-center'><input type='button' class='btn btn-sm btn-success' onclick=ok() value=Ȯ��></td></tr>";
		    	}
		    	else
		    	{
		    		html="<tr><td>"+id+"��(��) ������� ���̵��Դϴ�</td></tr>";
		    	}
		    	$('#result').html(html); 
		    }
		});
	});
});
function ok()
{
	parent.frm.id.value=$('#id').val();
	parent.Shadowbox.close();
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
			<tr>
				<td>ID:<input type=text size=10 id=id>
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