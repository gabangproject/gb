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

<!-- 평점 관련 -->

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
.h
{
font-weight: bold ;
}
table,th,td
{
border-top: 1px solid #e6e6e6;
border-bottom: 1px solid #e6e6e6;
}
</style>
</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section" >
		<div class="container" >
			
			<div class="row" >
				 <div class=" text-center heading-section animate-box" > 
					<h3>매물 정보</h3>
				</div>
			</div>


	<!-- 매물 이미지 출력 -->
			<div class="row" >
				<div style="width: 70%; margin:0px auto;">
				<div id="myCarousel" class="carousel  slide" style=" height:500px;">
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
						    <img src="${image.img }" class="img-responsive"">
						    
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
			

			<div class="row">
				<div style="margin-top:20px; ">
					<div style="font-size:20px; font-weight: bold ;">상세정보</div> 
						<div >
							<table class="table table-hover"">
								<tbody>
									<tr>
										<td class="col-md-2 h">등록자 아이디</td>
										<td colspan="3">${vo.email}</td>
										
									</tr>
									<tr>
										<td class="h">보증금 </td>
										<td>${vo.deposit }</td>
										<td  class="h">월세</td>
										<td>${vo.monthly_rent }</td>
										

									</tr>
									<tr>
										<td class="h">관리비 </td>
										<td>${vo.manage_fee}</td>
										<td class="h col-md-2 ">관리비 항목</td>
										<td>${vo.maintenance}</td>
										
									</tr>
									<tr>
										<td class="h">층/건물층수</td>
										<td>${vo.floor}</td>
										<td class="h">엘리베이터</td>
										<td>
											<c:if test="${vo.elev==1 }">
											가능
											</c:if>
											<c:if test="${vo.elev==0 }">
											불가능
											</c:if>
										</td>
									</tr>
									<tr>
										<td class="h">주차</td>
										<td>
											<c:if test="${vo.parking_lot==1}">
											가능
											</c:if>
											<c:if test="${vo.parking_lot==0}">
											불가능
											</c:if>
										</td>
										<td class="h">매물 설명</td>
										<td>${vo.detail_title}</td>
									</tr>
									<tr>
										<td class="h">크기</td>
										<td>${vo.gross_area}</td>
										<td class="h">옵션</td>
										<td>${vo.opt}</td>
									</tr>
									<tr>
										<td class="h">입주 가능일</td>
										<td>${vo.moving_date}</td>
										<td class="h">인근지하철</td>
										<td>${vo.near_subway}</td>
									</tr>
									<tr>
										<td class="h">상세설명</td>
										<td colspan="3">${vo.description}</td>
									</tr>
									<tr>
										<td class="h" rowspan="5" style="vertical-align:middle;">중개사 정보</td>
										<td rowspan="5"><img src="${seller.pic }" width="200px" height="200px"></td>
										<td class="h" >전화번호</td>
										<td>${seller.comp_tel }</td>
									</tr>
									
									<tr>
										<td class="h" >중개사명</td>
										<td>${seller.comp_name }</td>
									</tr>
									<tr>
										<td class="h" >주소</td>
										<td>${seller.addr }</td>
									</tr>
									<tr>
										<td class="h" >중개사 소개</td>
										<td>${seller.intro}</td>
									</tr>
									<tr>
										<td class="h" >중개사 평점</td>
										<td>
											${seller.intro }
										</td>
									</tr>
								</tbody>
							</table>
							
						
						</div>
				</div>
			</div>
			
			<div class="row" style="margin-bottom:30px;">
					
				<!-- 지도 출력 -->
				
					<div class="text-center" style="font-size:20px; font-weight: bold ; margin-bottom:10px">매물 위치</div>
					<input type="hidden" id="x_position" value="${x }">
					<input type="hidden" id="y_position" value="${y }">
					<!-- 해당 매물 위치 -->
					 
					<div id="map" style="width:50%; margin:0px auto"></div>
				

			</div>
			
			
				
				
				
			</div>
			<!-- container 끝 -->
	</div> 
			
			

		
		

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>		

<!-- 다음 지도 관련 script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f"></script>
<script>

		var x_position=$('#x_position').val();
		var y_position=$('#y_position').val();
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(x_position, y_position), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
				
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var markerPosition  = new daum.maps.LatLng(x_position, y_position); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		//평점 스크립트

</script>

</body>
</html>