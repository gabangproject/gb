<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
</style>

</head>
<body>
	


			
			
			<div id="fh5co-work-section">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
							<h3>공지사항</h3>
						</div>
					</div>
				</div>
				
				
				<div class="container">
			
			
			<!-- 게시글 검색하는 부분 -->
				<div class="row">
					<nav class="navbar navbar-default">
						<div class="container">
							<div class="navbar-header">
								<span class="navbar-brand">작성자 및 제목별 게시물 검색</span>
							</div>
							<div class="col-xs-12 col-md-4">

								<div class="form-group">

									<div class="input-group">
										<input type="text" class="form-control input-md" name="search">
										<div class="input-group-btn">
											<button type="button" class="btn btn-md btn-warning">
												<span class=" glyphicon glyphicon-search"></span>
											</button>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</nav>
				</div>
			<!-- 게시글 검색하는 부분 -->
				
				
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="panel panel-default panel-table">
						
						<!-- 게시글목록 테마별 보기?? 시작 -->
							<div class="panel-heading">
								<div class="row">
								
									<div class="col col-xs-6">
										<h3 class="panel-title">공지사항</h3>
									</div>
									<div class="col col-xs-6 text-right">
										<div class="pull-right">
											<div class="btn-group" data-toggle="buttons">
												<label class="btn btn-success btn-filter active" data-target="completed"> 
													<input type="radio"	name="options" id="option1" autocomplete="off" checked>10개 보기
												</label> 
												<label class="btn btn-warning btn-filter" data-target="pending"> 
													<input type="radio" name="options" id="option2" autocomplete="off">20개 보기
												</label>
												<label class="btn btn-default btn-filter" data-target="all">
													<input type="radio" name="options" id="option3" autocomplete="off"> 30개 보기
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						<!-- 게시글목록 테마별 보기?? 끝-->
						
							<div class="panel-body">
								<table id="mytable"
									class="table table-striped table-bordered table-list">
									<thead>
										<tr>
											<th class="col-check"><input type="checkbox" id="checkall" onclick="test()" /></th>
											<th class="col-tools">번호</th>
											<th class="hidden-xs">작성자</th>
											<th class="col-text">제목</th>
											<th class="col-text">수정 및 삭제</th>
										</tr>
									</thead>
									<tbody>
						  <!-- table 게시글 리스트 출력 시작-->
						  			<c:forEach var="i" begin="1" end="1">
										<tr data-status="completed">
											<td align="center"><input type="checkbox" class="checkthis" /></td>
											<td class="hidden-xs">1</td>
											<td>John Doe</td>
											<td>johndoe@example.com</td>
											<td align="center">
											 <a class="btn btn-default"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
											 <a class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
											</td>
										</tr>
									</c:forEach>
							<!-- table 게시글 리스트 출력 끝-->
									</tbody>
								</table>

							</div>
					<!-- 게시글 페이지 나눠지는 표시  -->
							<div class="panel-footer">
								<div class="row">
									<div class="col col-xs-offset-3 col-xs-6">
										<nav aria-label="Page navigation" class="text-center">
											<ul class="pagination">
												<li><a href="#" aria-label="Previous"> 
												<span aria-hidden="true">«</span>
												</a></li>
							<!-- 페이지 개수 표시 부분 시작 -->
							<!-- li 태그에  class속성 active 값 주면 view에서 파란색으로 표시 -->
											<c:forEach var="i" begin="1" end="5">
												<li><a href="#">${i}</a></li>
											</c:forEach>
							<!-- 페이지 개수 표시 부분 시작 -->
												<li><a href="#" aria-label="Next"> 
												<span aria-hidden="true">»</span>
												</a></li>
											</ul>
										</nav>
									</div>
									<div class="col col-xs-3">
										<div class="pull-right">
											<button type="button" class="btn btn-primary">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
												글쓰기
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
				
				
			</div>
			

			
	

</body>
</html>

