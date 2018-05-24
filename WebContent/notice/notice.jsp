<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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

.navbar-header {
	margin-left: 0px;
}
#d{
	text-align:center;
}
</style>

</head>
<body>



	<!-- header랑 연결된 하단 부분 끝 -->
	<div class="row">
		<div id="fh5co-work-section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>공 지 사 항</h3>
					</div>
				</div>
			</div>


			<div class="container" style="width: 90%;">
				<div class="row">
					<div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
						<div class="panel panel-default panel-table" style="width: 100%;">

							<!-- 게시글목록 테마별 보기?? 시작 -->
							<div class="panel-heading">
								<div class="row">

									<div class="col col-xs-6">
										<h3 class="panel-title">공지사항</h3>
									</div>
									<div class="col col-xs-6 text-right">
										<div class="pull-right">
											<div class="btn-group" data-toggle="buttons">${curpage}page/${totalpage} pages</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 게시글목록 테마별 보기?? 끝-->

							<div class="panel-body">
								<table id="mytable" class="table table-striped table-bordered table-list">
									<thead>
										<tr>
											<th id="d" class="col-text" width="5%">번호</th>
											<th id="d"  class="col-text" width="80%">제목</th>
											<th id="d"  class="col-text" width="10%">작성자</th>
											<th id="d"  class="col-text" width="5%">작성일</th>
										</tr>
									</thead>
									<tbody>

										<!-- table 게시글 리스트 출력 시작-->
										<c:forEach var="vo" items="${list }">
											<tr data-status="completed">
												<td id="d" >${vo.no }</td>
												<td style="text-align:left;"><a href="noticeContent.do?no=${vo.no }&page=${curpage}">${vo.title }</a></td>
												<td id="d" >${vo.email }</td>
												<td id="d" ><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>

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
										<nav aria-label="Page navigation" class="text-center"> <!-- 좌측 우측 넘기는거  -->
										<ul class="pagination">
											<c:if test="${ curpage!=1}">
												<li><a href="notice.do?page=${curpage-1 }" aria-label="Previous"> ◀ </a></li>
											</c:if>


											<c:if test="${curpage<totalpage }">
												<li><a href="notice.do?page=${curpage+1 }" aria-label="Next"> ▶ </a></li>
											</c:if>
										</ul>

										</nav>
									</div>
									<!-- 글쓰기 -->

									<c:if test="${sessionScope.id=='admin'}">
										<div class="col col-xs-3">
											<div class="pull-right">
												<td class="text-left"><a href="noticeInsert.do?page=${curpage }" class="btn btn-sm btn-success">새글</a></td>
											</div>
										</div>
									</c:if>
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

