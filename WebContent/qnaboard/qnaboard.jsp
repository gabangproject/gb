Mm<%@ page language="java" contentType="text/html; charset=utf-8"
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



	<!-- header랑 연결된 하단 부분 끝 -->

	<div id="fh5co-work-section">
		<div class="container">
			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>Q&A 게시판</h3>
				</div>
			</div>
		</div>


		<div class="container" style="width: 80%;">
			<table class="table">
				<tr>
					<td class="col-md-2"><img src="../qnaboard/icon1.jpg" width="278" height="623" /></td>
					<td class="col-md-8" style="margin: auto;">

						<div class="col-md-10 col-md-offset-1" style="padding-left: 0px; padding-right: 0px;">
							<div class="panel panel-default panel-table">
								<div class="panel-heading" style="background-color:#FAF4C0; color:#000000;">
									<div class="row">
										<span class="navbar-brand">
											<form method="post" action="qnaboard.do">
												<select name="search">
													<option value="title">제목</option>
													<option value="email">작성자</option>
													<option value="content">내용</option>
												</select> <input type="text" name="keyword" required> <input
													type="submit" class="btn btn-sm" value="검색">
											</form>
										</span>
									</div>
								</div>
							</div>
						</div> <!-- 게시글 검색하는 부분 -->


						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<div class="panel panel-default panel-table">

									<!-- 게시글목록 테마별 보기?? 시작 -->
									<div class="panel-heading" style="background-color:#FAF4C0; color:#000000;">
										<div class="row">
											<div class="col col-xs-6">
												<h3 class="panel-title">Q&A 게시판</h3>
											</div>
											<div class="col col-xs-6 text-right">
												<div class="pull-right">
													<div class="btn-group" data-toggle="buttons">${curpage}page/${totalpage}pages</div>
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
													<th class="col-text" width="10%" style="background-color:#FAF4C0; color:#000000;" >번호</th>
													<th class="col-text" width="45%" style="background-color:#FAF4C0; color:#000000;">제목</th>
													<th class="col-text" width="15%" style="background-color:#FAF4C0; color:#000000;">작성자</th>
													<th class="col-text" width="20%" style="background-color:#FAF4C0; color:#000000;">작성일</th>
													<th class="col-text" width="10%" style="background-color:#FAF4C0; color:#000000;">조회수</th>
												</tr>
											</thead>
											<tbody>

												<!-- table 게시글 리스트 출력 시작-->
												<c:forEach var="vo" items="${list }" varStatus="status">
													<tr data-status="completed">
														<td>${count-(curpage-1)*10 - (status.index)}</td>
														<td><c:if test="${bDisplay == true }">
																<c:if test="${vo.group_tab >0}">
																	<c:forEach var="i" begin="0" end="${vo.group_tab }"
																		step="1">
                                          							   &nbsp;&nbsp;&nbsp;
                                       </c:forEach>
																	<img src="../qnaboard/icon_reply.gif">
																</c:if>
															</c:if> <a href="content.do?no=${vo.no }&page=${curpage}">${vo.title }</a></td>


														<td>${vo.email }</td>
														<td><fmt:formatDate value="${vo.regdate }"
																pattern="yyyy-MM-dd" /></td>
														<td>${vo.hit }</td>
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
													<!-- 좌측 우측 넘기는거  -->
													<ul class="pagination">

														<c:if test="${ curpage!=1}">
															<li><a href="qnaboard.do?page=${curpage-1 }"
																aria-label="Previous"> ◀ </a></li>
														</c:if>

														<c:if test="${curpage<totalpage }">
															<li><a href="qnaboard.do?page=${curpage+1 }"
																aria-label="Next"> ▶ </a></li>
														</c:if>

													</ul>
												</nav>
											</div>

											<!-- 글쓰기 -->

											<c:if test="${sessionScope.id!=null}">
												<div class="col col-xs-3">
													<div class="pull-right">
														<a href="insert.do?page=${curpage }"
															class="btn btn-sm btn-success">새글</a>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</td>
					<td class="col-md-2"><img src="../qnaboard/icon2.jpg" width="278" height="623" /></td>
				</tr>
			</table>
		</div>
	</div>





</body>
</html>

