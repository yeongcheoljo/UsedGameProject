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
	<jsp:useBean id="userDAO" class="user.UserDAO" />
	<jsp:useBean id="tradeDAO" class="trade.TradeDAO" />

	<%
		//회원정보
		//로그인된 아이디, 이름,전화번호,주소,이메일
		session = request.getSession();
		String id = (String)session.getAttribute("ID");
		String name = userDAO.getname(id);
		String phone = userDAO.getphone(id);
		String addr = userDAO.getaddr(id);
		String email = userDAO.getemail(id);
		
		//상품등록 현황
		//로그인된 아이디가 등록한 상품정보(상품명,가격,플렛폼,장르,등록일)
		//아이디를 통해 등록한 상품 번호를 배열로 설정
		int itemcount = itemDAO.getMyItemlength(id);
		int[] myitem = itemDAO.getMyItemNum(id,itemcount);
		int tradenum = 0;
		
		String itemname = "";
		String price = "";
		int categorycode = 0;
		String platform = "";
		String genre = "";
		String postdate = "";
		String istradedone = "";
		String exchangeitemname = "";
		String ispaydone = null;
		
		//거래신청 현황
		//로그인된 아이디가 신청한 거래정보(거래분류,상품명,판매자아이디,거래방식,정보공개여부,수락여부)
		//상품명 클릭시 상품정보 페이지로 이동
		//거래 수락시에 거래완료버튼 생성 버튼클릭시 거래완료처리 
		int tradecount = tradeDAO.getMyRequestLength(id);
		int[] mytrade = tradeDAO.getMyTradeNum(id, tradecount);

		String trademethod = "";
		String sellerid = "";
		String tradeway = "";
		String isphonenumopen = "";
		String isaddropen = "";
		String istradeallow = "";
		String tradedonedate = "";
		
		//들어온 거래신청
		//들어온 거래신청 정보 확인및 수락(tradeinfo 테이블에서 sellerid와 로그인된 아이디 비교후 공개)
		//상품명,구매자아이디,거래방식,정보공개,메시지
		//거래수락시에 istradeallow Y로 변경
		int requestcount = tradeDAO.getTradeReqLength(id);
		int[] mytradereq = tradeDAO.getMyTradeReqNum(id, requestcount);
		
		String buyerid = "";
		String message = "";
		String phonenum = "전화번호 미공개";
		String address = "주소 미공개";
		
		int count = 0;		
	%>
	<c:set var="itemcount" value="<%=itemcount %>" />
	<c:set var="tradecount" value="<%=tradecount %>" />
	<c:set var="requestcount" value="<%=requestcount %>" />
	
	<div style="display: flex;">
	<div style="margin: 0 auto; width:800px;">
	<h3>회원정보</h3>
	<table border="1" align="center" width="700px">
		<tr>
			<td>아이디</td>
			<td><%=id %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=phone %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=addr %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email %></td>
		</tr>
	</table>
	
	<br><br>
	
	<h3>상품등록 현황</h3>
	<table border="1" align="center" width="700px">
			<c:choose>
				<c:when test="${itemcount == 0}">
					<tr>
						<td>등록한 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<%
						count = 0;
						while(count < itemcount){
							//상품명,가격,장르,플랫폼,등록일,거래완료유무
							itemname = itemDAO.getItemname(myitem[count]);
							price = itemDAO.getPrice(myitem[count]);
							categorycode = itemDAO.getCategorycode(myitem[count]);
							platform = itemDAO.getPlatform(categorycode);
							genre = itemDAO.getGenre(categorycode);
							postdate = itemDAO.getPostdate(myitem[count]);
							istradedone = tradeDAO.getIsTradeDone(myitem[count]);
							
							trademethod = itemDAO.getTradeMethod(myitem[count]);
							
							if(trademethod.equals("거래")){
								price = itemDAO.getPrice(myitem[count]);
							}else if(trademethod.equals("교환")){
								exchangeitemname = itemDAO.getExchangeItemName(myitem[count]);
							}
							
							tradenum = tradeDAO.getItemTradeNum(myitem[count]);
							ispaydone = tradeDAO.getIsPayDone(tradenum);
							
							if(ispaydone != null && tradeDAO.tradeDupCheck(4) == 1 && istradedone.equals("거래 미완료")){
								if(ispaydone.equals("N")){
									istradedone = "결재 미완료";
								}else if(ispaydone.equals("Y")){
									istradedone = "결재 완료";
								}
							}
					%>
						<c:set var="trademethod" value="<%=trademethod %>" />
						<tr style="font-size: 10px">
							<td><%=trademethod%>) 상품명 : <%=itemname %></td>
							<c:choose>
								<c:when test="${trademethod eq '거래' }">
									<td>가격 : <%=price %></td>
								</c:when>
								<c:otherwise>
									<td>교환요청 상품 : <%=exchangeitemname %></td>
								</c:otherwise>
							</c:choose>
							<td>플랫폼 : <%=platform %></td>
							<td>장르 : <%=genre %></td>
							<td>등록일 : <%=postdate %></td>
							<td><%=istradedone %></td>
						</tr>
					<% 
						count++;
						}
					%>
				</c:otherwise>
			</c:choose>
	</table>
	
	<br><br>
	
	<h3>거래신청 현황</h3>
	<table border="1" align="center" width="700px">
		<c:choose>
				<c:when test="${tradecount == 0}">
					<tr>
						<td>거래신청한 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<%
						count = 0;
						while(count < tradecount){
							//거래분류,상품명,판매자아이디,거래방식,정보공개여부,수락여부
							trademethod = itemDAO.getTradeMethod(tradeDAO.getitemnum(mytrade[count]));
							itemname = itemDAO.getItemname(tradeDAO.getitemnum(mytrade[count]));
							sellerid = tradeDAO.getsellerid(mytrade[count]);
							tradeway = tradeDAO.getTradeway(mytrade[count]);
							isphonenumopen = tradeDAO.getphonenumopen(mytrade[count]);
							isaddropen = tradeDAO.getaddropen(mytrade[count]);
							istradeallow = tradeDAO.getIsTradeAllow(mytrade[count]);
							istradedone = tradeDAO.IsTradeDone(mytrade[count]);
							tradedonedate = tradeDAO.getTradeDoneDate(mytrade[count]);
							if(tradeway.equals("택배거래")){
								ispaydone = tradeDAO.getIsPayDone(mytrade[count]);
							}
					%>
						<c:set var="istradeallow" value="<%=istradeallow %>" />
						<c:set var="istradedone" value="<%=istradedone %>" />
						<c:set var="ispaydone" value="<%=ispaydone %>" />
						<tr style="font-size: 10px">
							<td><%=trademethod %></td>
							<td>상품명 : <%=itemname %></td>
							<td>판매자아이디 : <%=sellerid %></td>
							<td>거래방식 : <%=tradeway %></td>
							<td><%=isphonenumopen %></td>
							<td><%=isaddropen %></td>
							<td><%=istradeallow %></td>
							<c:if test="${istradeallow eq '수락됨' }">
							<td>
								<c:choose>
								<c:when test="${istradedone eq 'N' && empty ispaydone}">
									<form method="post" action="tradeDone.jsp">
									<input type="hidden" name="tradenum" id="tradenum" value=<%=mytrade[count] %>>
									<input type="submit" style="width:60px; height:25px; font-size:10px " value="거래완료">
									</form>
								</c:when>
								<c:when test="${istradedone eq 'N' && ispaydone eq 'N'}">
									<form method="post" action="payCheck.jsp">
									<input type="hidden" name="tradenum" id="tradenum" value=<%=mytrade[count] %>>
									<input type="submit" style="width:60px; height:25px; font-size:10px " value="결재하기">
									</form>
								</c:when>
								<c:when test="${istradedone eq 'N' && ispaydone eq 'Y'}">
									<form method="post" action="tradeDone.jsp">
									<input type="hidden" name="tradenum" id="tradenum" value=<%=mytrade[count] %>>
									<input type="submit" style="width:60px; height:25px; font-size:10px " value="거래완료">
									</form>
								</c:when>
								<c:otherwise>
									거래완료(<%=tradedonedate %>)
								</c:otherwise>
							</c:choose>
							</td>
							</c:if>
						</tr>
					<% 
						count++;
						}
					%>
				</c:otherwise>
			</c:choose>
	</table>
	
	<br><br>
	
	<h3>들어온 거래신청</h3>
	<table border="1" align="center" width="700px">
		<c:choose>
				<c:when test="${requestcount == 0}">
					<tr>
						<td>들어온 거래신청이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<%
						count = 0;
						while(count < requestcount){
							//상품명,구매자아이디,거래방식,정보공개,메시지
							itemname = itemDAO.getItemname(tradeDAO.getitemnum(mytradereq[count]));
							buyerid = tradeDAO.getbuyerid(mytradereq[count]);
							tradeway = tradeDAO.getTradeway(mytradereq[count]);
							isphonenumopen = tradeDAO.getphonenumopen(mytradereq[count]);
							if(isphonenumopen.equals("전화번호 공개"))
								phonenum = userDAO.getphone(buyerid);
							isaddropen = tradeDAO.getaddropen(mytradereq[count]);
							if(isaddropen.equals("주소 공개"))
								address = userDAO.getaddr(buyerid);
							message = tradeDAO.getmessage(mytradereq[count]);
							
							istradeallow = tradeDAO.IsTradeAllow(mytradereq[count]);
					%>
						<c:set var="istradeallow" value="<%=istradeallow %>" />
						<tr style="font-size: 10px">
							<td>상품명 : <%=itemname %></td>
							<td>구매자 아이디 : <%=buyerid %></td>
							<td>거래방식 : <%=tradeway %></td>
							<td>구매자 전화번호 : <%=phonenum %></td>
							<td>구매자 주소 : <%=address %></td>
						</tr>
						<tr>
							<td colspan="4">메시지 :<%=message %></td>
							<td align="right">
							<c:choose>
								<c:when test="${istradeallow eq 'N' }">
									<form method="post" action="tradeAllow.jsp">
										<input type="hidden" name="tradenum" id="tradenum" value=<%=mytradereq[count] %>>
										<input type="submit" style="width:60px; height:25px; font-size:10px " value="수락한다">
									</form>
									</td>
									<td>
									<form method="post" action="tradeRefuse.jsp">
										<input type="hidden" name="tradenum" id="tradenum" value=<%=mytradereq[count] %>>
										<input type="submit" style="width:60px; height:25px; font-size:10px " value="거절한다">
									</form>
								</c:when>
								<c:otherwise>
									수락완료
								</c:otherwise>
							</c:choose>						
							</td>
						</tr>
					<%
						count++;
						}
					%>
				</c:otherwise>
			</c:choose>
	</table>
	
	</div>
	</div>
	</div>
</body>
</html>