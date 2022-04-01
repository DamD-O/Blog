<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@page import="dao.BoardDao"%>
<%
	BoardDao boardDao = new BoardDao(); //dao메소드 생성
	
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));//게시물번호 값 가져오기
	System.out.println(boardNo + ": boardNo");//디버깅
	
	//boardOne///
	Board board = boardDao.selectBoardOne(boardNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardOne</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container p-3 my-3 border border-dark" >
	<!-- category별 게시글 링크 메뉴 -->
	<div class="row ">
		<div class="col-sm-3">
		<ul class="list-group border border-primary">
					<li class="list-group-item active">카테고리 목록</li>
			<%
				for(HashMap<String, Object> m : boardDao.categoryList()) { //categoryList 값 읽어오기
			%>
					<li class="list-group-item">
						<!-- <%=request.getContextPath()%> : 프로젝트명 가져오기 --> 
						<a href="<%=request.getContextPath()%>/board/boardList.jsp?categoryName=<%=m.get("categoryName")%>">
						<%=m.get("categoryName")%><span class="badge badge-pill badge-primary"><%=m.get("cnt")%></span>
						</a>
					</li>
			<%		
				}
			%>
		</ul>
		</div>
		<!-- 상세보기 -->
		<div class="col-sm-9">
		<div class="container p-1 my-1 bg-primary text-white"><h4>취미 상세보기</h4></div>
		<div>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-outline-info btn-block btn-sm">목록으로 돌아가기</a> 		
		</div>
		<table class="table table-striped table-hover">
			<tr>
				<td>boardNo</td>
				<td><%=board.getBoardNo()%></td>
			</tr>
			<tr>
				<td>categoryName</td>
				<td><%=board.getCategoryName()%></td>
			</tr>
			<tr>
				<td>boardTitle</td>
				<td><%=board.getBoardTitle()%></td>
			</tr>
			<tr>
				<td>boardContent</td>
				<td><%=board.getBoardContent() %></td>
			</tr>
			<tr>
				<td>createDate</td>
				<td><%=board.getCreateDate()%></td>
			</tr>
			<tr>
				<td>updateDate</td>
				<td><%=board.getUpdateDate()%></td>
			</tr>
		</table>
		<div class="btn-group ">
			<a href="<%=request.getContextPath() %>/board/updateBoardForm.jsp?boardNo=<%=boardNo%>" class="btn btn-outline-success">수정</a>
			<a href="<%=request.getContextPath() %>/board/deleteBoardForm.jsp?boardNo=<%=boardNo%>" class="btn btn-outline-danger">삭제</a>
		</div>
		</div>
	</div>
</div>
</body>
</html>