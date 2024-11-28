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
		
		int result1 = tradeDAO.tradeRefuse(tradenum);
		int result2 = tradeDAO.tradePermissionRefuse(tradenum);
		
		if(result1 == -1 && result2 == -1){
		%>
			<script>
				alert("거래 거절을 실패했습니다.")
				history.go(-1)
			</script>
		<%
		}else{
		%>
			<script>
				alert("거래를 거절했습니다.")
				location.href="mypage.jsp"
			</script>
		<%
		}
	%> 
</body>
</html>