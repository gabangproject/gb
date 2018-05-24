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
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
			level : 5 // ������ Ȯ�� ����
		};
		
		// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		// ��Ŀ Ŭ�����ͷ�
		var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
	        averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
	        minLevel: 1, // Ŭ������ �� �ּ� ���� ���� 
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
		// ���� �̵�
		function panTo(x, y) {
		    // �̵��� ���� �浵 ��ġ�� �����մϴ� 
		    var moveLatLon = new daum.maps.LatLng(x, y);
		    
		    // ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
		    // ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
		    map.panTo(moveLatLon);            
		};
		alert(markers.length);
	</script>
	
</body>
</html>