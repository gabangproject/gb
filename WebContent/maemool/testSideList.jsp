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
<%-- ************** 이 문서에는 위도, 경도를 추가로 입력해서는 안됩니다. ************** --%>
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
function send(input){
   var a = $(input).attr('num');
   alert(a);
   var eye = $(input).attr('class');
   
   if(eye == "fa fa-eye"){
      $.ajax({
         type :"POST",
         url : "../main/like_add.do",
         data : {num : a},
         success : function(data) {
            alert("나와라제발 눈깔변신");
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
            alert("나와라제발 눈깔 슬래쉬삭제");
            $(input).attr('class', "fa fa-eye")
         }
      });    
      
   }
};
</script>
</head>
<body>
	<%-- <input type="hidden" id='listNum' value='◐${fn:length(geoList)}◑'> --%>
	<div>
		<c:forEach var="i" items="${geoList}" varStatus="s">
			<div class="media">
				<div class="fav-box">
					<a><span class="glyphicon glyphicon-heart-empty" onclick="jjim(this)" num=${i.num}></span></a>
					<i class="fa fa-eye" id='like' aria-hidden="true" num='${i.num}' onclick="send(this)"></i>
				</div>
				<a href="maemool_detail.do?num=${i.num}&x=${i.x_position}&y=${i.y_position}">
					<img class="d-flex align-self-start maemool-list-img" src="${oneImg.get(i.num)}">
				</a>
				<div class="media-body pl-3">
					<div class="price" num='${i.num}' style="display:inline;">
							${i.deposit}
							<%-- <c:if test="${i.monthly_rent != '0 만원'" > --%>
							<c:set var="rent" value="${i.monthly_rent}"/>
							<c:if test="${rent ne '0 만원'}" >
								/
								<div style="font-size:0.6em;display: inline;">${i.monthly_rent}</div>
							</c:if> 
						<div class=address>${i.addr}</div>
					</div>
					<div class="stats">
						
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="row">   
    <c:if test="${curpage <= 1}">    	
    	<a href="maemool_theme_list.do?page=${curpage+1 }&keyword=${keyword}" class="btn btn-sm btn-primary">▶</a>        
		&nbsp;&nbsp;1 page / ${totalpage } pages ${keyword}
	</c:if>
	 <c:if test="${curpage >= totalpage}">
	 	<a href="maemool_theme_list.do?page=${curpage-1 }&keyword=${keyword}" class="btn btn-sm btn-primary">◀</a>
		&nbsp;&nbsp;${totalpage } page / ${totalpage } pages
	</c:if>
	 <c:if test="${curpage < totalpage && curpage > 1}">
	 	<a href="maemool_theme_list.do?page=${curpage-1 }&keyword=${keyword}" class="btn btn-sm btn-primary">◀</a>
	 	<a href="maemool_theme_list.do?page=${curpage+1 }&keyword=${keyword}" class="btn btn-sm btn-primary">▶</a>
		&nbsp;&nbsp;${totalpage } page / ${totalpage } pages
	</c:if>
	</div>
</body>
</html>