<%@page import="com.gabang.vo.MapVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<%-- awesomefont�� ����ϱ� ���� ��ũ --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ���� ���� api�� ����ϱ� ���� �κ� -->
<!-- �ش� Ű�� ���� Ű -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f&libraries=clusterer,services"></script>
<script type="text/javascript">
<%-- by.�� --%>
$(function() {
	var keyword = '<%=request.getParameter("keyword")%>';
	var curpage = <%=request.getAttribute("curpage")%>
	curpage = Number(curpage)
	var bound;
	var latlngTotal;
	var latlngList;
	var mMarkers = new Array();
	
	<%-- �ε� ȭ��ǥ�� Ȯ��Ǵ� �ִϸ��̼� --%>
	$('.fa-spin').animate({"font-size":"15em"});
	<%-- 
	�������� �ε��Ǹ� ajax�� ȭ�� ���� �Ź������ �ҷ��´�.
	�̶� keyword�� ���� �����Ͽ� �Ź���Ͽ��� �˸��� �Ź��� ����ϰԲ� �Ѵ�.
	--%>
	$.ajax({
		type:'post',
		url:'testSideList.do',
		data:{'keyword': keyword, 'page':curpage},
		success:function(res) {
			$('#list').css({'text-align':''});
			$('#list').html(res);			
		}
	});
	
	<%-- �� �巡�װ� ���� �� ���� --%>
	daum.maps.event.addListener(map, 'dragend', function() {
		$('#list').html("<div id='loadingBox' style='text-align:center; text-valign:center; width: 100%; height:220px;'><i class='fas fa-sync fa-spin' style='font-size:2em;color:#65D2FB'></i></div>");
		$('#list').css({'text-align':'center'});
		<%-- �ε� ȭ��ǥ�� Ŀ���� ȿ�� --%>
		$('.fa-spin').animate({"font-size":"15em"});

		<%-- 2�� �� �ε� ȭ��ǥ �Ʒ� ���� �߰� --%>
		setTimeout(function() {
			$("#list").append("<h1 id=msg color=#2574AF;>�� �� ��ٷ���!<h1>");
		},2000);
		
		<%-- 5�� �� ���� ���� --%>
		setTimeout(function() {
			$("#msg").text("���� �� �ƾ��!");
			$("#msg").attr("color","red");
		},5000);
		
		<%-- 9�� �� ���� ���� --%>
		setTimeout(function() {
			$("#msg").text("�̾��ؿ�! ������ ã���־��!");
			//$("#msg").attr("color","red");
		},9000);
		
		<%-- ������ �� ������ ���Ѵ�. --%>
		bound = map.getBounds();
		
		<%-- ���� �ϵ��� �� ������ �浵 --%>
		<%-- ajax�� �����Ҷ��� ���ڿ��� ���� --%>
		var ne = bound.getNorthEast();
		var ne_x = ne.getLat();
		var ne_y = ne.getLng();
		
		<%-- ���� ������ �� ������ �浵 --%>
		var sw = bound.getSouthWest();
		var sw_x = sw.getLat();
		var sw_y = sw.getLng();
		
		<%-- ���� ���������� �������� Ȯ�� --%>
		<%-- alert(ne_x + "  " + ne_y + "\n" + sw_x + "   " + sw_y); --%>
		
		<%-- ajax�� sideList�� ���� �����ϰ� ����� �޴´�. --%>
		$.ajax({
			type:'post',
			url:'testSideList.do',
			data:{'ne_x':ne_x, 'ne_y':ne_y, 'sw_x':sw_x, 'sw_y':sw_y},
			success:function (res) {
				$('#list').css({'text-align':''});
				$('#list').html(res);
				<%-- ���Խ��� �̿��ؼ� ������� ���浵�� �޴´�. --%>
				<%-- split �Լ��� ����ϱ����ؼ� object Ÿ���� String Ÿ������ ��ȯ --%>
				latlngTotal = String(res.match(/[13]\d{1,2}\.\d{8,}/g));
				
				<%-- 
				// Ÿ�� Ȯ��
				alert(typeof(latlngTotal));
				--%>
				
				<%-- ������ ,�� �и� --%>
				latlngList = latlngTotal.split(',');
				
				<%-- �ֿܼ� ��� --%>
				console.log("latlngList ���� : " + latlngList.length);
				for(var i = 0; i < latlngList.length; i++) {
					console.log(latlngList[i]);
					var mx;
					var my;
					
					<%-- ¦���� �浵 --%>
					if(((i + 1) % 2) == 0) {
						my = latlngList[i];
						console.log("my : " + my);
					} else {
						<%-- Ȧ���� ���� --%>
						mx = latlngList[i];
						console.log("mx : " + mx)
					}
					
					<%-- mx, my�� ��Ŀ�� ���� --%>
					var mLatlng = new daum.maps.LatLng(mx, my);
					var mMarker = new daum.maps.Marker({
						position: mLatlng
					});
					
					<%-- �迭�� �߰� --%>
					mMarkers.push(mMarker);
				}
				<%-- ���� Ŭ�������� ��Ŀ ���� --%>
				clusterer.clear();
				<%-- console.log('Ŭ������ ��Ŀ ����'); --%>
				
				<%-- ���ο� ��Ŀ �߰��Ͽ� ǥ�� --%>
				clusterer.addMarkers(mMarkers);
				console.log('Ŭ������ ��Ŀ �߰�');
				
			}
		});
	});
});
</script>
<style>
@import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css");
@import url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700');

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
						<div id=map style="width: 50%; height: 250px%; display: inline-block" class="col-md-7"></div>
						<script>
							<%-- by.�� --%>
							var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
							mapOption = {
								center : new daum.maps.LatLng(37.563228970425506, 126.97727242618686), // ������ �߽���ǥ
								level : 5
							};

							// ������ ǥ���� div�� ���� �ɼ����� ������ �����մϴ�
							var map = new daum.maps.Map(mapContainer, mapOption);

							// ��Ŀ Ŭ�����ͷ�
							var clusterer = new daum.maps.MarkerClusterer({
								map : map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
								averageCenter : true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
								gridSize : 100,
								clickable : false
							});

							var markers = new Array();
							var x;
							var y;
							
						<%
							List<MapVO> list = (List<MapVO>) request.getAttribute("geoList");
							System.out.println(list.size());
							String x, y;
							for (int i = 0; i < list.size(); i++) {
						%>
								x = <%=list.get(i).getX_position()%>
								y = <%=list.get(i).getY_position()%>
								
								markers.push(new daum.maps.Marker({
									position : new daum.maps.LatLng(x, y)
								}))
						<%
							}
						%>
							panTo(x, y); // ���� ������ �Ź��� ��ġ�� �̵�
							clusterer.addMarkers(markers);

							// ���� �̵� �Լ�
							function panTo(x, y) {
								// �̵��� ���� �浵 ��ġ�� �����մϴ� 
								var moveLatLon = new daum.maps.LatLng(x, y);

								// ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
								// ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
								map.panTo(moveLatLon);
							};
							<%--var markerNum = markers.length;
							
							alert('markerNum�� ' + mNum);--%>
						</script>
						<!-- �Ź����� ����Ʈ ��� �κ� -->
						<div class="col-md-5 listing-block" id=list style="text-align:center;width: 50%; display: inline-block">
							<div id='loadingBox' style="text-align:center; text-valign:center; width: 100%; height:220px;">
								<i class="fas fa-sync fa-spin" style="font-size:2em;color:#65D2FB"></i>
							</div>
							<h1 id=info style="color:#2574AF;">�Ź��� ������ �־��!</h1>
						</div>
					</div>
				</div>
			</section>
			<%--<div style="width: 300px; height: 30px; background-color:yellow;" align="center">
				<h3 id=info>${fn:length(geoList)} �� �Ź�</h3>
			</div> --%>
		</div>
	</div>
</body>
</html>

