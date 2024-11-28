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
		request.setCharacterEncoding("utf-8");
		//tradeinfo에 들어갈 정보(tradenum, sellerid, buyerid, itemnum)	
		int tradenum = tradeDAO.getTradeNum();
		
		String sellerid = request.getParameter("sellerid");
	
		session = request.getSession();
		String buyerid = (String)session.getAttribute("ID");
		
		int itemnum = Integer.parseInt(request.getParameter("itemnum"));	
	
		//tradepermission에 들어갈 정보(tradenum, tradeway, isphonenumopen, isaddropen, message)
		String tradeway = request.getParameter("tradeway");
		
		String isphonenumopen = request.getParameter("isphonenumopen");
		if(request.getParameter("isphonenumopen") == null)
			isphonenumopen = "N";
		
		String isaddropen = request.getParameter("isaddropen");
		if(request.getParameter("isaddropen") == null)
			isaddropen = "N";
		
		String message = request.getParameter("message");
		
		String ispaydone = null;
		
		if(tradeway.equals("택배거래")){
			ispaydone = "N";
		}
		
		
		//tradeinfo, tradepermission에 정보입력
		try{
			int result1 = tradeDAO.tradeRegist(tradenum, sellerid, buyerid, itemnum, ispaydone);
			int result2 = tradeDAO.tradepermission(tradenum, tradeway, isphonenumopen, isaddropen, message);
			if(result1 == 1 && result2 == 1){
	%>
		<script>
			alert("거래신청에 성공했습니다.")
			location.href="mainpage.jsp"
		</script>
	<% 
					}
		}catch(Exception ex) {
			out.println("DB 데이터 입력 실패 : " + ex.getMessage());
		}
	%>

</body>
</html>