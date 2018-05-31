<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 매물등록 관련 bootstrap -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../main/js/bootstrap.min.js"></script>




</head>
<body>

	<!-- end:header-top -->
	<div id="fh5co-work-section">
		<div class="container" >
			
			<div class="row" >
				 <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box" > 
					<h1>등록 완료</h1>
					
				</div>
			</div>
		

		<div class="row" >
			<!-- Contact Section -->
		    
		          <div class="text-center" style="width:50%;margin:0px auto">
		            <h2>등록이 완료되었습니다.</h2>
		            <p>축하합니다!</p>
		            <ul class="list-inline banner-social-buttons">
		              <li class="list-inline-item">
		                <a href="main.do" class="btn btn-default btn-lg">
		                  <i class="fa fa-twitter fa-fw"></i>
		                  <span class="network-name">메인 가기</span>
		                </a>
		              </li>
		              <li class="list-inline-item">
		                <a href="maemool_detail.do?num=${num }&x=${x}&y=${y}" class="btn btn-default btn-lg">
		                  <i class="fa fa-github fa-fw"></i>
		                  <span class="network-name">등록글 보기</span>
		                </a>
		              </li>
		              <intpu type=hidden name="num" value="${num }">
		              <intpu type=hidden name="x" value="${x }">
		              <intpu type=hidden name="x" value="${y }">
		            </ul>
		          </div>
		        
			
		</div> 
			<!-- row 끝 -->
	</div>
		<!-- container 끝  -->

</div>
<!-- work-section 끝 -->
		
		
		


</body>
</html>