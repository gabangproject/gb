<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.carousel {
   
    overflow: hidden;
}
.carousel .item {
    -webkit-transition: opacity 1s;
    -moz-transition: opacity 1s;
    -ms-transition: opacity 1s;
    -o-transition: opacity 1s;
    transition: opacity 1s;
}
.carousel .active.left, .carousel .active.right {
    left:0;
    opacity:0;
    z-index:2;
}
.carousel .next, .carousel .prev {
    left:0;
    opacity:1;
    z-index:1;
}
.item:nth-child(1) {
  background: darkred;
}

.item:nth-child(2) {
  background: red;
}

.item:nth-child(3) {
  background: orange;
}
</Style>
</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-contact" class="animate-box">
		<div class="container" >
			
			<div class="row" >
				 <div class=" text-center heading-section animate-box" > 
					<h3>매물 정보</h3>
				</div>
			</div>


			<div class="row">
				<div id="myCarousel" class="carousel  slide">
				  <!-- Dot Indicators -->
				  <ol class="carousel-indicators">
				  <c:forEach var="img" items="${imgList }" varStatus="n">
				  	<c:if test="${n.index==0 }">
				    	<li data-target="#myCarousel" data-slide-to="${n.index }" class="active"></li>
				    </c:if>
				    <c:if test="${n.index!=0 }">
					<li data-target="#myCarousel" data-slide-to="${n.index }" ></li>
				   	</c:if>
				  </c:forEach>
				    
				  </ol>
				  <!-- Items -->
				  <div class="carousel-inner">
					  <c:forEach var="image" items="${imgList }" varStatus="n">
					  	<c:if test="${n.index==0 }">
						  	<div class="active item"> 
						</c:if>
						<c:if test="${n.index!=0 }">
							<div class="item">
						</c:if> 
						    <img src="${image.img }" class="img-responsive">
						    </div>
					  	

					  </c:forEach>
				  </div>
				  <!-- Navigation -->
				   <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				            <span class="glyphicon glyphicon-chevron-left"></span>
				        </a>
				        <a class="right carousel-control" href="#myCarousel" data-slide="next">
				            <span class="glyphicon glyphicon-chevron-right"></span>
				        </a>
				</div>
			</div>

				<div class="col-md-6" style="font-size:20px;">상세정보</div> <div class="col-md-6" style="font-size:20px;">지도위치</div>
				<div style="float: left; width:50%;">
				<table class="table table-hover">
					<tbody>
						<tr>
							<td><label class="col-sm-5">등록자<br>아이디</label>${vo.email}</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="col-sm-5">보증금</label>${vo.deposit }</td>
							<td><label class="col-sm-5">월세</label>${vo.monthly_rent }</td> 
						</tr>
						<tr>
							<td><label class="col-sm-5">관리비</label>${vo.manage_fee}</td>
							<td><label class="col-sm-5">관리비<br>포함항목</label>${vo.maintenance}</td>
						</tr>
						<tr>
							<td><label class="col-sm-5">층/<br>건물층수</label>${vo.floor}</td>
							<td><label class="col-sm-5">엘리베이터</label>
							<c:if test="${vo.elev==1 }">
							가능
							</c:if>
							<c:if test="${vo.elev==0 }">
							불가능
							</c:if>
							</td>
						</tr>
						<tr>
							<td><label class="col-sm-5">주차</label>
							<c:if test="${vo.parking_lot==1}">
							가능
							</c:if>
							<c:if test="${vo.parking_lot==0}">
							불가능
							</c:if>
							</td>
							<td><label class="col-sm-5">매물 설명</label>${vo.detail_title}</td>
						</tr>
						<tr>
							<td><label class="col-sm-5">크기</label>${vo.gross_area}</td>
							<td><label class="col-sm-5">옵션</label>${vo.opt}</td>
						</tr>
						<tr>
							<td><label class="col-sm-5">입주<br>가능일</label>${vo.moving_date}</td>
							<td><label class="col-sm-5">인근<br>지하철</label>${vo.near_subway}</td>
						</tr>
					</tbody>
							<tr>
							</tr>
				</table>
				<label>상세설명</label>씨부레
				<br>${vo.description}
				</div>
			
			<!-- 해당 매물 지도위치 -->
			 
			<div style="float: right; width:45%;" id="map"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				
				var map = new daum.maps.Map(mapContainer, mapOption); 
				</script> 
			</div> 
			


		
		

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
			</script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>		


</body>
</html>