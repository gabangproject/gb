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
<!-- �Ź���� ���� bootstrap -->

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../main/js/bootstrap.min.js"></script>


<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript">
//�Է°� �ߺ��˻� �ǽð� üũ
function Check(input)
{
	var inputed = $(input).val();
	var checker=$(input).attr('name');
	
	
	 $.ajax({
         data : {param : inputed,checker : checker },
         url : "../main/check_ok.do",
         success : function(data) {
        	 var count=data.trim();
        	 
             if(inputed=="") 
             {
                 //$(".signupbtn").prop("disabled", true);
                // $(".signupbtn").css("background-color", "#aaaaaa");
                 $(input).css("background-color", "#FFCECE");
                 //idCheck = 0;
             } 
             else if (count == '0') 
             {
                 $(input).css("background-color", "#B0F6AC");
                 //idCheck = 1;
                 /* if(idCheck==1 && pwdCheck == 1) {
                     $(".signupbtn").prop("disabled", false);
                     $(".signupbtn").css("background-color", "#4CAF50");
                     signupCheck();
                 }  */
             }  
             else if (count == '1') 
             {
                 //$(".signupbtn").prop("disabled", true);
                 //$(".signupbtn").css("background-color", "#aaaaaa");
                 $(input).css("background-color", "#FFCECE");
                 $(input).setCustomValidity("��ϵ� "+checker+"�Դϴ�.");
                 //idCheck = 0;
             }  
         }
     });
	
	/* Shadowbox.open({
		content:'../member/id_check.jsp',
		title:'���̵��ߺ�üũ',
		player:'iframe',
		width:300,
		height:200
	}); */
}


//shadowbox�� �ߺ��˻� üũ�ϴ°� ���� �̿ϼ�
Shadowbox.init({players:["iframe"]});
function sCheck(input)
{
	 
	 var checker=$(input).attr('name');
	 
	Shadowbox.open({
		content:'../member/shadow_check.jsp',
		title: checker+' �ߺ�üũ',
		player:'iframe',
		data: {checker:checker},
		width:400,
		height:200
	});
}/*
function phoneCheck()
{
	Shadowbox.open({
		content:'../member/phone_check.jsp',
		title:'��ȭ��ȣ �ߺ�üũ',
		player:'iframe',
		width:300,
		height:200
	});
}
function licenseCheck()
{
	Shadowbox.open({
		content:'../member/license_check.jsp',
		title:'�����߰��� �ڰݹ�ȣ �ߺ�üũ',
		player:'iframe',
		width:400,
		height:200
	});
}
function ctCheck()
{
	Shadowbox.open({
		content:'../member/compTel_check.jsp',
		title:'�����߰��� ��ȭ��ȣ �ߺ�üũ',
		player:'iframe',
		width:400,
		height:200
	});
} */

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
		input.setCustomValidity(checker+" ������ �߸��Ǿ����ϴ�.");
		}
	else{
		input.setCustomValidity("");
		}
}

/* //��ȭ��ȣ ��ȿ�� üũ �Լ� 
function lCheck(input)
{
	
	var license=input.value;
	var numberCheck=/^\d{5}-\d{4}-\d{5}$/g;
	if(numberCheck.test(license)==false)
		{
		input.setCustomValidity("�ǹٸ� �ڰݹ�ȣ�� �ƴմϴ�.");
		}
	else{
		input.setCustomValidity("");
		}
}

function iCheck(input)
{
	//+�� 1�� �̻� _ - ��?
	var id=input.value;
	var numberCheck=/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	if(numberCheck.test(id)==false)
		{
		input.setCustomValidity("�ǹٸ� �̸����ּҰ� �ƴմϴ�.");
		}
	else{
		input.setCustomValidity("");
		}
} */


