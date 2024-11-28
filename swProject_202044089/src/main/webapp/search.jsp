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
	<jsp:useBean id="itemDAO" class="item.ItemDAO" />
	<jsp:useBean id="tradeDAO" class="trade.TradeDAO" />

	<%	
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");	
	
		int searchcount = itemDAO.getSearchCount(search);
		int[] itemnum = itemDAO.getSearchNum(searchcount, search);
		
		int categorycode = 0;
		String platform = "";
		String genre = "";
		String trademethod = "";
		
		String itemname = "";
		String imgname = "";
		String price = "";
		String postdate = "";
		String exchangeitemname = "";
		String istradedone = null;
		int count = 0;
		int repeatcount = searchcount / 3 + 1;
		int rcount = 0;
		int linecount = 0;
	%>
	<div style="display: flex; text-align: center; ">
	<div style="margin: 0 auto">
	<h3>[<%=search %>]검색결과</h3>
		<table style="border-collapse: separate; border-spacing: 20px 40px;" >
	<%
		while(rcount < repeatcount){
	%>
			<tr>
	<%
			while(count < searchcount && linecount < 4){
				trademethod = itemDAO.getTradeMethod(itemnum[count]);
	%>
				<c:set var="trademethod" value="<%=trademethod %>" />
	<% 
				imgname = itemDAO.getImgname(itemnum[count]);
				itemname = itemDAO.getItemname(itemnum[count]);
				postdate = itemDAO.getPostdate(itemnum[count]);
				
				categorycode = itemDAO.getCategorycode(itemnum[count]);
				platform = itemDAO.getPlatform(categorycode);
				genre = itemDAO.getGenre(categorycode);
				
				istradedone = tradeDAO.IsTradeDone(tradeDAO.getItemTradeNum(itemnum[count]));
				
				if(trademethod.equals("거래")){
					price = itemDAO.getPrice(itemnum[count]);
				}else if(trademethod.equals("교환")){
					exchangeitemname = itemDAO.getExchangeItemName(itemnum[count]);
				}
			%>
				<c:set var="trademethod" value="<%=trademethod %>" />
				<c:set var="istradedone" value="<%=istradedone %>" />
				<c:if test="${istradedone eq 'N' || empty istradedone}"><h5 class="card-title">
				<td>
				<div class="card" style="width: 17rem;">
					<img src="./image/<%=imgname %>" class="card-img-top" alt="이미지">
				<div class="card-body">
					<%=itemname %> (<%=trademethod %>)</h5>
					<ul class="list-group list-group-flush">
					<c:choose>
						<c:when test="${trademethod eq '거래' }">
							<li class="list-group-item">가격 : <%=price %></li>
						</c:when>
						<c:otherwise>
							<li class="list-group-item">교환요청 상품 : <%=exchangeitemname %></li>
						</c:otherwise>
					</c:choose>
					<li class="list-group-item">플랫폼 : <%=platform %></li>
					<li class="list-group-item">장르 : <%=genre %></li>
					<li class="list-group-item">등록일 : <%=postdate %></li>
					</ul>
				<form method="post" action="showItem.jsp">
					<input type="hidden" name="itemnum" id="itemnum" value=<%=itemnum[count] %>>
					<input type="submit" value="자세히보기">
				</form>
				</div>
				</div>
				</td>
				</c:if>
			<%
				count++;
				linecount++;
			}
		%>
				</tr>
		<%
			linecount = 0;
			rcount++;
		}
	%>
	
	</tr>
	</table>
	</div>
	</div>
	</div>
</body>
</html>