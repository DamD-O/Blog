<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.PdfDao"%>
<%@ page import="vo.*" %>
<%
	int pdfNo =Integer.parseInt(request.getParameter("pdfNo")); //요청값 받아오기
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
<h2>PDF 삭제</h2>
	<form method="post" action="<%=request.getContextPath()%>/pdf/deletePdfAction.jsp">
		<table class="form-group table table-striped">
			<tr class="table-info text-dark">
				<td>PDF 번호</td>
				<td>
					<input type="number" name="pdfNo" readonly="readonly" value="<%=pdfNo%>" class="form-control">
				</td>
				<td>비밀번호</td>
				<td><input type="password" name="pdfPw" class="form-control"></td>
			</tr>
		</table>
	<div>
		<button type="submit" class="btn btn-danger">삭제</button>
		<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp" class="btn btn-outline-success">목록으로 돌아가기</a>
	</div>
	</form>

</div>
</body>
</html>