<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container p-3 my-3 border border-dark">
	<h2>pdf 업로드</h2>
	<form action="<%=request.getContextPath()%>/pdf/uploadPdfAction.jsp" method="post" enctype="multipart/form-data">
		<table class="form-group table table-striped">
		<tr class="table-info text-dark">
				<td>pdf파일</td>
				<td><input type="file" name="pdf"></td>
				
				<td>비밀번호</td>
				<td><input type="password" name="pdfPw" class="form-control"></td>
				
				<td>작성자</td>
				<td><input type="text" name="writer" class="form-control"></td>
			</tr>
		</table>
		<div>
			<button type="submit" class="btn btn-outline-success">PDF 등록</button>
		<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp" class="btn btn-outline-success">목록으로 돌아가기</a>
		</div>
	</form>

</div>
</body>
</html>