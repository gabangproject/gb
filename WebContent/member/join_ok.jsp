<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dao" class="com.sist.member.MemberDAO"/>
<jsp:useBean id="vo" class="com.sist.member.MemberVO">
	<jsp:setProperty name="vo" property="*"/> <!-- �Ѿ���� ��簪�� �޾��ش�  vo�ȿ�ä��� -->
</jsp:useBean>
<%
	dao.memberJoin(vo);
	response.sendRedirect("../main/main.jsp?mode=5");
%>
