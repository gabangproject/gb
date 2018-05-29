<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=EUC-KR>
</head>
<body>
	<c:forEach var="i" items="${geoList}" varStatus="s">
		<div class="media">
			<div class="fav-box">
				<i class="fa fa-heart-o" aria-hidden="true"></i>
				<i class="fa fa-eye" aria-hidden="true"></i>
			</div>
			<a href="#?num=${i.num}">
				<img class="d-flex align-self-start maemool-list-img" src="${oneImg.get(i.num)}">
			</a>
			<div class="media-body pl-3">
				<div class="price" num='${i.num}'>
					${i.deposit}
					<div class=address>${i.addr}</div>
				</div>
				<div class="stats">
					<span>
						위도<i class="fa fa-arrows-alt" id='${i.num}x'>${i.x_position}</i>
					</span>
					<span>
						경도<i class="fa fa-bath" id='${i.num}y'>${i.y_position}</i>
					</span>
				</div>
			</div>
		</div>
	</c:forEach>

</body>
</html>