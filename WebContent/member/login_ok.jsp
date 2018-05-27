<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:if test="${state=='NOID' }">
 	<script>
	alert('id가 존재하지 않습니다.');
	history.back();
	</script>
 </c:if>
 
 
 <c:if test="${state=='NOPWD' }">
 	<script>
	alert('비밀번호가 틀립니다.');
	history.back();
	</script>
 </c:if>
 
 
 <c:if test="${state=='ALREADY' }">
 	<script>
 	if(confirm("이미 로그인한 아이디입니다.\n기존 로그인을 취소하고 로 다시 로그인 하시겠습니까?")==true)
 		{
 		window.parent.location.href="../main/reLogin.do";
 		}
 	else
 	{
 		history.back();
 	}
 	
	</script>
	
 </c:if>
 
 
 <c:if test="${state=='OK'}">
 
				<script>			
		 		//로그인을 시도했던 페이지로 이동
		 		window.parent.location.href=parent.document.location.href;
		 		</script>
 
 </c:if>
 
