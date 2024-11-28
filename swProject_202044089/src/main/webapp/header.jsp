<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--부트스트랩 css이용을위한 코드 --%>
</head>
<body>
	<div style="position:absolute; left:20px; top:10px; width:100px; height:100px; background-color:#CF0">
		<a href="mainpage.jsp">로고</a>
	</div>
	
	<div style="height:100px; text-align:center">
	<br>
		<table align="center">
			<tr>
				<%--검색어를 입력하면 검색어가 들어간 상품정보 전시 --%>
				<form method="post" action="search.jsp">
					<td><input type="text" id="search" name="search"></td>
					<td><input type="submit" value="검색"></td>
				</form>
			</tr>
		</table>
	</div>
	<%--로그인이 되있을시 보여지는 부분--%>
	<c:choose>
		<c:when test="${sessionScope.ID ne null}">
			<div style="position:absolute; right:20px; top:10px" class="d-inline-flex p-2">
			<table border="0" style="border-spacing:5px; border-collapse:separate">
			<tr>
				<td><a href="LogoutCheck.jsp">로그아웃</a></td>
				<td><a href="mypage.jsp">마이페이지</a></td>
			</tr>
			<tr>
				<td><a href="registItem.jsp" style="font-size:10px">상품 등록(거래)</a></td>
				<td><a href="registExchange.jsp" style="font-size:10px">상품 등록(교환)</a></td>
			</tr>
			</table>
			</div>
		</c:when>
		<%--로그인이 안되있을시 보여지는 부분--%>
		<c:otherwise>
			<div style="position:absolute; right:20px; top:10px" class="d-inline-flex p-2">
			<table border="0" style="border-spacing:5px; border-collapse:separate">
			<tr>
				<td><a href="login.jsp">로그인</a></td>
				<td><a href="signup.jsp">회원가입</a></td>
			</tr>
			</table>
			</div>
		</c:otherwise>
	</c:choose>
	
	<%--카테고리선택 부분 드롭다운 버튼을 이용하여 카테고리선택시 선택한 카테고리 상품 전시--%>
	<div align="center">
		<table border="0" style="border-spacing:10px; border-collapse:separate">
			<tr>
				<td><div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			ps5(거래)
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=액션,격투&trademethod=거래">액션,격투</a></li>
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=슈팅&trademethod=거래">슈팅</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=RPG,어드벤처&trademethod=거래">RPG,어드벤처</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=스포츠,레이싱&trademethod=거래">스포츠,레이싱</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=전략,시뮬레이션,퍼즐&trademethod=거래">전략,시뮬레이션,퍼즐</a></li>
  				</ul>
				</div></td>
				
				<td><div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			ps4(거래)
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=액션,격투&trademethod=거래">액션,격투</a></li>
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=슈팅&trademethod=거래">슈팅</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=RPG,어드벤처&trademethod=거래">RPG,어드벤처</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=스포츠,레이싱&trademethod=거래">스포츠,레이싱</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=전략,시뮬레이션,퍼즐&trademethod=거래">전략,시뮬레이션,퍼즐</a></li>
  				</ul>
				</div></td>
				
				<td><div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			스위치(거래)
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=액션,격투&trademethod=거래">액션,격투</a></li>
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=슈팅&trademethod=거래">슈팅</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=RPG,어드벤처&trademethod=거래">RPG,어드벤처</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=스포츠,레이싱&trademethod=거래">스포츠,레이싱</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=전략,시뮬레이션,퍼즐&trademethod=거래">전략,시뮬레이션,퍼즐</a></li>
  				</ul>
				</div></td>
				
				<td><div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			ps5(교환)
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=액션,격투&trademethod=교환">액션,격투</a></li>
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=슈팅&trademethod=교환">슈팅</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=RPG,어드벤처&trademethod=교환">RPG,어드벤처</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=스포츠,레이싱&trademethod=교환">스포츠,레이싱</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션5&genre=전략,시뮬레이션,퍼즐&trademethod=교환">전략,시뮬레이션,퍼즐</a></li>
  				</ul>
				</div></td>
				
				<td><div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			ps4(교환)
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=액션,격투&trademethod=교환">액션,격투</a></li>
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=슈팅&trademethod=교환">슈팅</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=RPG,어드벤처&trademethod=교환">RPG,어드벤처</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=스포츠,레이싱&trademethod=교환">스포츠,레이싱</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=플레이스테이션4&genre=전략,시뮬레이션,퍼즐&trademethod=교환">전략,시뮬레이션,퍼즐</a></li>
  				</ul>
				</div></td>
				
				<td><div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			스위치(교환)
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=액션,격투&trademethod=교환">액션,격투</a></li>
    				<li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=슈팅&trademethod=교환">슈팅</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=RPG,어드벤처&trademethod=교환">RPG,어드벤처</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=스포츠,레이싱&trademethod=교환">스포츠,레이싱</a></li>
				    <li><a class="dropdown-item" href="categoryItem.jsp?platform=스위치&genre=전략,시뮬레이션,퍼즐&trademethod=교환">전략,시뮬레이션,퍼즐</a></li>
  				</ul>
				</div></td>
			</tr>
		</table>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <%--부트스트랩 javascript이용을위한 코드 --%>
</body>
</html>