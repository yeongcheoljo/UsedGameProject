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
	<jsp:useBean id="commentinfoDAO" class="commentinfo.CommentinfoDAO" />
	<%
		String sitemnum = request.getParameter("itemnum");
		int itemnum = Integer.parseInt(sitemnum);
		
		String itemname = itemDAO.getItemname(itemnum);
		
		String imgname = itemDAO.getImgname(itemnum);
		
		int categorycode = itemDAO.getCategorycode(itemnum);
		String platform = itemDAO.getPlatform(categorycode);
		String genre = itemDAO.getGenre(categorycode);
		
		String postdate = itemDAO.getPostdate(itemnum);
		
		String content = itemDAO.getContent(itemnum);
		
		String id = itemDAO.getId(itemnum);
		
		String trademethod = itemDAO.getTradeMethod(itemnum);
		
		String price = "";
		String exchangeitemname = "";
		
		String istradedone = tradeDAO.IsTradeDone(tradeDAO.getItemTradeNum(itemnum));
		
		session = request.getSession();
		String myid = (String)session.getAttribute("ID");
		if(myid == null){
			myid = "guest";
		}
		
		if(trademethod.equals("거래")){
			price = itemDAO.getPrice(itemnum);
		}else if(trademethod.equals("교환")){
			exchangeitemname = itemDAO.getExchangeItemName(itemnum);
		}
	%>
	<c:set var="trademethod" value="<%=trademethod %>" />
	<c:set var="istradedone" value="<%=istradedone %>" />
	
	<h2 align="center">상품정보</h2><br>
	<div style="display: flex; text-align: center; ">
	
	<div style="margin: 0 auto; width:500px">
		
	<div class="container text-center">
  		<div class="row">
    		<div class="col">
      			<img src="./image/<%=imgname %>" class="object-fit-contain border rounded" alt="이미지">
    		</div>
    		<div class="col">
    			<h6><%=trademethod %>상품</h6>
      			<h5>상품명 : <%=itemname %></h5>
      			<c:if test="${istradedone eq 'Y' }"><h5 class="card-title">(거래완료)</h5></c:if><br>
				<c:choose>
						<c:when test="${trademethod eq '거래' }">
							가격 : <%=price %><br>
						</c:when>
						<c:otherwise>
							교환요청 상품 : <%=exchangeitemname %><br>
						</c:otherwise>
				</c:choose>
				판매자id : <%=id %><br><hr>
				플랫폼 : <%=platform %><br>
				장르 : <%=genre %><br>
				등록일 : <%=postdate %>
    		</div>
  		</div>
	</div>
	<br>
	<div>
		<h5>상품설명</h5><br>
		<%=content %>
	</div>
	
	<br><br>
		<form method="post" action="tradeRequest.jsp">
			<input type="hidden" name="itemnum" id="itemnum" value="<%=itemnum%>">
			<input type="hidden" name="id" id="id" value="<%=id%>">
			<input type="submit" value="거래신청">
		</form>
	
	<br><br><br>
	</div>
	</div>
	<table align="center">
		<tr>
			<form method="post" action="commentCheck.jsp">
				<input type="hidden" name="itemnum" id="itemnum" value="<%=itemnum%>">
				<input type="hidden" name="myid" id="myid" value="<%=myid%>">
				<td><%=myid %> <input style="width:400px" type="text" name="comment" id="comment"></td>
				<td><input type="submit" value="댓글쓰기"></td>
			</form>
		</tr>
	</table>
	<br>
	<%
		int commentcount = commentinfoDAO.getCommentCount(itemnum);
		int[] commentnum = commentinfoDAO.getCommentNum(commentcount, itemnum);
		
		String commentid = "";
		String commentdate = "";
		String comment = "";
		
		int count = 0;
	%>
	<table border="1" align="center">
	<%
		while(count < commentcount){
			commentid = commentinfoDAO.getCommentId(commentnum[count]);
			commentdate = commentinfoDAO.getCommentDate(commentnum[count]);
			comment = commentinfoDAO.getComment(commentnum[count]);
	%>
		<tr>
			<td style="width:460px"><%=commentid %> : <%=comment %></td>
			<td> <%=commentdate %></td>
		</tr>
	<%
		count++;
		}
	%>
	</table>
	<br><br>
	
	</div>
</body>
</html>