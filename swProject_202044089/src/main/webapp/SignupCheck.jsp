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
		if(userDAO.idCheck(id) == false){
	%>
		<script>
		alert("중복된 아이디 입니다.")
		history.go(-1)
		</script>
	<%	
		}

		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		boolean pwdcheck = password.equals(password2);
		
		if(pwdcheck == false){
	%>
		<script>
		alert("비밀번호가 일치하지 않습니다.")
		history.go(-1)
		</script>
	<%		
		}
		
		if(pwdcheck == true){
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			
			try{
				int result = userDAO.join(id, password, name, phone, addr, email);
				out.println(result);
				if(result == 1){
	%>
			<script>
				alert("회원가입에 성공했습니다.")
				location.href="mainpage.jsp"
			</script>
	<% 
						}
			}catch(Exception ex) {
				out.println("DB 데이터 입력 실패 : " + ex.getMessage());
			}
		}
	%>
	
	
</body>
</html>