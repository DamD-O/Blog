<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.BoardDao"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	BoardDao boardDao = new BoardDao();//dao객체 생성
	int boardNo =Integer.parseInt(request.getParameter("boardNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>	
<div class="container p-4 my-4 border border-dark" >
	<div class="p-2 my-1 bg-primary text-white"><h4>취미 삭제 페이지</h4></div>
	<div>
		<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-outline-info btn-block ">목록으로 돌아가기</a>
	</div>
	<form action="<%=request.getContextPath()%>/board/deleteBoardAction.jsp" method="post">
		<div>
			번호<input type="text" name="boardNo" value="<%=boardNo%>" readonly="readonly"class="form-control" > <!--번호를 읽기만 하게 -->
		</div>
		<div>
			비밀번호<input type="password" name="boardPw" class="form-control">
		</div>
		<div>
		<br>
			<button type="submit" class="btn btn-outline-danger">삭제</button>
		</div>
	</form>
</div>
</body>
</html>