<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>

<script>

Shadowbox.init({
	players:["iframe"]
});


function idcheck()
{
 Shadowbox.open({
	 content:'../member/login.jsp',
	 title:'�α���',
	 player:'iframe',
	 width:350,
	 height:500
 });	
 
 
};

/* function logout()
{
	var page=window.location.href
	$('#page').val(page);
	
	//alert=(page);
			//this �ǹ̴� Ŭ���� �ڽ� .attr("value")�� value��� �Ӽ��� ���� �����´�.
	  $.ajax({
		type:'POST',
		url:'logout.do',//
		data:{"page":page},//url�� ���� �� type��� ������ ���� type��� ������ url�� ������.
		 success:function(page)
		{			
			alert(page);
			location.href=page;
			//$('#print').html(res);
			//#print id �� ���� ���� ������ html�� �����ض�
		} 
	}); 
	 location.href="logout.do"	 
	
	
	//alert(window.location.href);
}; */

</script>



</head>
<body>
	<div id="fh5co-header" >
		<header id="fh5co-header-section" style="background-color: black;">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
					<h1 id="fh5co-logo">
						<a href="main.do">Ga<span>Bang</span></a>
					</h1>
					
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li><a href="main.do">Home</a></li>
							<li><a href="notice.do" class="fh5co-sub-ddown">��������</a></li>
							<li><a href="qnaboard.do">Q&A �Խ���</a></li>
							<li><a href="like.do">���ɸ��</a></li>
							
						<c:if test="${sessionScope.nick==null }">
							<li><a onclick="idcheck()" style='cursor:pointer'>ȸ������ / �α���</a></li>
						</c:if>
						
						<c:if test="${sessionScope.nick!=null }">
							<li><a class="fh5co-sub-ddown">����������</a>
								<ul class="fh5co-sub-menu">
										<li><a href="jjim_list.do" target="_blank">���� �Ź� ����</a></li>
										<li><a href="#" target="_blank">�������� ����</a></li>
									<c:if test="${sessionScope.grade!='2' }">	
										<li><a href="maemul_upload.do" target="_blank">�Ź����</a></li>
									</c:if>
								</ul>
							</li>
							<!-- <form method="post" action="logout.do"> -->
							<li><a href="logout.do">�α׾ƿ�
								<!-- <input id="page" type="hidden" value=""> -->
								
								</a></li>
							</form>
							<%-- <c:if test="${requestScope!=null }">
								<c:redirect url="logout.do"/>
							</c:if> --%>
						</c:if>
							
						</ul>
					</nav>
					
				</div>
			</div>
		</header>

	</div>
	




	
</body>
</html>