<%@page import="com.gabang.vo.MapVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ���� ���� api�� ����ϱ� ���� �κ� -->
<!-- �ش� Ű�� ���� Ű -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f&libraries=clusterer"></script>

<style>
@import
	url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css")
	;

@import
	url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700')
	;
h2 {
	float: left;
	width: 100%;
	color: #fff;
	margin-bottom: 40px;
	font-size: 14px;
	position: relartive;
	z-index: 3;
	margin-top: 30px
}

h2 span {
	font-family: 'Libre Baskerville', serif;
	display: block;
	font-size: 45px;
	text-transform: none;
	margin-bottom: 20px;
	margin-top: 30px;
	font-weight: 700
}

h2 a {
	color: #fff;
	font-weight: bold;
}

.head {
	float: left;
	width: 100%;
}

.search-box {
	width: 95%;
	margin: 0 auto 40px;
	border: 1px solid black;
}

.listing-block {
	background: #fff;
	height: 500px;
	padding-top: 20px;
	overflow-y: scroll;
}

.media {
	background: #fff;
	position: relative;
	margin-bottom: 15px;
}

.media img {
	width: 200px;
	margin: 0;
	height: 136px;
}

.media-body {
	border: 1px solid #bcbcbc;
	border-left: 0;
	height: 136px;
}

.media .price {
	float: left;
	width: 100%;
	font-size: 30px;
	font-weight: 600;
	color: #4765AB;
}

.media .price small {
	display: block;
	font-size: 17px;
	color: #232323;
}

.media .stats {
	float: left;
	width: 100%;
	margin-top: 10px;
}

.media .stats span {
	float: left;
	margin-right: 10px;
	font-size: 15px;
}

.media .stats span i {
	margin-right: 7px;
	color: #4765AB;
}

.media .address {
	float: left;
	width: 100%;
	font-size: 14px;
	margin-top: 5px;
	color: #888;
}

.media .fav-box {
	position: absolute;
	right: 10px;
	font-size: 20px;
	top: 4px;
	color: #E74C3C;
}

.map-box {
	background-color: #A3CCFF;
}
</style>
</head>
<body>
	<div id="fh5co-work-section" style="padding: 98px">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>�Ź� ���</h3>
				</div>
			</div>
		</div>

		<div>
			<section class="search-box">
				<div class="container-fluid">
					<div class="row">
						<!-- ���� -->
						<div id=map style="width:50%;height:250px%;display:inline-block" class="col-md-7" ></div>
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
						        minLevel: 2, // Ŭ������ �� �ּ� ���� ���� 
						        gridSize: 150,
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
							panTo(x,y); // ���� ������ �Ź��� ��ġ�� �̵�
							clusterer.addMarkers(markers);
							
							// ���� �̵� �Լ�
							function panTo(x, y) {
							    // �̵��� ���� �浵 ��ġ�� �����մϴ� 
							    var moveLatLon = new daum.maps.LatLng(x, y);
							    
							    // ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
							    // ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
							    map.panTo(moveLatLon);
							};
							alert(markers.length + '�� �Ź�');
						</script>
						 
						<!-- �Ź����� ����Ʈ ��� �κ� -->
						<div class="col-md-5 listing-block" style="width:50%;display:inline-block">
	
							<c:forEach var="i" items="${geoList}">
								<div class="media">
									<div class="fav-box">
										<i class="fa fa-heart-o" aria-hidden="true"></i>
									</div>
									<a href="#?num=${i.num}">	
										<img class="d-flex align-self-start maemool-list-img"
										src="${oneImg.get(i.num)}" alt=�̹���>
									</a>
									<div class="media-body pl-3">
										<div class="price" num='${i.num}'>
											${i.deposit}
											<div class=address>${i.addr}</div>
										</div>
										<div class="stats">
											<span>
												����<i class="fa fa-arrows-alt" id='${i.num}x'>${i.x_position}</i>
											</span>
											<span>
												�浵<i class="fa fa-bath" id='${i.num}y'>${i.y_position}</i>
											</span>
										</div>
										<!-- <div class="address">4062 Walnut Hill Drive Cincinnati</div> -->
									</div>
								</div>
							</c:forEach>
							<!-- ���� ũ�� ��ȯ�� ���� �ش� ���� �ȿ� ���ԵǾ� �ִ� �Ź����� ����Ʈ ��� �κ� -->

						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>

