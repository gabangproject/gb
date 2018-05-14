<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
			<!-- header랑 이어진 하단 부분 시작 -->
			<div class="fh5co-hero" style="background-color: black;">
				
				<div class="fh5co-cover text-center"
					style="background-color: black;">
					<div class="desc animate-box">
						<h2>가방</h2>
						
						<span><a class="btn btn-primary" href="#">시작</a></span>
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
					<c:forEach var="i" begin="1" end="6">
						<div class="col-md-4">
							<div class="fh5co-grid animate-box" style="background-image: url(images/work-1.jpg);">
								<a class="image-popup text-center" href="list.jsp">
									<div class="prod-title">
										<h3>테마 ${i }</h3>
										
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