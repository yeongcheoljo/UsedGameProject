<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="position:absolute; left:200px; right:200px">
	<%@ include file="./header.jsp" %>
	<div class="frame user-frm">
	<h2 align="center">로그인</h2>
<article class="card-body" style="max-width: 300px; margin: auto;">
    <!-- 회원가입 form태그 시작 -->
	<form method="post" action="LoginCheck.jsp">
	<div class="form-group input-group fg-x700">
        <input name="id" class="form-control" placeholder="Id 입력" type="text" required/>
    </div> <!-- form-group// -->
	
	<div class="form-group input-group fg-x700">
        <input name="password" class="form-control" placeholder="비밀번호 입력" type="password" required>
    </div> <!-- form-group// -->
     
    <div class="fg-x700 form-group">
        <button type="submit" class="btn btn-primary btn-block"> 로그인  </button>
    </div> <!-- form-group// -->                                                                       
</form>
</article>
</div>
</div>
</body>
</html>