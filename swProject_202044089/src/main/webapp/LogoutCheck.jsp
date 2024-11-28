<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//request 객체에서 session을 가져옴
    	HttpSession Session = request.getSession();

   		// 해당 session을 날려버림
    	Session.invalidate();

    	//다시 login.jsp 페이지로 응답
    	response.sendRedirect("mainpage.jsp");
	%>
</body>
</html>