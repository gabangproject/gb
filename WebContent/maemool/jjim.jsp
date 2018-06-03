	<!-- ///////////////////박한솔 - 쿠키 사용 - 관심목록//////////////////////// -->
	
	
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
function deleteJjim(num) {
	   var number = num
	   
	   
		   $.ajax({
		         type : 'post',
		         data : {
		            maemool_num : num
		         },
		         url : "../main/remove_jjim.do",
		         success : function(data) {
		        	 $('#delete').html().hide();
		         }
		      });
	   
	}
</script>
<style type="text/css">
.btn-group .btn {
	transition: background-color .3s ease;
}

.panel-table .panel-body {
	padding: 0;
}

.table>thead>tr>th {
	border-bottom: none;
}

.panel-footer, .panel-table .panel-body .table-bordered {
	border-style: none;
	margin: 0;
}

.panel-table .panel-body .table-bordered>thead>tr>th:first-of-type {
	text-align: center;
	width: 50px;
}

.panel-table .panel-body .table-bordered>thead>tr>th.col-tools {
	text-align: center;
	width: 120px;
}

.panel-table .panel-body .table-bordered>thead>tr>th:last-of-type,
	.panel-table .panel-body .table-bordered>tbody>tr>td:last-of-type {
	border-right: 0;
}

.panel-table .panel-body .table-bordered>thead>tr>th:first-of-type,
	.panel-table .panel-body .table-bordered>tbody>tr>td:first-of-type {
	border-left: 0;
}

.panel-table .panel-body .table-bordered>tbody>tr:first-of-type>td {
	border-bottom: 0;
}

.panel-table .panel-body .table-bordered>thead>tr:first-of-type>th {
	border-top: 0;
}

.pagination>li>a, .pagination>li>span {
	border-radius: 50% !important;
	margin: 0 5px;
}

.pagination {
	margin: 0;
}

.navbar-header {
	margin-left: 0px;
}
</style>

</head>
<body>


	<!-- ///////////////////박한솔 - 쿠키 사용 - 관심목록//////////////////////// -->
	<!-- header랑 연결된 하단 부분 끝 -->

	<div id="fh5co-work-section">
		<div class="container">
			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>관심목록</h3>
				</div>
			</div>
		

	<div class="row" style="width: 80%;">
		<table class="table">
			<tr>
				<td class="col-md-2"><img src="../qnaboard/icon1.jpg"
					width="278" height="623" /></td>
				<td class="col-md-8" style="margin: auto;">

					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="panel panel-default panel-table">

								<!-- 게시글목록 테마별 보기?? 시작 -->
								<div class="panel-heading">
									<div class="row">
										<div class="col col-xs-6">
											<h3 class="panel-title">매물목록</h3>
										</div>
									</div>
								</div>

								<!-- 게시글목록 테마별 보기?? 끝-->

								<div class="panel-body">
									<table id="mytable"
										class="table table-striped table-bordered table-list">
										<thead>
											<tr>
												<th class="col-text" width="15%">매물번호</th>
												<th class="col-text" width="30%">보증금</th>
												<th class="col-text" width="15%">월세</th>
												<th class="col-text" width="35%">주소</th>
												<th class="col-text" width="10%">삭제</th>
											</tr>
										</thead>
										<tbody>

											<!-- table 게시글 리스트 출력 시작-->
											<%-- <c:forEach var="vo" items="${vo }"> --%>
											<c:forEach var="vo" items="${list }" end="10">
												<tr>
													
													<td><a href="../main/maemool_detail.do?num=${vo.num }&X=${vo.x_position }&Y=${vo.y_position}">${vo.num}</a></td>
													<td><a href="../main/maemool_detail.do?num=${vo.num }&X=${vo.x_position }&Y=${vo.y_position}">${vo.deposit }</a></td>
													<td><a href="../main/maemool_detail.do?num=${vo.num }&X=${vo.x_position }&Y=${vo.y_position}">${vo.monthly_rent }</a></td>
													<td><a href="../main/maemool_detail.do?num=${vo.num }&X=${vo.x_position }&Y=${vo.y_position}">${vo.addr }</a></td>
													
													
													<td>
													
														<form action="../main/like_delete.do" method="post">
															<div id="delete">
															<input type=submit  value="삭제" class="btn btn-sm btn-danger" onclick="deleteJjim(${vo.num})">
															</div>
															<input type="hidden" name="num" value="${vo.num }">
														</form>
													</td>
												</tr>
											</c:forEach>
											<%-- </c:forEach> --%>
											<!-- table 게시글 리스트 출력 끝-->
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</td>
				<td class="col-md-2"><img src="../qnaboard/icon1.jpg"
					width="278" height="623" /></td>
			</tr>
		</table>
	
	</div>
	
	</div>
	</div>
</body>