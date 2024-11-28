<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="userDAO" class="user.UserDAO" />
	
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		if(userDAO.idCheck(id) == true){
	%>
		<script>
			alert("없는 아이디 입니다.")
			history.go(-1)
		</script>
	<%	
		}

		String password = request.getParameter("password");
		
		if(userDAO.pwdCheck(id, password) == true){
			HttpSession Session = request.getSession();
			Session.setAttribute("ID", id);
	%>
		<script>
			location.href="mainpage.jsp"
		</script>
	<%
		}else{
	%>
		<script>
			alert("비밀번호가 틀렸습니다.")
			history.go(-1)
		</script>
	<% 		
		}
	%>
</body>
</html>