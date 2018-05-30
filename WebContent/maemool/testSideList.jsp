<%@page import="com.gabang.vo.MapVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<script type="text/javascript">
$(function() {
	<%
	List<MapVO> list = (List<MapVO>) request.getAttribute("geoList");
	System.out.println(list.size());
	%>
	alert('testSideList.jsp에서 출력\n매물 개수 : ' + <%=list.size()%> + '개');
})
	function send(){
		var a = $('#num').attr('num');
			$.ajax({
				type :"POST",
				url : "../main/like_ok.do",
				data : {num : a},
				success : function(data) {
					alert("나와라제발");
				}
			}); 	
	};

</script>
</head>
<body>
	<%-- <input type="hidden" id='listNum' value='◐${fn:length(geoList)}◑'> --%>
	<c:forEach var="i" items="${geoList}" varStatus="s">
		<div class="media">
			<div class="fav-box">
				<i class="fa fa-heart-o" aria-hidden="true"></i>
				<i class="fa fa-eye" aria-hidden="true" num="${i.num} " id="num" onclick="send()"></i>
				
			</div>
			<a href="maemool_detail.do?num=${i.num}&x=${i.x_position}&y=${i.y_position}">
				<img class="d-flex align-self-start maemool-list-img" src="${oneImg.get(i.num)}">
			</a>
			<div class="media-body pl-3">
				<div class="price" num='${i.num}'>
					${i.deposit}
					<div class=address>${i.addr}</div>
				</div>
				<div class="stats">
					<input type="hidden" id='listNum' value='◐${i.x_position},${i.y_position}◑'>
					<span>
						위도<i class="fa fa-arrows-alt" id='${i.num}x'>${i.x_position}</i>
					</span>
					<span>
						경도<i class="fa fa-bath" id='${i.num}y'>${i.y_position}</i>
					</span>
				</div>
			</div>
		</div>
	</c:forEach>

</body>
</html>