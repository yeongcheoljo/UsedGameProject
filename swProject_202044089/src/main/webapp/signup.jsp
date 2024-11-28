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
	<h2 align="center">회원가입</h2>
	<div class="frame user-frm">
<article class="card-body" style="max-width: 700px; margin: auto;">
    <!-- 회원가입 form태그 시작 -->
	<form method="post" action="SignupCheck.jsp">
	<div class="form-group input-group fg-x700">
        <input name="id" class="form-control" placeholder="Id 입력" type="text" required/>
    </div> <!-- form-group// -->
	
	<div class="form-group input-group fg-x700">
        <input name="password" class="form-control" placeholder="비밀번호 입력" type="password" required>
    </div> <!-- form-group// -->
    
    <div class="form-group input-group fg-x700">
        <input name="password2" class="form-control" placeholder="비밀번호 확인" type="password" required>
    </div> <!-- form-group// -->
	
	<div class="form-group input-group fg-x700">
        <input name="name" class="form-control" placeholder="이름 입력" type="text" required/>
    </div> <!-- form-group// -->
    
    <div class="form-group input-group fg-x700">
        <input name="email" class="form-control" placeholder="Email 입력" type="email" required/>
    </div> <!-- form-group// -->
    
    <div class="form-group input-group fg-x700">
		<input name="addr" class="form-control" placeholder="주소 입력" type="text" required/>
	</div> <!-- form-group end.// -->
    
    <div class="form-group input-group fg-x700">
    	<input name="phone" class="form-control" placeholder="휴대폰번호 입력('-' 포함)" type="text" required/>
    </div> <!-- form-group// -->
    
    <div class="fg-x700 form-group">
        <button type="submit" class="btn btn-primary btn-block"> 회원 가입  </button>
    </div> <!-- form-group// -->                                                                       
</form>
</article>
</div>
</div>
</body>
</html>