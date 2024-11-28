<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String realFolder= request.getServletContext().getRealPath("/image");   //storage 폴더의 실제 주소
	System.out.println("실제폴더"+realFolder);
	//업로드
	MultipartRequest multi = new MultipartRequest(request,realFolder,5*1024*1024,"UTF-8", new DefaultFileRenamePolicy());  //똑같은 이름의 파일이 들어오면 파일 뒤에 번호를 붙여줌

	//사용자가 직접 저장한 파일 명을 반환
	String originalFileName1=multi.getOriginalFileName("upload1");    
    //기존에 업로드한 파일들 중에 이름이 겹칠 경우 뒤에 번호가 붙는데, 그렇게 변환된 파일 이름을 반환
    String fileName1 = multi.getFilesystemName("upload1");   
    //서버상에 업로드된 파일에 대한 파일 객체를 반환한다. 
	File file1= multi.getFile("upload1");
	
	long fileSize1= 0;
	if(file1!=null)fileSize1=file1.length();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="itemDAO" class="item.ItemDAO" />
	<%
		//item번호 가져오기
		int itemnum = itemDAO.count();
	
		//item이름 가져오기
		String itemname = multi.getParameter("itemname");
		
		//가격 가져오기
		String price = null;
		price = multi.getParameter("price");
		
		//id 가져오기
		session = request.getSession();
		String id = (String)session.getAttribute("ID");
		
		//카테고리 코드 가져오기
		String platform = multi.getParameter("platform");
		String genre = multi.getParameter("genre");
		int categorycode = itemDAO.categorycode(platform, genre);
		if(categorycode == -1){
			%>
				<script>
					alert("카테고리를 선택해주세요")
					history.go(-1)
				</script>
			<%
				}
		
		//사진 이름 가져오기
		String imgname = fileName1;
		
		//설명 가져오기
		String contents = multi.getParameter("content");
		
		//거래 방식 가져오기
		String trademethod = multi.getParameter("trademethod");
		
		String exchangeitemname = null;
		
		if(trademethod.equals("교환")){
			exchangeitemname = multi.getParameter("exchangeitemname");
		}
		
		try{
			int result = itemDAO.upload(itemnum, itemname, price, id, categorycode, imgname, contents, trademethod, exchangeitemname);
			out.println(result);
			if(result == 1){
	%>
		<script>
			alert("상품등록에 성공했습니다.")
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