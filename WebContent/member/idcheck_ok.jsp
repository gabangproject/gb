<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<jsp:useBean id="dao" class="com.sist.member.MemberDAO"/>
<%
    String id=request.getParameter("id");
    int count=dao.idcheck(id);
%>
<%=count%>