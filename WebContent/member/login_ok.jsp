<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <c:if test="${loginIdCheck==0 }">
 	<script>
	alert('id�� �������� �ʽ��ϴ�.');
	history.back();
	</script>
 </c:if>
 
 
 	<c:if test="${db_pwd!=pwd }">
 		<script>
			alert('��й�ȣ�� Ʋ���ϴ�.');
			history.back();
		</script>
 	</c:if>
 	<c:if test="${db_pwd==pwd }">
 		
 		<script>
 		window.parent.location.href="../main/main.do";
 		</script>
 		
 	
 	</c:if>