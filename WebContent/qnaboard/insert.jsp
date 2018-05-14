<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<style type="text/css">
.row{
   margin: 0px auto;
   width: 700px;
}
h1{
     text-align:center;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <h1>글쓰기</h1>
      <!-- 
            .do => DispatcherServlet => BoardModel
       -->
      <form method=post action="#">
      <table class="table table-hover">
       <tr>
        <td width="15%" class="success text-right">이름</td>
        <td width="85%" class="text-left">
         <input type=text name=name size=15 required>
        </td>
       </tr>
       
       <tr>
        <td width="15%" class="success text-right">제목</td>
        <td width="85%" class="text-left">
         <input type=text name=subject size=45 required>
        </td>
       </tr>
       
       <tr>
        <td width="15%" class="success text-right">내용</td>
        <td width="85%" class="text-left">
         <textarea rows="10" cols="50" name=content required></textarea>
        </td>
       </tr>
       
       <tr>
        <td width="15%" class="success text-right">비밀번호</td>
        <td width="85%" class="text-left">
         <input type="password" name=pwd size=10 required>
        </td>
       </tr>
       
       <tr>
        <td colspan="2" class="text-center">
         <input type="submit" class="btn btn-sm btn-primary"
          value="글쓰기" id="writeBtn">
         <input type="button" class="btn btn-sm btn-primary"
          value="취소" onclick="javascript:history.back()">
        </td>
       </tr>
       
      </table>
      </form>
    </div>
  </div>
</body>
</html>