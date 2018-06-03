<%@page import="com.gabang.vo.MapVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%-- ����Ʈ ����� ���� �κ� --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<meta charset=EUC-KR>
<script type="text/javascript">
<%-- <%-- ************** �� �������� ����, �浵�� �߰��� �Է��ؼ��� �ȵ˴ϴ�. ************** --%>
<%-- by.�� --%>
$(function() {
	   <%
	   List<MapVO> list = (List<MapVO>) request.getAttribute("geoList");
	   System.out.println(list.size());
	   %>
	   <%--alert('testSideList.jsp���� ���\n�Ź� ���� : ' + <%=list.size()%> + '��');--%>
	});
	

<%-- by.�Ѽ� --%>
function send(input){
   var a = $(input).attr('num');
   //alert(a);
   var eye = $(input).attr('class');
   
   if(eye == "fa fa-eye"){
      $.ajax({
         type :"POST",
         url : "../main/like_add.do",
         data : {num : a},
         success : function(data) {
            //alert("���Ͷ����� ���򺯽�");
            $(input).attr('class', "fa fa-eye-slash")
         }
      });    
   }
   
   else{
      $.ajax({
         type :"POST",
         url : "../main/like_delete.do",
         data : {num : a},
         success : function(data) {
            //alert("���Ͷ����� ���� ����������");
            $(input).attr('class', "fa fa-eye")
         }
      });    
      
   }
};

</script>
<style type="text/css">
	table{
		font-size:1.52em;
		font-weight:bold;
		color: #4765AB;
	}
	#roomtype, #buildingtype{
		font-size: 1.6em;
		color: #6D6CFF;
	}
	/* #buildingtype{
		font-size: 1.6em;
	} */
</style>
</head>
<body>
	<%-- <input type="hidden" id='listNum' value='��${fn:length(geoList)}��'> --%>
	<div>
		<c:forEach var="i" items="${geoList}" varStatus="s">
			<div class="media">
				<div class="fav-box">
					
					<i class="fa fa-eye" id='like' aria-hidden="true" num='${i.num}' onclick="send(this)"></i>
				</div>
				<a href="maemool_detail.do?num=${i.num}&x=${i.x_position}&y=${i.y_position}&addr=${i.addr}">
					<img class="d-flex align-self-start maemool-list-img" src="${oneImg.get(i.num)}">
				</a>
				<div class="media-body pl-3">
					<div class="price" num='${i.num}' style="display:inline;">
							${i.deposit}
							<%-- <c:if test="${i.monthly_rent != '0 ����'" > --%>
							<c:set var="rent" value="${i.monthly_rent}"/>
							<c:if test="${rent ne '0 ����'}" >
								/
								<div style="font-size:0.6em;display: inline;">${i.monthly_rent}</div>
							</c:if> 
						<div class=address>${i.addr}</div>
					</div>
					<%-- �ǹ� ���� �� ���� ���¸� ��� --%>
					<%--c:choose�� ���̽���ó�� ��� --%>
					<div class="stats">
						<table width=100%>
							<tr>
								<td width=30%>
									<c:choose>
										<c:when test="${i.rtype eq 0}">
											<i id=roomtype class="fas fa-dice-one"></i> ������ ����
										</c:when>
										<c:when test="${i.rtype eq 1}">
											<i id=roomtype class="fas fa-dice-one"></i> �и��� ����
										</c:when>
										<c:when test="${i.rtype eq 2}">
											<i id=roomtype class="fas fa-dice-two"></i> ����
										</c:when>
										<c:when test="${i.rtype eq 3}">
											<i id=roomtype class="fas fa-dice-three"></i> ������<i class="fas fa-long-arrow-alt-up"></i>
										</c:when>
									</c:choose>
								</td>
								<td width=70%>
									<c:choose>
										<c:when test="${i.btype eq 0}">
											<i id=buildingtype class="fas fa-building"></i> �ټ���/�ٰ���
										</c:when>
										<c:when test="${i.btype eq 1}">
											<i id=buildingtype class="fas fa-briefcase"></i> ���ǽ���
										</c:when>
									</c:choose>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="row">   
    <c:if test="${curpage <= 1}">    	
    	<a href="maemool_theme_list.do?page=${curpage+1 }&keyword=${keyword}" class="btn btn-sm btn-primary">��</a>        
		&nbsp;&nbsp;1 page / ${totalpage } pages ${keyword}
	</c:if>
	 <c:if test="${curpage >= totalpage}">
	 	<a href="maemool_theme_list.do?page=${curpage-1 }&keyword=${keyword}" class="btn btn-sm btn-primary">��</a>
		&nbsp;&nbsp;${totalpage } page / ${totalpage } pages
	</c:if>
	 <c:if test="${curpage < totalpage && curpage > 1}">
	 	<a href="maemool_theme_list.do?page=${curpage-1 }&keyword=${keyword}" class="btn btn-sm btn-primary">��</a>
	 	<a href="maemool_theme_list.do?page=${curpage+1 }&keyword=${keyword}" class="btn btn-sm btn-primary">��</a>
		&nbsp;&nbsp;${curpage } page / ${totalpage } pages
	</c:if>
	</div>
</body>
</html>