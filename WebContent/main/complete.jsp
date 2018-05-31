<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- �Ź���� ���� bootstrap -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../main/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript">



//�Է°� �ߺ��˻� üũ
/*
 * 	�Է�â�� �ڵ��ϼ� ����� Ȱ���ؼ� �Է��� �Ҷ���
 * 	�Է°��� ���� ��� ����ִ� ���̴��� ������ ���������� �������� �ʴ� �������� �߻�
 */
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
            	 $("#join").prop("disabled", true);
                 $(input).css("background-color", "#FFCECE");
              	 
             } 
             else if (count == '0') 
             {
            	 $("#join").prop("disabled", false);
                 $(input).css("background-color", "#B0F6AC");
       			           
             }  
             else if (count == '1') 
             {	
       
            	 $(input).css("background-color", "#FFCECE");
            	 $("#join").prop("disabled", true);
   
             }  
         }
     });
}



// input �Է°� ��ȿ�� üũ �Լ�(eamil�̸� eamil���� ��ȭ��ȣ�� ��ȭ��ȣ ���Ŀ� �´��� Ȯ���ϴ� �Լ�) 
function pCheck(input)
{
	
	var inputed=input.value;
	
	var checker=$(input).attr('name');
	
	var numberCheck="";
	
	switch(checker)
	{
	case 'phone': 
	case 'compTel':
					numberCheck=/^\d{2,3}-\d{3,4}-\d{4}$/;
				    break;
	
	case 'license': 
					numberCheck=/^\d{5}-\d{4}-\d{5}$/;
				    break;
	
	case 'email': 
					numberCheck=/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
				    break;
	
	};
	
	if(numberCheck.test(inputed)==false)
		{
		input.setCustomValidity(checker+" ������ �߸��Ǿ����ϴ�.");
		$("#join").prop("disabled", true);
		}
	else{
		input.setCustomValidity("");
		
		}
}


//JSP������ �޸𸮿� �ε� �Ǿ�����
$(function(){

	//���Թ�ư ��Ȱ��ȭ
	//$('#join').prop("disabled",true);
	//$('.ncs').attr("required",true);
	
	//��й�ȣ ���Է½� ��ġ���� Ȯ��
	var password = document.getElementById("password");
	var confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
		
	if(password.value != confirm_password.value) 
		{
	  		confirm_password.setCustomValidity("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		} 
	else{
	  		confirm_password.setCustomValidity('');
		}

	}

	 password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword; 
	
	

	//�߰��� ���� üũ�ڽ��� ǥ���ϸ� �߰��� ���� �Է� �� ����
	$('#sellerform').hide();
	$('#seller').click(function(){
		$('#sellerform').toggle();
		
		//alert($("#id").css("background-color"));
		//alert($("input[style='background-color:rgb(176, 246, 172)']").length);
		
		var check=$('#seller').prop( "checked" );
		if(check==true)
			{
			$('#sellerform .sri').attr("required",true);
				
				/* if($("input[background-color='#B0F6AC']")>=5)
				{
				$("#join").prop("disabled", false);
				} */
			}
		else
			{
			$('#sellerform input').attr("required",false);
				
				
						
					
					/* 	$("input").css("background-color")=='')
					{
					
					} */
			
				
			}
	});

	
});
</script>

<!-- �Ź���� ���� bootstrap �� -->


</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section">
		<div class="container" >
			
			<div class="row" >
				 <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box" > 
					<h1>��� �Ϸ�</h1>
					
				</div>
			</div>
		

		<div class="row" >
			<!-- Contact Section -->
		    
		          <div class="text-center" style="width:50%;margin:0px auto">
		            <h2>����� �Ϸ�Ǿ����ϴ�.</h2>
		            <p>�����մϴ�!</p>
		            <ul class="list-inline banner-social-buttons">
		              <li class="list-inline-item">
		                <a href="main.do" class="btn btn-default btn-lg">
		                  <i class="fa fa-twitter fa-fw"></i>
		                  <span class="network-name">���� ����</span>
		                </a>
		              </li>
		              <li class="list-inline-item">
		                <a href="maemool_detail.do?num=${num }&x=${x}&y=${y}" class="btn btn-default btn-lg">
		                  <i class="fa fa-github fa-fw"></i>
		                  <span class="network-name">��ϱ� ����</span>
		                </a>
		              </li>
		              <intpu type=hidden name="num" value="${num }">
		              <intpu type=hidden name="x" value="${x }">
		              <intpu type=hidden name="x" value="${y }">
		            </ul>
		          </div>
		        
			
		</div> 
			<!-- row �� -->
	</div>
		<!-- container ��  -->

</div>
<!-- work-section �� -->
		
		
		


</body>
</html>