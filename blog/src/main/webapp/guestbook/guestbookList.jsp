<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import="vo.Guestbook" %>
<%@ page import="dao.GuestbookDao" %>

<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage =5; //한 페이지당 몇행 나올지
	int beginRow = (currentPage-1)*rowPerPage; //처음시작하는 행의 개수
	GuestbookDao guestbookDao = new GuestbookDao();	
	ArrayList<Guestbook> list = guestbookDao.selectGuestbookListByPage(beginRow, rowPerPage);

	int lastPage =0; //마지막페이지
	int totalCount = guestbookDao.selectGuestbookTotalRow();
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); 
	//5.0/2.0 =2.5 => 3.0
	//4.0 /2.0 = 2.0 -> 2.0
	/* lastPage = totalCount / rowPerPage;
	if(totalCount % rowPerPage != 0)
	{
		lastPage++;
	} */
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	
<div class="container p-3 my-3 border border-dark">
<!-- 메인메뉴 -->
		<jsp:include page="/inc/upMenu.jsp"></jsp:include>
		<!-- include시 컨텍스명(프로젝트이름)을 명시하지 않는다. -->
	<!-- 메인메뉴 끝 -->
<% 
	for(Guestbook g : list) {
%>
		<table class=" table table-striped">
			<tr class="table-primary text-dark">
				<td><%=g.getWriter()%></td>
				<td><%=g.getCreateDate()%></td>
			</tr>
			<tr class="table-info text-dark">
				<td colspan="2"><%=g.getGuestbookContent()%></td>
			</tr>
			<tr  class="btn-group table-light">
			<td>
				<a href="<%=request.getContextPath()%>/guestbook/updateGuestbookForm.jsp?guestbookNo=<%=g.getGuestbookNo()%>" class="btn btn-outline-success">수정</a>
				<a href="<%=request.getContextPath()%>/guestbook/deleteGuestbookForm.jsp?guestbookNo=<%=g.getGuestbookNo()%>" class="btn btn-outline-danger">삭제</a>
			</td>
			</tr>
		</table>
		
<%	
	}
	
	if(currentPage > 1) {
%>
		<a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-info">이전</a>
<%		
	}
	
	if(currentPage < lastPage) {
%>
		<a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-info">다음</a>
<%
	}
%>
<hr>
</div>
<!--방명록 입력 -->
<div class="container p-3 my-3 border border-dark">
<h2>방명록 입력</h2>
	<form method="post" action="<%=request.getContextPath()%>/guestbook/insertGuestbookAction.jsp">
	
		<table class="form-group table table-striped">
			<tr class="table-info text-dark">
				<td>글쓴이</td>
				<td><input type="text" name="writer" class="form-control"></td>
				<td>비밀번호</td>
				<td><input type="password" name="guestbookPw" class="form-control"></td>
			</tr>
			<tr class="table-info text-dark">
				<td colspan="4"><textarea name="guestbookContent" rows="2" cols="60" class="form-control"></textarea></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-primary">입력</button>
	</form>
</div>
</body>
</html>