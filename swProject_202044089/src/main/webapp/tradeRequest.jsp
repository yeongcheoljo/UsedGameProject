<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="position:absolute; left:200px; right:200px">
	<%@ include file="./header.jsp" %>
	<jsp:useBean id="tradeDAO" class="trade.TradeDAO" />
	<%
		session = request.getSession();
		String id = (String)session.getAttribute("ID");

		if (session == null || id == null || id.equals("")){		
	%>
		<script>
			alert("로그인 해주세요.")
			history.go(-1)
		</script>
	<%
		}else if(id.equals(request.getParameter("id"))){
			
	%>
		<script>
			alert("본인이 올린 상품에는 거래신청을 할수 없습니다.")
			history.go(-1)
		</script>
	<%
		}
		int itemnum = Integer.parseInt(request.getParameter("itemnum"));
		if(tradeDAO.tradeDupCheck(itemnum) == 1 && tradeDAO.IsTradeDone(tradeDAO.getItemTradeNum(itemnum)).equals("N")){
			%>
			<script>
				alert("이미 거래신청된 상품입니다.")
				history.go(-1)
			</script>
			<%
		}else if(tradeDAO.tradeDupCheck(itemnum) == 1 && tradeDAO.IsTradeDone(tradeDAO.getItemTradeNum(itemnum)).equals("Y")){
			%>
			<script>
				alert("거래 완료된 상품입니다.")
				history.go(-1)
			</script>
			<%
		}
	%>
	<h2 align="center">거래 신청</h2>
	<form method="post" action="tradeRequestCheck.jsp">  
		<table align="center">
			<tr>
				<td style="width: 150px; height: 30px;" align="center"><font
					color='red'>*</font>거래 방식 선택</td>
				<td><input class="form-check-input" type="radio" value="직거래" id="tradeway" name="tradeway" checked>
  				<label>직거래</label>
  				</td>
				<td><input class="form-check-input" type="radio" value="택배거래" id="tradeway" name="tradeway" >
  				<label>택배거래</label>
  				</td>
			</tr>
			<tr>
				<td style="width: 150px; height: 30px;" align="center"><font
					color='red'>*</font>정보 공개 여부</td>
				<td><input class="form-check-input" type="checkbox" value="Y" id="isphonenumopen" name="isphonenumopen" checked>
  				<label>전화번호</label>
  				</td>
				<td><input class="form-check-input" type="checkbox" value="Y" id="isaddropen" name="isaddropen">
  				<label>주소</label>
  				</td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td style="width: 80px; height: 30px;" align="center"><font
					color='red'>*</font>메시지</td>
				<td style="word_wrap:break-word;  word-break:break-all;"><textarea
						name="message" id="message" rows="8" cols="40"
						placeholder="메시지 입력" required></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" name="itemnum" id="itemnum" value=<%=itemnum %>>
					<input type="hidden" name="sellerid" id="sellerid" value="<%=request.getParameter("id") %>">
					<input type="submit" value="거래신청">
				</td>
			</tr>
		</table>
	</form>
	
	</div>
</body>
</html>