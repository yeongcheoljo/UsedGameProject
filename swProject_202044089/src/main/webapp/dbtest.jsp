<%@page import="util.DatabaseUtil"%>
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
		String id = "test";
		String password = "1111";
		String name = "이름";
		String phone = "전화번호";
		String addr = "주소";
		String email = "이메일";
		
		try{
			int result = userDAO.join(id, password, name, phone, addr, email);
			out.println(result);
			out.println("DB 데이터 입력 성공");
		}catch(Exception ex){
			out.println("DB 데이터 입력 실패 : " + ex.getMessage());
		}		
	%>
</body>
</html>