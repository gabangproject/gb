<%@page import="com.gabang.vo.MapVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f&libraries=clusterer"></script>
</head>
<body>
	<div id=map style="width: 100%; height: 700px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 5 // 지도의 확대 레벨
		};
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		// 마커 클러스터러
		var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 1, // 클러스터 할 최소 지도 레벨 
	        gridSize: 120,
	        clickable:false
	    });
		
		var markers = new Array();
		var x;
		var y;
		<%
		List<MapVO> list = (List<MapVO>) request.getAttribute("geoList");
		String x, y;
		for(int i = 0; i < list.size(); i++) {
		%>	
			x = <%=list.get(i).getX_position()%>
			y = <%=list.get(i).getY_position()%>
			markers.push(new daum.maps.Marker({
			    position: new daum.maps.LatLng(x, y)
			}));
			//marker.setMap(map);
		<%
		}
		%>
		panTo(x,y);
		clusterer.addMarkers(markers);
		// 지도 이동
		function panTo(x, y) {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new daum.maps.LatLng(x, y);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		};
		alert(markers.length);
	</script>
	
</body>
</html>