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
        session = request.getSession();
        out.print("member ID: "+ session.getAttribute("ID") + "<br>");
    %>
    <form action="LogoutCheck.jsp" method="post">
        <input type="submit" value="로그아웃">
    </form>
</body>
</html>