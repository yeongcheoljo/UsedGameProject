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
		int result = tradeDAO.tradeDone(tradenum);
		if(result == 1){
	%> 
		<script type="text/javascript">
			alert("거래가 완료되었습니다.")
			location.href="mypage.jsp"
		</script>
	<%	
		}else{
	%>
		<script type="text/javascript">
			alert("거래완료에 실패했습니다.")
			history.go(-1)
		</script>
	<%}%>
	
</body>
</html>