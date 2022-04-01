<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.GuestbookDao" %>
<%
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo")); //요청값 받아오기

	//dao값 가져오기
	GuestbookDao guestbookDao = new GuestbookDao();
	Guestbook guestbook = new Guestbook();
	guestbook = guestbookDao.selectGuestbookOne(guestbookNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<h2>방명록 수정</h2>
	<form method="post" action="<%=request.getContextPath()%>/guestbook/updateGuestbookAction.jsp">
		<table class="form-group table table-striped">
			<tr class="table-info text-dark">
				<td>방명록 번호</td>
				<td>
					<input type="number" name="guestbookNo" readonly="readonly" value="<%=guestbook.getGuestbookNo()%>" class="form-control">
				</td>
			</tr>
			<tr class="table-info text-dark">
				<td>내용</td>
				<td><textarea name="guestbookContent" class="form-control"><%=guestbook.getGuestbookContent() %></textarea></td>
			</tr>
			<tr class="table-info text-dark">
				<td>비밀번호</td>
				<td><input type="password" name="guestbookPw" class="form-control"></td>
			</tr>
		</table>
		<div>
		<button type="submit" class="btn btn-outline-success">수정</button>
		<a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp" class="btn btn-outline-success">방명록으로 돌아가기</a>
		</div>
	</form>
</div>
</body>
</html>