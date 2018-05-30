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
					<li data-target="#myCarousel" data-slide-to="${n.index }" ></li>
				   
				  </c:forEach>
				    
				  </ol>
				  <!-- Items -->
				  <div class="carousel-inner">
					  <c:forEach var="img" items="${imgList }" varStatus="n">
					  	<div class="active item">  
					    <img src="//placehold.it/1300x500" class="img-responsive">
					    </div>
					  
					    <div class="item">  
					    <img src="//placehold.it/1300x500" class="img-responsive">
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




			<div class="row" style="width:60%">

		
				<!-- 상세정보 출력 테이블 -->
				<!--  	
					private int num;				//매물번호
					private String email; 		    //매물 등록자
					private String deposit; 		//보증금
					private String monthly_rent;	//월세	
					private String floor;			//층/건물층수
					private String manage_fee;		//관리비
					private String maintenance;		//관리비 포함항목
					private int	elev;				//엘리베이터
					private int	parking_lot;		//주차
					private String gross_area;		//크기
					private String opt;				//옵션
					private String moving_date;		//입주 가능일
					private String description;		//상세설명
					private String near_subway;		//인근 전철역
					private Date regdate; 			//매물 등록일
					private int	avg_score;			//평균 점수	
					private String detail_title;    //매물 간단 설명
				-->
				<h4>상세정보</h4>
				<table class="table table-hover">
				<!-- 	<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead> -->
					<tbody>
						<tr>
							<td><label class="col-sm-5">보증금</label>${vo.deposit }</td>
							<td>${vo.monthly_rent }</td> 
						</tr>
						<tr>
							<td>${vo.manage_fee}</td>
							<td>${vo.maintenance}</td>
						</tr>
						<tr>
							<td>${vo.floor}</td>
							<td>${vo.elev}</td>
						</tr>
						<tr>
							<td>${vo.parking_lot}</td>
							<td>${vo.detail_title}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="col-md-6">
							<h3 class="section-title">Our Address</h3>
							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
							<ul class="contact-info">
								<li><i class="icon-location-pin"></i>198 West 21th Street, Suite 721 New York NY 10016</li>
								<li><i class="icon-phone2"></i>+ 1235 2355 98</li>
								<li><i class="icon-mail"></i><a href="#">info@yoursite.com</a></li>
								<li><i class="icon-globe2"></i><a href="#">www.yoursite.com</a></li>
							</ul>
						</div>
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Name">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Email">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<textarea name="" class="form-control" id="" cols="30" rows="7" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="submit" value="Send Message" class="btn btn-primary">
									</div>
								</div>
							</div>
						</div>		
				
				
			
			</div> 
			<!-- row 끝 -->
		</div>
		<!-- container 끝  -->

	</div>
<!-- work-section 끝 -->
		
		

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>		


</body>
</html>