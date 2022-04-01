<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%
	BoardDao boardDao = new BoardDao(); //dao메소드 생성
	
	/************페이지 다음or이전버튼***********/
	//boardList 페이지 시작시 최근 10개의 목록을 보여주고 1page로 설정
	int currentPage = 1; //현재페이지의 기본값이 1페이지
	if(request.getParameter("currentPage") != null){ //이전, 다음 링크를통해서 들어왔다면 
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // 그페이지를 현재페이지로
	}
	System.out.println("currentPage ->" + currentPage); //디버깅
	
	//이전 다음 링크에서 null값을 못넘겨서 null을 공백으로 치환 ->코드처리
	String categoryName = "" ;
	if(request.getParameter("categoryName") != null){
		categoryName = request.getParameter("categoryName");
	}
	System.out.println(request.getParameter("categoryName")); //디버깅
	
	//페이지 바뀌면 끝이 아니고, 가지고 오는 데이터가 변경되야된다.
	int rowPerPage = 10; //페이지당 행 개수
	//현재 페이지가 변경되면 biginRow도 변경된다. --> 가져오는 데이터가 변경된다.
	int beginRow = (currentPage -1)*rowPerPage; //다음페이지로 넘어가기전 마지막행? ex) 2페이지 : 이전 페이지 마지막 행이 10번째
	ArrayList<Board> list = boardDao.selectBoardListByPage(beginRow, rowPerPage);
	
	int lastPage = 0; //마지막 페이지
	int totalRow = boardDao.selectBoardTotalRow();
	
	// 다음페이지
	if(totalRow % rowPerPage == 0){
		lastPage = totalRow / rowPerPage;
	}else{
		lastPage = (totalRow / rowPerPage) +1;
	}
	
	////***** boardList(게시글 목록)********/
	ArrayList<Board> boardList = boardDao.boardList(beginRow, rowPerPage, categoryName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container p-3 my-3 border border-dark" >
<!-- 메인메뉴 -->
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
<!-- 메인메뉴 끝 -->
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
		<!-- 게시글 리스트 -->
		<div class="col-sm-9">
		<div class="container p-2 my-1 bg-primary text-white"><h4>취미 목록</h4></div>
		<a href="<%=request.getContextPath() %>/board/insertBoardForm.jsp" class="btn btn-outline-success btn-block">취미 리스트 추가하기</a>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>categoryName</th>
					<th>boardTitle</th>
					<th>createDate</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Board b : boardList) { //boardList 읽어오기
				%>
						<tr>
							<td><%=b.getCategoryName()%></td>
							<td><a href="<%=request.getContextPath()%>/board/boardOne.jsp?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle()%></a></td>
							<td><%=b.getCreateDate()%></td>
						</tr>
				<%		
					}
				%>
			</tbody>
		</table>
			<div class="btn-group ">
			<!-- 페이지가 if 10페이지였다면 이전:9page, 다음:11page -->
			<%
				if(currentPage >1){ //현재페이지가 1이면 이전페이지가 존재해서는 안된다
			%>
				<a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage-1%>&categoryName=<%=categoryName%>" class="btn btn-outline-info">이전</a> 		
			<%	
				}
			%>
				<!-- 전체 행  마지막 페이지 알아내기
					마지막 페이지 = 전체행 / rowPerPage -->
			<%
				if(currentPage <lastPage){
			%>
				<a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage+1%>&categoryName=<%=categoryName%>" class="btn btn-outline-info">다음</a>
			<% 		
				}
			%>		
				<!-- 다음페이지로 넘어가기 / 세부카테고리 리스트에서도 다음페이지 넘어가게 -->
			</div>
		</div>
	</div>
</div>
</body>
</html>