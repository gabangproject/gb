<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f"></script>
</head>
<body>
	<div id=map style="width:100%;height:350px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
			level : 3
		// ������ Ȯ�� ����
		};

		// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
		var map = new daum.maps.Map(mapContainer, mapOption);
	</script>
</body>
</html>