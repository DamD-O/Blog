<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.PhotoDao"%>
<%@ page import="vo.*" %>
<%
	int photoNo = Integer.parseInt(request.getParameter("photoNo")); //요청값 받아오기
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
<h2>사진 삭제</h2>
	<form method="post" action="<%=request.getContextPath()%>/photo/deletePhotoAction.jsp">
		<table class="form-group table table-striped">
			<tr class="table-info text-dark">
				<td>사진 번호</td>
				<td>
					<input type="number" name="photoNo" readonly="readonly" value="<%=photoNo%>" class="form-control">
				</td>
				<td>비밀번호</td>
				<td><input type="password" name="photoPw" class="form-control"></td>
			</tr>
		</table>
	<div>
		<button type="submit" class="btn btn-danger">삭제</button>
		<a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-outline-success">사진첩으로 돌아가기</a>
	</div>
	</form>

</div>
</body>
</html>