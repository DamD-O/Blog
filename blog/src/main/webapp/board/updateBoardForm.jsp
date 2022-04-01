<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.BoardDao"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	BoardDao boardDao = new BoardDao(); //dao메소드 생성
	
	//넘어온 번호 값 가져오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	
	//수정전 값 
	Board board = boardDao.selectBoardOne(boardNo);
	
	//카테고리 리스트 받아오기
	ArrayList<String> categoryList = boardDao.selectCatecoryList("categoryName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container p-3 my-3 border border-dark" >
	<div class="p-2 my-1 bg-primary text-white"><h4>취미 수정 페이지</h4></div>
	<div>
		<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-outline-info btn-block">목록으로 돌아가기</a>
	</div>
	
	<form method="post" action="<%=request.getContextPath()%>/board/updateBoardAction.jsp">
	<table class="table table-striped">
			<tr>
				<td>boardNo</td>
				<td>
					<input type="number" name="boardNo" readonly="readonly" value="<%=board.getBoardNo()%>" class="form-control">
				</td>
			</tr>
			<tr>
				<td>categoryName</td>
				<td>
					<select name="categoryName" class="custom-select">
						<%
							for(String s: categoryList){
								if(s.equals("categoryName")){
						%>
								<option selected="selected" value="<%=s%>" ><%=s%></option>	
						<% 			
								}else{
						%>
							<option value="<%=s%>"><%=s%></option>	
						<% 			
								}
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>boardTitle</td>
				<td>
					<input type="text" name="boardTitle" value="<%=board.getBoardTitle()%>" class="form-control">
				</td>
			</tr>
			<tr>
				<td>boardContent</td>
				<td>
					<textarea name="boardContent" rows="5" cols="50" class="form-control"><%=board.getBoardContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td>boardPw</td>
				<td><input type="password" name="boardPw" class="form-control" value="<%=board.getBoardPw()%>"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-outline-success">수정</button>
	
	</form>
</div>
</body>
</html>