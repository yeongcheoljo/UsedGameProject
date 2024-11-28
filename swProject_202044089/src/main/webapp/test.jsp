
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="item.ItemDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="itemDAO" class="item.ItemDAO" />
	<jsp:useBean id="userDAO" class="user.UserDAO" />
	<jsp:useBean id="tradeDAO" class="trade.TradeDAO" />
	
	<%
		String sitemnum = request.getParameter("itemnum");
	%>
	<form method="post" action="test2.jsp">
		<input type="text" name="itemnum" id="itemnum">
		<input type="submit" value="이동">
	</form>
	<%=sitemnum %>

</body>
</html>