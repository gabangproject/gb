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
<%-- by.한 --%>
$(function() {
	<%
	List<MapVO> list = (List<MapVO>) request.getAttribute("geoList");
	System.out.println(list.size());
	%>
	alert('testSideList.jsp에서 출력\n매물 개수 : ' + <%=list.size()%> + '개');
})

<%-- by.준영 --%>
function jjim(input) {
	var num = $(input).attr("num");
	alert(num);
	var heart = $(input).attr('class');

	if (heart == "glyphicon glyphicon-heart") {
		$.ajax({
			type : 'post',
			data : {
				maemool_num : num
			},
			url : "../main/remove_jjim.do",
			success : function(data) {
				$(input).attr('class', "glyphicon glyphicon-heart-empty");
			}
		});
	}

	else {
		$.ajax({
			type : 'post',
			data : {maemool_num : num},
			url : "../main/add_jjim.do",
			success : function(data) {
				$(input).attr('class', "glyphicon glyphicon-heart");
			}
		});
	}
}
<%-- by.한솔 --%>
function send(){
	var a = $('#num').attr('num');
		$.ajax({
			type :"POST",
			url : "like_ok.do",
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
				<a><span class="glyphicon glyphicon-heart-empty" onclick="jjim(this)" num=${i.num }></span></a>
				<i class="fa fa-eye" id='like' aria-hidden="true" num='${i.num}'></i>
			</div>
			<a href="maemool_detail.do?num=${i.num}&x=${i.x_position}&y=${i.y_position}">
				<img class="d-flex align-self-start maemool-list-img" src="${oneImg.get(i.num)}">
			</a>
			<div class="media-body pl-3">
				<div class="price" num='${i.num}'>
					<a href="maemool_detail.do?num=${i.num}&x=${i.x_position}&y=${i.y_position}">
						${i.deposit}
					</a>
					<div class=address>${i.addr}</div>
				</div>
				<div class="stats">
					<%--<input type="hidden" id='listNum' value='◐${i.x_position},${i.y_position}◑'> --%>
					<span>위도<i class="fa fa-arrows-alt" id='${i.num}x'>${i.x_position}</i></span>
					<span>경도<i class="fa fa-bath" id='${i.num}y'>${i.y_position}</i></span>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>