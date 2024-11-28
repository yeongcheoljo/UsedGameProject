<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="tradeDAO" class="trade.TradeDAO" />
	
	<%
		int tradenum = Integer.parseInt(request.getParameter("tradenum"));
	
		int result = tradeDAO.paydone(tradenum);
		
		if(result == -1){
		%>
			<script>
				alert("결재에 실패했습니다.")
				history.go(-1)
			</script>
		<%
		}else{
		%>
			<script>
				alert("결재에 성공했습니다.")
				location.href="mypage.jsp"
			</script>
		<%
	}
	%>
</body>
</html>