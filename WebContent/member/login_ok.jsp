<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <c:if test="${loginIdCheck==0 }">
 	<script>
	alert('id가 존재하지 않습니다.');
	history.back();
	</script>
 </c:if>
 
 
 	<c:if test="${db_pwd!=pwd }">
 		<script>
			alert('비밀번호가 틀립니다.');
			history.back();
		</script>
 	</c:if>
 	<c:if test="${db_pwd==pwd }">
 		
 		<script>
 		window.parent.location.href="../main/main.do";
 		</script>
 		
 	
 	</c:if>