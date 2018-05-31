<%@page import="com.gabang.vo.MapVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<%-- awesomefont를 사용하기 위한 링크 --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 다음 지도 api를 사용하기 위한 부분 -->
<!-- 해당 키는 권한 키 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f&libraries=clusterer,services"></script>
<script type="text/javascript">
<%-- by.한 --%>
$(function() {
	var keyword = '<%=request.getParameter("keyword")%>';
	var curpage = <%=request.getAttribute("curpage")%>
	curpage = Number(curpage)
	var bound;
	var latlngTotal;
	var latlngList;
	var mMarkers = new Array();
	
	<%-- 로딩 화살표가 확대되는 애니메이션 --%>
	$('.fa-spin').animate({"font-size":"15em"});
	<%-- 
	페이지가 로딩되면 ajax로 화면 우측 매물목록을 불러온다.
	이때 keyword를 같이 전송하여 매물목록에서 알맞은 매물을 출력하게끔 한다.
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
	
	<%-- 맵 드래그가 끝난 후 실행 --%>
	daum.maps.event.addListener(map, 'dragend', function() {
		$('#list').html("<div id='loadingBox' style='text-align:center; text-valign:center; width: 100%; height:220px;'><i class='fas fa-sync fa-spin' style='font-size:2em;color:#65D2FB'></i></div>");
		$('#list').css({'text-align':'center'});
		<%-- 로딩 화살표가 커지는 효과 --%>
		$('.fa-spin').animate({"font-size":"15em"});

		<%-- 2초 후 로딩 화살표 아래 글자 추가 --%>
		setTimeout(function() {
			$("#list").append("<h1 id=msg color=#2574AF;>좀 더 기다려요!<h1>");
		},2000);
		
		<%-- 5초 후 글자 변경 --%>
		setTimeout(function() {
			$("#msg").text("거의 다 됐어요!");
			$("#msg").attr("color","red");
		},5000);
		
		<%-- 9초 후 글자 변경 --%>
		setTimeout(function() {
			$("#msg").text("미안해요! 열심히 찾고있어요!");
			//$("#msg").attr("color","red");
		},9000);
		
		<%-- 지도의 각 끝점을 구한다. --%>
		bound = map.getBounds();
		
		<%-- 지도 북동쪽 끝 위도와 경도 --%>
		<%-- ajax로 전달할때는 문자열만 가능 --%>
		var ne = bound.getNorthEast();
		var ne_x = ne.getLat();
		var ne_y = ne.getLng();
		
		<%-- 지도 남서쪽 끝 위도와 경도 --%>
		var sw = bound.getSouthWest();
		var sw_x = sw.getLat();
		var sw_y = sw.getLng();
		
		<%-- 값이 정상적으로 들어오는지 확인 --%>
		<%-- alert(ne_x + "  " + ne_y + "\n" + sw_x + "   " + sw_y); --%>
		
		<%-- ajax로 sideList에 값을 전달하고 결과를 받는다. --%>
		$.ajax({
			type:'post',
			url:'testSideList.do',
			data:{'ne_x':ne_x, 'ne_y':ne_y, 'sw_x':sw_x, 'sw_y':sw_y},
			success:function (res) {
				$('#list').css({'text-align':''});
				$('#list').html(res);
				<%-- 정규식을 이용해서 결과값의 위경도만 받는다. --%>
				<%-- split 함수를 사용하기위해서 object 타입을 String 타입으로 전환 --%>
				latlngTotal = String(res.match(/[13]\d{1,2}\.\d{8,}/g));
				
				<%-- 
				// 타입 확인
				alert(typeof(latlngTotal));
				--%>
				
				<%-- 구분자 ,로 분리 --%>
				latlngList = latlngTotal.split(',');
				
				<%-- 콘솔에 출력 --%>
				console.log("latlngList 길이 : " + latlngList.length);
				for(var i = 0; i < latlngList.length; i++) {
					console.log(latlngList[i]);
					var mx;
					var my;
					
					<%-- 짝수면 경도 --%>
					if(((i + 1) % 2) == 0) {
						my = latlngList[i];
						console.log("my : " + my);
					} else {
						<%-- 홀수면 위도 --%>
						mx = latlngList[i];
						console.log("mx : " + mx)
					}
					
					<%-- mx, my를 마커에 설정 --%>
					var mLatlng = new daum.maps.LatLng(mx, my);
					var mMarker = new daum.maps.Marker({
						position: mLatlng
					});
					
					<%-- 배열에 추가 --%>
					mMarkers.push(mMarker);
				}
				<%-- 기존 클러스터의 마커 삭제 --%>
				clusterer.clear();
				<%-- console.log('클러스터 마커 삭제'); --%>
				
				<%-- 새로운 마커 추가하여 표시 --%>
				clusterer.addMarkers(mMarkers);
				console.log('클러스터 마커 추가');
				
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
					<h3>매물 목록</h3>
				</div>
			</div>
		</div>

		<div>
			<section class="search-box">
				<div class="container-fluid">
					<div class="row">
						<!-- 지도 -->
						<div id=map style="width: 50%; height: 250px%; display: inline-block" class="col-md-7"></div>
						<script>
							<%-- by.한 --%>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new daum.maps.LatLng(37.563228970425506, 126.97727242618686), // 지도의 중심좌표
								level : 5
							};

							// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
							var map = new daum.maps.Map(mapContainer, mapOption);

							// 마커 클러스터러
							var clusterer = new daum.maps.MarkerClusterer({
								map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
								averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
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
							panTo(x, y); // 가장 마지막 매물의 위치로 이동
							clusterer.addMarkers(markers);

							// 지도 이동 함수
							function panTo(x, y) {
								// 이동할 위도 경도 위치를 생성합니다 
								var moveLatLon = new daum.maps.LatLng(x, y);

								// 지도 중심을 부드럽게 이동시킵니다
								// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
								map.panTo(moveLatLon);
							};
							<%--var markerNum = markers.length;
							
							alert('markerNum은 ' + mNum);--%>
						</script>
						<!-- 매물들의 리스트 출력 부분 -->
						<div class="col-md-5 listing-block" id=list style="text-align:center;width: 50%; display: inline-block">
							<div id='loadingBox' style="text-align:center; text-valign:center; width: 100%; height:220px;">
								<i class="fas fa-sync fa-spin" style="font-size:2em;color:#65D2FB"></i>
							</div>
							<h1 id=info style="color:#2574AF;">매물을 골라오고 있어요!</h1>
						</div>
					</div>
				</div>
			</section>
			<%--<div style="width: 300px; height: 30px; background-color:yellow;" align="center">
				<h3 id=info>${fn:length(geoList)} 개 매물</h3>
			</div> --%>
		</div>
	</div>
</body>
</html>

