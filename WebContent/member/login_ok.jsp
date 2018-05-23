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
 
 
 <c:if test="${state=='OK'}">
 		<script>			
 		//로그인을 시도했던 페이지로 이동
 		window.parent.location.href=parent.document.location.href;
 		</script>
 </c:if>
 
