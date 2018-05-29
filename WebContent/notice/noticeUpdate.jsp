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
</style>

</head>
<body>



	<!-- header랑 연결된 하단 부분 끝 -->

	<div id="fh5co-work-section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>게시물 수정</h3>
				</div>
			</div>
		</div>


		<div class="container" style="width: 80%;">
			<table class="table">
				<tr>
					<td class="col-md-2"><img src="../qnaboard/icon1.jpg" width="278" height="623" /></td>
					<td class="col-md-8" style="margin: auto;">
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<h1>수정하기</h1>
								<form method=post action="noticeUpdate_ok.do">
									<table class="table table-hover">

										<tr>
											<td width="15%" class="success text-right">제목</td>
											<td width="85%" class="text-left"><input type=text name=title size=45 required value="${vo.title }"></td>
											<input type="hidden" name=no value="${vo.no }">
											<input type="hidden" name=page value="${curpage }">
										</tr>

										<tr>
											<td width="15%" class="success text-right">내용</td>
											<td width="85%" class="text-left"><textarea rows="10" cols="50" name=content required>${vo.content }</textarea></td>
										</tr>

										<tr>
											<td colspan="2" class="text-center"><input type="submit" class="btn btn-sm btn-warning" value="수정" id="writeBtn"> <input type="button" class="btn btn-sm btn-danger" value="취소"
												onclick="javascript:history.back()"></td>
										</tr>

									</table>
								</form>
							</div>
						</div>
					</td>
					<td class="col-md-2"><img src="../qnaboard/icon2.jpg" width="278" height="623" /></td>
				</tr>
			</table>
		</div>
</body>
</html>