<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		int itemnum = itemDAO.getNewitem();
		String itemname = "";
		String price = "";
		String exchangeitemname = "";
		
		String imgname = "";
		
		int categorycode = 0;
		String platform = "";
		String genre = "";
		
		String postdate = "";
		String trademethod = "";
		String istradedone = null;
		
		int count = 1;
	%>
	<div style="display: flex; text-align: center; ">
	<div style="margin: 0 auto">
	<h3>최신 상품 목록</h3>
		<table style="border-collapse: separate; border-spacing: 20px 40px;" >
			<tr>
				<%
		while(count < 4){
			itemname = itemDAO.getItemname(itemnum);
			
			imgname = itemDAO.getImgname(itemnum);
			
			categorycode = itemDAO.getCategorycode(itemnum);
			platform = itemDAO.getPlatform(categorycode);
			genre = itemDAO.getGenre(categorycode);
			
			postdate = itemDAO.getPostdate(itemnum);
			trademethod = itemDAO.getTradeMethod(itemnum);
			
			istradedone = tradeDAO.IsTradeDone(tradeDAO.getItemTradeNum(itemnum));
			
			if(trademethod.equals("거래")){
				price = itemDAO.getPrice(itemnum);
			}else if(trademethod.equals("교환")){
				exchangeitemname = itemDAO.getExchangeItemName(itemnum);
			}		
	%>
		<c:set var="trademethod" value="<%=trademethod %>" />
		<c:set var="istradedone" value="<%=istradedone %>" />
		<c:if test="${istradedone eq 'N' || empty istradedone}">
		<td>
		<div class="card" style="width: 17rem;">
			<img src="./image/<%=imgname %>" class="card-img-top" alt="이미지">
		<div class="card-body">
			<h5 class="card-title"><%=itemname %> (<%=trademethod %>)</h5>
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
			<input type="hidden" name="itemnum" id="itemnum" value=<%=itemnum %>>
			<input type="submit" value="자세히보기">
		</form>
		</div>
		</div>
		</td>
	<% 
		count++;
	%>
		</c:if>
	<%
		itemnum--;
		}
	%>
			</tr>
			
			<tr>
				<%
		while(count < 7){
			itemname = itemDAO.getItemname(itemnum);
					
			imgname = itemDAO.getImgname(itemnum);
			
			categorycode = itemDAO.getCategorycode(itemnum);
			platform = itemDAO.getPlatform(categorycode);
			genre = itemDAO.getGenre(categorycode);
			
			postdate = itemDAO.getPostdate(itemnum);
			trademethod = itemDAO.getTradeMethod(itemnum);
			
			istradedone = tradeDAO.IsTradeDone(tradeDAO.getItemTradeNum(itemnum));
			
			if(trademethod.equals("거래")){
				price = itemDAO.getPrice(itemnum);
			}else if(trademethod.equals("교환")){
				exchangeitemname = itemDAO.getExchangeItemName(itemnum);
			}
	%>
		<c:set var="trademethod" value="<%=trademethod %>" />
		<c:set var="istradedone" value="<%=istradedone %>" />
		<c:if test="${istradedone eq 'N' || empty istradedone}">
		<td>
		<div class="card" style="width: 17rem;">
			<img src="./image/<%=imgname %>" class="card-img-top" alt="이미지">
		<div class="card-body">
			<h5 class="card-title"><%=itemname %> (<%=trademethod %>)</h5>
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
			<input type="hidden" name="itemnum" id="itemnum" value=<%=itemnum %>>
			<input type="submit" value="자세히보기">
		</form>
		</div>
		</div>
		</td>
	<% 
		count++;
	%>
		</c:if>
	<%
		itemnum--;
		}
	%>
			</tr>
		</table>
	</div>
	
	</div>
	</div>
	

</body>
</html>