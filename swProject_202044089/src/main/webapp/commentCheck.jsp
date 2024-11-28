<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="commentinfoDAO" class="commentinfo.CommentinfoDAO" />
	<%
		String sitemnum = request.getParameter("itemnum");
		int itemnum = Integer.parseInt(sitemnum);
		int commentnum = commentinfoDAO.getCommentNum();
		
		String id = request.getParameter("myid");
		if(id.equals("guest")){
	%>
		<script>
			alert("로그인 해주세요.")
			history.go(-1)
		</script>
	<%
		}else{
		String comment = request.getParameter("comment");
		
		int result = commentinfoDAO.commentAdd(commentnum, id, itemnum, comment);
		if(result == -1){
	%>
		<script>
			alert("댓글등록 실패.")
			history.go(-1)
		</script>
	<%
		}else if(result == 1){
	%>
		<jsp:forward page="showItem.jsp?itemnum=<%=sitemnum %>"/>
	<%
		}
		}
	%>
</body>
</html>