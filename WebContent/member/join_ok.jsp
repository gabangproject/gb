<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dao" class="com.sist.member.MemberDAO"/>
<jsp:useBean id="vo" class="com.sist.member.MemberVO">
	<jsp:setProperty name="vo" property="*"/> <!-- 넘어오는 모든값을 받아준다  vo안에채운다 -->
</jsp:useBean>
<%
	dao.memberJoin(vo);
	response.sendRedirect("../main/main.jsp?mode=5");
%>
