<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:if test="${state=='NOID' }">
 	<script>
	alert('id�� �������� �ʽ��ϴ�.');
	history.back();
	</script>
 </c:if>
 
 
 <c:if test="${state=='NOPWD' }">
 	<script>
	alert('��й�ȣ�� Ʋ���ϴ�.');
	history.back();
	</script>
 </c:if>
 
 
 <c:if test="${state=='OK'}">
 		<script>			
 		//�α����� �õ��ߴ� �������� �̵�
 		window.parent.location.href=parent.document.location.href;
 		</script>
 </c:if>
 
