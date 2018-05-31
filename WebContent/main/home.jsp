<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<title>Insert title here</title>
</head>
<body>
	<!-- header랑 이어진 하단 부분 시작 g-->
	<div class="fh5co-hero" style="background-color: black;">
		<a href="#fh5co-work-section" class="smoothscroll fh5co-arrow to-animate hero-animate-4"><i class="ti-angle-down"></i></a>
		<div class="fh5co-cover text-center" style="background-color: black;">
			
			<div class="desc animate-box">
				<h2>가방</h2>
					<form action="maemool_search.do">
						<div class="row" style="margin: 0px auto;">
							<input type="text" class="form-control" placeholder="지역을 입력하세요" style="width:1000px; margin: 0px auto;"
							name=keyword>
							<br>
						</div>
						<div class="row" style="margin: 0 auto;">
							<input type=submit class="btn btn-primary" value=검색>
						</div>
					</form>
			</div>
		</div>

	</div>
	<!-- header랑 이어진 하단 부분 끝 -->

	<div id="fh5co-work-section">
		
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>테마 상세 검색</h3>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<!-- 테마 네모 박스 부분 -->
				<%-- <c:forEach var="i" begin="1" end="6"> --%>
				<c:forEach var="i" items="${theme}" varStatus="s">
					<div class="col-md-4">
						<%--<div class="fh5co-grid animate-box" style="background-image: url(images/work-${s.index+1}.jpg);">  --%>
						<div class="fh5co-grid animate-box" style="background-image: url(images/theme-${s.index+1}.jpg); background-size:320px 302px;
						background-repeat:no-repeat;">
							<a class="image-popup text-center" href="maemool_theme_list.do?keyword=${i}">
								<div class="prod-title">
									<h3>${i}</h3>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
				<!-- 테마 네모 박스 부분  끝-->
			</div>
		</div>
	</div>
</body>
</html>