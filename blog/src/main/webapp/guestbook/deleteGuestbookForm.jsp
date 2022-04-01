<%@page import="dao.GuestbookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo")); //요청값 받아오기
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
<h2>방명록 삭제</h2>
	<form method="post" action="<%=request.getContextPath()%>/guestbook/deleteGuestbookAction.jsp">
		<table class="form-group table table-striped">
			<tr class="table-info text-dark">
				<td>방명록 번호</td>
				<td>
					<input type="number" name="guestbookNo" readonly="readonly" value="<%=guestbookNo%>" class="form-control">
				</td>
				<td>비밀번호</td>
				<td><input type="password" name="guestbookPw" class="form-control"></td>
			</tr>
		</table>
		<div>
		<button type="submit" class="btn btn-danger">삭제</button>
		<a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp" class="btn btn-outline-success">방명록으로 돌아가기</a>
		</div>
	</form>
</div>
</body>
</html>