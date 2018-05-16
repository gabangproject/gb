<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
<title>Insert title here</title>
</head>
<body>
	<!-- header�� �̾��� �ϴ� �κ� ���� -->
	<div class="fh5co-hero" style="background-color: black;">

		<div class="fh5co-cover text-center" style="background-color: black;">
			<div class="desc animate-box">
				<h2>����</h2>

				<span><a class="btn btn-primary" href="#">����</a></span>
			</div>
		</div>

	</div>
	<!-- header�� �̾��� �ϴ� �κ� �� -->

	<div id="fh5co-work-section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>�׸� �� �˻�</h3>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<!-- �׸� �׸� �ڽ� �κ� -->
				<%-- <c:forEach var="i" begin="1" end="6"> --%>
				<c:forEach var="i" items="${theme}" varStatus="s">
					<div class="col-md-4">
						<div class="fh5co-grid animate-box" style="background-image: url(images/work-${s.index+1}.jpg);">
							<a class="image-popup text-center" href="maemool_list.do">
								<div class="prod-title">
									<h3>${i}</h3>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
				<!-- �׸� �׸� �ڽ� �κ�  ��-->
			</div>
		</div>
	</div>
</body>
</html>