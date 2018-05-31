<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<!-- ���� ���� -->

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
	left: 0;
	opacity: 0;
	z-index: 2;
}

.carousel .next, .carousel .prev {
	left: 0;
	opacity: 1;
	z-index: 1;
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

.h {
	font-weight: bold;
}

table, th, td {
	border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
}
</style>
<script type="text/javascript">
	
<%-- by.�ؿ� --%>
	function jjim(input) {
		var num = $(input).attr("num");
		alert(num);
		var heart = $(input).attr('class');

		if (heart == "glyphicon glyphicon-heart") {
			$.ajax({
				type : 'post',
				data : {
					maemool_num : num
				},
				url : "../main/remove_jjim.do",
				success : function(data) {
					$(input).attr('class', "glyphicon glyphicon-heart-empty");
				}
			});
		}

		else {
			$.ajax({
				type : 'post',
				data : {
					maemool_num : num
				},
				url : "../main/add_jjim.do",
				success : function(data) {
					$(input).attr('class', "glyphicon glyphicon-heart");
				}
			});
		}
	}
<%-- by.�Ѽ� --%>
	function send(input) {
		var a = $(input).attr('num');
		alert(a);
		var eye = $(input).attr('class');

		if (eye == "fa fa-eye") {
			$.ajax({
				type : "POST",
				url : "../main/like_add.do",
				data : {
					num : a
				},
				success : function(data) {
					alert("���Ͷ����� ���򺯽�");
					$(input).attr('class', "fas fa-eye")
				}
			});
		}

		else {
			$.ajax({
				type : "POST",
				url : "../main/like_delete.do",
				data : {
					num : a
				},
				success : function(data) {
					alert("���Ͷ����� ���� ����������");
					$(input).attr('class', "far fa-eye")
				}
			});

		}
	};
</script>
</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section">
		<div class="container">

			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>�Ź�����</h3>
				</div>
			</div>



			<!-- �Ź� �̹��� ��� -->
			<div class="row">
				<div style="width: 70%; margin: 0px auto;">
					<div id="myCarousel" class="carousel  slide" style="height: 500px;">
						<!-- Dot Indicators -->
						<ol class="carousel-indicators">
							<c:forEach var="img" items="${imgList }" varStatus="n">
								<c:if test="${n.index==0 }">
									<li data-target="#myCarousel" data-slide-to="${n.index }"
										class="active"></li>
								</c:if>
								<c:if test="${n.index!=0 }">
									<li data-target="#myCarousel" data-slide-to="${n.index }"></li>
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
						<!-- �̹����� -->
					</div>
					<!-- Navigation -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>


			<div class="row">

				<div style="margin-top: 20px;">
					<div style="font-size: 20px; font-weight: bold;">������</div>
					<div>
						<table class="table table-hover"">
							<tbody>
								<tr>
									<td class="col-md-2 h">����� ���̵�</td>
									<td colspan="3">${vo.email}</td>
								</tr>
								<tr>
									<td class="h">������</td>
									<td>${vo.deposit }</td>
									<td class="h">����</td>
									<td>${vo.monthly_rent }</td>
								</tr>
								<tr>
									<td class="h">������</td>
									<td>${vo.manage_fee}</td>
									<td class="h col-md-2 ">������ �׸�</td>
									<td>${vo.maintenance}</td>
								</tr>
								<tr>
									<td class="h">��/�ǹ�����</td>
									<td>${vo.floor}</td>
									<td class="h">����������</td>
									<td><c:if test="${vo.elev==1 }">
											����
											</c:if> <c:if test="${vo.elev==0 }">
											�Ұ���
											</c:if></td>
								</tr>
								<tr>
									<td class="h">����</td>
									<td><c:if test="${vo.parking_lot==1}">
											����
											</c:if> <c:if test="${vo.parking_lot==0}">
											�Ұ���
											</c:if></td>
									<td class="h">�Ź� ����</td>
									<td>${vo.detail_title}</td>
								</tr>
								<tr>
									<td class="h">ũ��</td>
									<td>${vo.gross_area}</td>
									<td class="h">�ɼ�</td>
									<td>${vo.opt}</td>
								</tr>
								<tr>
									<td class="h">���� ������</td>
									<td>${vo.moving_date}</td>
									<td class="h">�α�����ö</td>
									<td>${vo.near_subway}</td>
								</tr>
								<tr>
									<td class="h">�󼼼���</td>
									<td colspan="3">${vo.description}</td>
								</tr>
								<tr>
									<td class="h" rowspan="5" style="vertical-align: middle;">�߰���
										����</td>
									<td rowspan="5"><img src="${seller.pic }" width="200px"
										height="200px"></td>
									<td class="h">��ȭ��ȣ</td>
									<td>${seller.comp_tel }</td>
								</tr>

								<tr>
									<td class="h">�߰����</td>
									<td>${seller.comp_name }</td>
								</tr>
								<tr>
									<td class="h">�ּ�</td>
									<td>${seller.addr }</td>
								</tr>
								<tr>
									<td class="h">�߰��� �Ұ�</td>
									<td>${seller.intro}</td>
								</tr>
								<tr>
									<td class="h">�߰��� ����</td>
									<td>${seller.eval_score } ��</td>
								</tr>
							</tbody>
						</table>


					</div>
				</div>

			</div>
			<div>

				<div class="media">
					<div class="fav-box">
						<a><span class="glyphicon glyphicon-heart-empty" onclick="jjim(this)" num=${i.num }></span></a> 
						<i class="far fa-eye" id='like' aria-hidden="true" num='${i.num}' onclick="send(this)"></i>

						
					</div>
				</div>
				<div class="row" style="margin-bottom: 30px;">

					<!-- ���� ��� -->

					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>�Ź���ġ</h3>
						</div>
					</div>

					<input type="hidden" id="x_position" value="${x }"> <input
						type="hidden" id="y_position" value="${y }">
					<!-- �ش� �Ź� ��ġ -->

					<div id="map" style="width: 50%; margin: 0px auto"></div>
				</div>

			</div>
			<!-- container �� -->
			<div class="form-group text-center">
				<input type=button id="cencel" name="cencel" class="btn btn-primary"
					value="�ڷΰ���" onClick="history.back()">
			</div>
		</div>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
			
		</script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<!-- ���� ���� ���� script -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0414b62e66e43f9fc50e0f6dfd64b93f"></script>
		<script>
			var x_position = $('#x_position').val();
			var y_position = $('#y_position').val();

			var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
			mapOption = {
				center : new daum.maps.LatLng(x_position, y_position), // ������ �߽���ǥ
				level : 3
			// ������ Ȯ�� ����
			};

			var map = new daum.maps.Map(mapContainer, mapOption);

			var markerPosition = new daum.maps.LatLng(x_position, y_position);

			// ��Ŀ�� �����մϴ�
			var marker = new daum.maps.Marker({
				position : markerPosition
			});

			// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
			marker.setMap(map);

			//���� ��ũ��Ʈ
		</script>
</body>
</html>