<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // session을 해제 
    session.invalidate();
    // main으로 이동 
    response.sendRedirect("../main/main.jsp");
%>