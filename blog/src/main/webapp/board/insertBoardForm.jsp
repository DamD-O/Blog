<%@page import="vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dao.BoardDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDao boardDao = new BoardDao();//dao객체 생성
	ArrayList<String> list = boardDao.selectCatecoryList("categoryName"); //dao-> 카테고리 목록 가져오기
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
	<!-- board 테이블에 category_name,board_title, board_content,board_pw 입력 폼 -->
	<div class="p-2 my-1 bg-primary text-white"><h4>취미 입력 페이지</h4></div>
	<div>
		<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-outline-info btn-block ">목록으로 돌아가기</a>
	</div>
	<form method="post" action="<%=request.getContextPath() %>/board/insertBoardAction.jsp">
			<table class="table table-striped">
				<tr>
					<td>categoryName</td>
					<td>
						<select name="categoryName" class="custom-select">
							<%
								for(String s : list){
							%>
								<option value="<%=s%>"><%=s%></option>
							<%		
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>boardTitle</td>
					<td>
						<input name="boardTitle" type="text" class="form-control">
					</td>
				</tr>
				<tr>
					<td>boardContent</td>
					<td>
						<textarea name="boardContent" rows="5" cols="80" class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<td>boardPw</td>
					<td>
						<input name="boardPw" type="password" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-outline-success">Board 입력</button>
					</td>
				</tr>
			</table>
	</form>
</div>
</body>
</html>