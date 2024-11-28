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
	<jsp:useBean id="tradeDAO" class="trade.TradeDAO" />
	<jsp:useBean id="userDAO" class="user.UserDAO" />
	
	<%
		String itemnum = request.getParameter("itemnum");
		if(itemnum.equals("1")){
	%>
		 <jsp:forward page="test.jsp?itemnum=<%=itemnum %>"/>
	<%	
		}
	%>
		<form method="post" action="test.jsp">
		<input type="text" name="itemnum" id="itemnum">
		<input type="submit" value="이동">
		</form>
</body>
</html>