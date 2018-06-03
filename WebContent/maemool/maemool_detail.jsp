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

<script>
<%-- by.준영 --%>


$("document").ready(function() {  
	  
	 var currentPosition = parseInt($("#sidebox").css("top"));  
	 
	 	//scorll했을 때 
	    $(window).scroll(function() {  
	            
	    	
	    	var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.  
	    	var offset=$('#map-info').offset();
	    	var tablePosition=offset.top;
	    	
	    	if(position>tablePosition-750)
	    		{
	    		$("#sidebox").css({
	    							property:'fixed'
	    		});
	    		//alert(position);
	    		//$("#sidebox").stop().animate({"top":"500px"},200);
	    		}
	    	else{ 
	    		
	    		$("#sidebox").stop().animate({"top":position+currentPosition+"px"},200);
	    		};	
	    	
			//1150.3999938964844   	        
	    	/* 
	    	alert(offset.bottom); */
	            
	    });  


      
}); 

function sellerInfo(input)
{
	
	};


function jjim(input) {
   var num = <%=request.getParameter("num")%>   
   alert(num);
    var heart = $(input).css('opacity');
   if (heart == "0.2") {
	   $.ajax({
	         type : 'post',
	         data : {maemool_num : num},
	         url : "../main/add_jjim.do",
	         success : function(data) {
	            $(input).css('opacity', "1.0");
	         }
	      });
     
   }
   else {
	   $.ajax({
	         type : 'post',
	         data : {
	            maemool_num : num
	         },
	         url : "../main/remove_jjim.do",
	         success : function(data) {
	        	 $(input).css('opacity', "0.2");
	         }
	      });
   } 
}

</script>

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

/*--매물 사이드 박스(중개사정보)  */

#sidebox 
{ 	

position: absolute; 
float: right;  
top:240px; 
right:36%;

}
#infobox
{
border: 1px solid lightgray;
width:300px;
height:500px;
}

#img-fluid
{

   width: 100px; height: 100px;
    border-radius: 50%;

}

/*버튼 스타일  */