$(function(){


	//��й�ȣ ���Է½� ��ġ���� Ȯ��
	var password = document.getElementById("password");
	var confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
		
	if(password.value != confirm_password.value) {
		
	  confirm_password.setCustomValidity("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	} else {
	  confirm_password.setCustomValidity('');
	}

	}

	 password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword; 
	
	
	//�߰��� ���� üũ�ϸ� �߰��� ���� �Է� �� ����
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

<!-- �Ź���� ���� bootstrap �� -->


</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section">
		<div class="container" >
			
			<div class="row" >
				 <div class=" text-center heading-section animate-box" > 
					<h3>ȸ������</h3>
				</div>
			</div>


		<!-- ȸ������ �� �߰��� ��� �� -->
		
			<div class="row">

				<form class="form-horizontal" id="join" name="frm" method="post" action="../main/join_ok.do">
					
					<fieldset form="join">
					
					
					<!-- ID�Է�-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="id">���̵�
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="id" name="email" type="text" placeholder="UserID (Email)" class="form-control"   
							oninput="Check(this),pCheck(this)" style="background-color:white;" required>
							 
						</div>
						<input type=button class='btn btn-sm' name="email" value='�ߺ�üũ' onclick="sCheck(this)">
					</div>


					<!-- ��й�ȣ �Է�-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="password">��й�ȣ
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-3">
							<input id="password" minlength="8" maxlength="12" name="password" type="password" placeholder="password"
								class="form-control" >
								<small id="passwordHelpInline" class="text-muted">
      							��й�ȣ 8~12�� �Է�
    							</small>
						</div>
						<div class="col-md-3">
							<input id="confirm_password" name="confirm_password" type="password" placeholder="Re-type password"
								class="form-control">
						</div>
					</div>


					<!-- �̸�-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="name">�̸�
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="name" name="name" type="text" placeholder="�̸�" class="form-control" >
						</div>
					</div>


					<!-- �г���-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="nick">����
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-2">
							<input id="nick" name="nick" type="text" placeholder="�г���" class="form-control" 
							oninput="Check(this)" style="background-color:white;">
						</div>
						<input type=button class='btn btn-sm' name="nick" value='�ߺ�üũ'	onclick="sCheck(this)">
					</div>


					<!-- ��ȭ��ȣ -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="phone">��ȭ��ȣ
						<span class="text-danger">*</span>
						</label>
							<div class="col-md-3">
								<input id="phone" name="phone" type="text" class="form-control" oninput="Check(this),pCheck(this)"
								required placeholder="-�� �����Ͽ� �Է����ּ���." title="-�� �����Ͽ� �Է����ּ���.">
							</div>
							<input type=button class='btn btn-sm' name="phone" value='�ߺ�üũ'	onclick="sCheck(this)">
						
					</div>

					<!-- ���� -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="radios">����
						<span class="text-danger">*</span>
						</label>
						<div class="col-md-4">
							<div class="radio">
								<label class="radios-0" for="gender-0">
									<input type="radio" name="gender" id="gender-0" value="����" checked="checked"> ����
								</label>
								
								<label class="radios-1" for="gender-1">
									<input type="radio" name="gender" id="gender-1" value="����">����
								</label>
							</div>
						</div>
					</div>

					 <!-- �����߰��� ��Ͽ��� -->

					<div class="form-group">
						<label class="col-md-2 control-label" for="seller">�����߰��� ��Ͽ���</label>
						<div class="col-md-4" style="padding-top: 7px">
							<input type="checkbox" class="form-check-input" id="seller" name="seller">
							<label class="form-check-label" for="seller">����� ���Ͻø� üũ��	�ּ���</label>
						</div>
					</div>
				
					</fieldset>

					<!-- �����߰��� ����ϰڴٴ� ǥ�ø� ������ ������� Ȱ��ȭ -->

					
					<fieldset id="sellerform" form="join">
						<!-- �����߰��� ��� -->
						<legend style="text-align: center;">�����߰��� ���</legend>

						<!-- �����߰��� ��ȣ�Է� -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="license">�����߰��� �ڰ�����ȣ
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-3">
								<input id="license" name="license" type="text" placeholder="-�� ���� ��� �����Ͽ� �Է����ּ���" class="form-control" 
								oninput="Check(this),pCheck(this)">
							</div>
							<input type=button class='btn btn-sm' name="license" value='�ߺ�üũ'	onclick="sCheck(this)">
							<!-- <input type="file" value="�߰������ ÷��"> -->
						</div>
						
						
						 <!-- �߰��� ���� -->
						<!-- <div class="form-group">
							<label class="col-md-4 control-label" for="photo">�߰��� �� �߰��� ���� ���</label>
							<div class="col-md-3">
								<input id="photo" name="photo" type="file">
							</div>
						</div>  -->
						

						<!-- ��ȣ�� -->
						<div class="form-group">
							<label class="col-md-2 control-label" for="comp_name">��ȣ��
							<span class="text-danger">*</span>
							</label>
							<div class="col-md-3">
								<input id="comp_name" name="comp_name" type="text" class="form-control">
							</div>
						</div>
						
						
						<!-- ��ȣ�ּ� -->
						<div class="form-group" >
							
								<label class="col-md-2 control-label" for="firstname">��ȣ�ּ�
								<span class="text-danger">*</span>
								</label>
								<div class="col-md-3">
								<input type="text" id="postcode" name="postcode" class="form-control" placeholder="�����ȣ" onclick="searchPostcode()" readonly>
								
								<input type="text" id="address" name="address" class="form-control" placeholder="�ּ�" style="margin-top:5px;margin-bottom:5px;" 
								onclick="searchPostcode()" readonly>
								
								<input type="text" id="detailAddress" name="detailAddress" class="form-control" placeholder="���ּ�">
								<!-- <span id="guide" style="color:#999"></span> �ּҸ� Ŭ���ϸ� â�� ������� -->
								</div>
								<input type=button class='btn btn-sm' onclick="searchPostcode()" value="�ּҰ˻�" >
							
						</div>


						<!-- ��ȣ ��ȭ��ȣ-->
						<div class="form-group">
							<label class="col-md-2 control-label" for="compTel">��ȣ ��ȭ��ȣ
							<span class="text-danger">*</span>
							</label>
								
								<div class="col-md-3">
									<input id="compTel" name="compTel" type="text" class="form-control" onblur="pCheck(this)" oninput="Check(this),pCheck(this)" 
									placeholder="-�� �����Ͽ� �Է����ּ���.">
								</div>
								<input type=button class='btn btn-sm' name="compTel" value='�ߺ�üũ'	onclick="sCheck(this)">
							
						</div>
						
						</fieldset>
						
						
					
					<!-- seller form �� -->
					
					<fieldset id="butt" form="join">
					<div class="form-group" >
						<input type=submit id="join" name="join" class="btn" value="����">
						<input type=button id="cencel" name="cencel" class="btn btn-primary" value="���">
					</div>
					</fieldset>
					
				</form>
				<!-- ȸ������ �� �߰��� ��� �� �� -->
				
			
		</div> 
			<!-- row �� -->
	</div>
		<!-- container ��  -->

</div>
<!-- work-section �� -->
		
		
		
<!-- �ּҰ˻� ���� ���� api -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function searchPostcode() {
    	//daum ��ü�� Postcode��� �޼ҵ� ����
        new daum.Postcode({
        		//oncomplete��� �̸����� function(data) �Լ� ����
            oncomplete: function(data) {
            	 // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('address').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('detailAddress').focus();
            	}
            
        }).open();
    }
</script>

</body>
</html>