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
	<%@ include file="./header.jsp" %><%--include를 통해 헤더파일을 추가 --%>
	<h2 align="center">상품 등록(거래)</h2>
	<form method="post" action="upload.jsp" enctype="multipart/form-data"><%--인코딩타입을 multipart/form-data로 하여 이미지업로드--%>  
		<table align="center">
			<tr>
				<%--input태그에 placeholder를 사용하여 데이터를 받기전에 보이게할 텍스트 설정--%>
				<td style="width: 80px; height: 30px;" align="center"><font
					color='red'>*</font>상품이름</td>
				<td><input type="text" name="itemname" id="itemname"
					placeholder="상품이름 입력" required></td>
			</tr>
			<tr>
				<td style="width: 80px; height: 30px;" align="center"><font
					color='red'>*</font>가격</td>
				<td><input type="text" name="price" id="price"
					placeholder="가격 입력" required></td>
			</tr>
			<tr>
				<%--select를 이용하여 플랫폼과 장르선택 --%>
				<td style="width: 80px; height: 30px;" align="center"><font
					color='red'>*</font>카테고리</td>
				<td>
				<select id="platform" name="platform" size="1">
				<option value="">플랫폼선택</option>
				<option value="스위치">스위치</option>
				<option value="플레이스테이션5">플레이스테이션5</option>
				<option value="플레이스테이션4">플레이스테이션4</option>
				</select>
				
				<select id="genre" name="genre" size="1">
				<option value="">장르선택</option>
				<option value="액션,격투">액션,격투</option>
				<option value="슈팅">슈팅</option>
				<option value="RPG,어드벤처">RPG,어드벤처</option>
				<option value="스포츠,레이싱">스포츠,레이싱</option>
				<option value="전략,시뮬레이션,퍼즐">전략,시뮬레이션,퍼즐</option>
				</select>
				</td>
			</tr>
			<tr>
				<%--textarea를 이용하여 상품설명을 쓸수있는 영역설정--%>
				<td style="width: 80px; height: 30px;" align="center"><font
					color='red'>*</font>상품설명</td>
				<td style="word_wrap:break-word;  word-break:break-all;"><textarea
						name="content" id="content" rows="12" cols="52"
						placeholder="상품설명을 입력" required></textarea></td>
			</tr>
			<tr>
			<%--input태그의 file타입을 통해 상품의 사진을 업로드--%>
			<td colspan="2">사진업로드 <input type="file" name="upload1" size="50" required></td>
			</tr>
			<tr>
			<%--input태그의 submit타입을 통해 상품등록--%>
			<td colspan="2" align="center" >
				<input type="hidden" name="trademethod" id="trademethod" value="거래">
				<input type="submit" value="상품등록">
			</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>