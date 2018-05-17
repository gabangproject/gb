<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.navbar-header {
	margin-left: 0px;
}
</style>

<script type="text/javascript">
	$(function() {
		$('#delBtn').click(function() {
			var txt = $('#delBtn').text();
			if (txt == '삭제') {
				$('#del').show();
				$('#delBtn').text("취소");
			} else {
				$('#del').hide();
				$('#delBtn').text("삭제");
			}
		});
	});
</script>
</head>
<body>

	<!-- header랑 연결된 하단 부분 끝 -->

	<div id="fh5co-work-section">
		<div class="container">
			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
					<h3>게시글 보기</h3>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<h1>내용보기</h1>
				<table class="table">
					<tr>
						<td class="success text-center" width="20%">번호</td>
						<td class="text-center" width="30%">${vo.no }</td>
						<td class="success text-center" width="20%">작성일</td>
						<td class="text-center" width="30%"><fmt:formatDate
								value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
					</tr>

					<tr>
						<td class="success text-center" width="20%">이름</td>
						<td class="text-center" width="30%">${vo.email }</td>
						<td class="success text-center" width="20%">조회수</td>
						<td class="text-center" width="30%">${vo.hit }</td>
					</tr>

					<tr>
						<td class="success text-center" width="20%">제목</td>
						<td colspan="3" class="text-left">${vo.title }</td>
					</tr>
					<tr>
						<td class="text-left" valign="top" height="200">${vo.content }</td>
						<td></td>
					</tr>
				</table>
 				<table class="table">
					<tr>
						<td class="text-center">
							<c:if test="${sessionScope.id.equals(vo.email)}">
								<a href="update.do?no=${vo.no }" class="btn btn-sm btn-primary" id="update">수정</a>
								<a href="#" class="btn btn-sm btn-warning" id="delBtn" >삭제</a>
							</c:if> 
							 <a href="qnaboard.do" class="btn btn-sm btn-warning">목록</a>
						</td>
					</tr>
						<td class="text-right" id="del" style="display: none">
							<form action="delete.do">
								<input type=hidden name=no value="${vo.no}">
								<input type=submit value="삭제" class="btn btn-sm btn-danger">
							</form>
						</td>
				</table>

			</div>
		</div>
</body>
</html>