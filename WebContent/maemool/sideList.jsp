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
<%-- by.�� --%>
$(function() {
   <%
   List<MapVO> list = (List<MapVO>) request.getAttribute("geoList");
   System.out.println(list.size());
   %>
   alert('sideList.jsp���� ���\n�Ź� ���� : ' + <%=list.size()%> + '��');
})
<%-- by.�ؿ� --%>
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
<%-- by.�Ѽ� --%>
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
            alert("���Ͷ����� ���򺯽�");
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
            alert("���Ͷ����� ���� ����������");
            $(input).attr('class', "fa fa-eye")
         }
      });    
      
   }
};
</script>
</head>
<body>
   <%-- <input type="hidden" id='listNum' value='��${fn:length(geoList)}��'> --%>
   <c:forEach var="i" items="${geoList}" varStatus="s">
      <div class="media">
         <div class="fav-box">
            <a><span class="glyphicon glyphicon-heart-empty" onclick="jjim(this)" num=${i.num }></span></a>
            <i class="fa fa-eye" id='like' aria-hidden="true" num='${i.num}' onclick="send(this)"></i>
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
               <%--<input type="hidden" id='listNum' value='��${i.x_position},${i.y_position}��'>
               <span>����<i class="fa fa-arrows-alt" id='${i.num}x'>${i.x_position}</i></span>
               <span>�浵<i class="fa fa-bath" id='${i.num}y'>${i.y_position}</i></span>--%>
            </div>
         </div>
      </div>
   </c:forEach>
</body>
</html>