</style>
</head>
<body>

   <!-- end:header-top -->
   <div id="fh5co-work-section" >
      <div class="container" style="margin-right:20%;margin-left:20%">

         <div class="row">
            <div class="col-md-8 col-md-offset-1 text-center heading-section animate-box">
               <h3>매물정보</h3>
            </div>
         </div>



         <!-- 매물 이미지 출력 -->
         <div class="row">
            <div style="width: 640px; height:470px; background-color:black;">
	              <div id="myCarousel" class="carousel slide" style="height:98%; width:100%; padding-top:3%; padding-bottom:3%">
	              
	              <!-- 이미지 갯수와 현재 보고있는 이미지 점으로 표시 -->
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
	              <!-- 이미지 갯수와 현재 보고있는 이미지 점으로 표시 -->
	              
	              <!-- 이미지 위치 -->
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
	                 
	              <!-- 이미지 위치 -->
	                 
	              	 </div>
	              
	              
	              
              <!-- 보고싶은 이미지로 이동하는 화살표 -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
              <!-- 보고싶은 이미지로 이동하는 화살표 --> 
              	</div>
            </div>
         </div>
         
         
         
         
         <!-- 중개사 정보 -->
        
        	<!-- 사이드 박스 -->
				<div id="sidebox" >
					<div id="right_section"	style="position:absolute;top:0px;left:0px;">
						<!-- 사이드 박스 내용 -->
						<div id="infobox">
							
								<div class="card">
									<div class="card-body" style="height:250px;">
									<!-- 매물 간단 정보 -->
										<div style="padding:15px">
											<div height:100px;>
											<font size="4"><strong>${room_type }</strong>&emsp; <font color="#354435">${vo.deposit}/${vo.monthly_rent}</font></font><br>
											
											<p style="margin-top:10px;">
											<font size="3" color="black">
											
												${vo.detail_title }
											
											</font>
											</p>
											
											<p >
											<font size="3" >
											
												${addr }
											
											</font>
											</p>
											</div>
												<hr style="margin:15px;">
												
											<!-- 찜 버튼 -->
										
											<div style="height:100px;">
												<c:choose>
													<c:when test="${jjim.num!=num }">
														<c:set var="jjimState" value="0.2"/>
													</c:when>
													<c:otherwise>
														<c:set var="jjimState" value="1"/>
													</c:otherwise>
												
												</c:choose>
												
												<button type="button" class="btn btn-danger" style="opacity:${jjimState}; width:100%;" onclick="jjim(this);">
													<span class="glyphicon glyphicon-heart">찜하기</span>
												</button>
											</div>
											
										</div>
										
								
									</div>
									<hr style="margin:0px;">
									<!-- 중개사 정보 -->
									<div class="card-body" style="background-color:#f7f7f7;height:247px;">
										<div style="padding:15px;">
											<div style="height:170px;">
												<%-- <p>
													<img id="img-fluid" src="${seller.pic }" width="200px" height="200px">
												</p> --%>
												<font size="3" ><strong>${seller.comp_name }</strong></font><br><br>
												<font size="2" >${seller.addr }</font><br>
												<font size="2" >중개 등록 번호 ${seller.license }</font><br>
												<font size="2" >중개사 평점: ${seller.eval_score }</font><br>
												<font size="2" >중개사 소개: ${seller.intro}</font><br><br>
											
											</div>
											
										<!-- 중개 상세 정보보기 버튼 -->
											<div style="height:100px;">
													<button type="button" class="btn btn-lg" style=" width:100%; background-color:#202020" 
													onclick="sellerInfo(this);">
													<font size="2"><span class="glyphicon glyphicon-user" style="color:white"> 중개사무소 정보 보기</span></font>
												</button>
											</div>
									<!-- 중개 상세 정보보기 버튼 -->
									
										</div>
									</div>
									
								</div>
							
							
					</div>

					</div>
				</div>
         

        <!--  매물 상세정보 테이블 -->
         <div class="row" style="width:640px">
            <div style="margin-top:20px; ">
               <div style="font-size:20px; font-weight: bold ;">매물정보</div> 
                  <div >
                     <table class="table table-hover">
                        <tbody>
                           <tr>
                              <td class="h col-md-2">보증금 </td>
                              <td class="col-md-2">${vo.deposit }</td>
                              <td class="h col-md-2">월세</td>
                              <td class="col-md-2">${vo.monthly_rent }</td>
                           </tr>
                           <tr>
                              <td class="h">관리비 </td>
                              <td>${vo.manage_fee}</td>
                              <td class="h">입주 가능일</td>
                              <td>${vo.moving_date}</td>
                           </tr>
                           <tr>
                              <td class="h">해당층/건물층</td>
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
                              <td class="h">크기</td>
                              <td>${vo.gross_area}</td>
                           </tr>
                           <tr>
                              <td class="h">옵션</td>
                              <td colspan="3">${vo.opt}</td>
                           </tr>
                           <tr>
                           	  <td class="h">인근지하철</td>
                              <td colspan="3">${vo.near_subway}</td>
                           </tr>
                          
                           <tr>
                              <td class="h" rowspan="4">상세 설명</td>
                              <td colspan="3">${vo.description}</td>
                           </tr>
                           
                        </tbody>
                     </table>
                     
                  
                  </div>
            </div>
         </div>
   		
               
	            <!-- 지도 출력 -->
				
	         <div id="map-info" class="row" style="margin-bottom:30px;">
	           	   <h1 style="margin-left:35%;">매물위치</h1>
	            
	               <input type="hidden" id="x_position" value="${x }">
	               <input type="hidden" id="y_position" value="${y }">
	               <!-- 해당 매물 위치 -->
	                
	               <div id="map" style="width:70%; margin-left:5%;"></div>
	         </div>
      
         </div>
         <!-- container 끝 -->
         <div class="form-group text-center" >
            <input type=button id="cencel" name="cencel" class="btn btn-primary" value="뒤로가기" onClick="history.back()">
         </div>
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