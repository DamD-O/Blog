<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 5;//한 페이지당 몇행 나올지
	int beginRow = (currentPage-1)*rowPerPage;

	PhotoDao photoDao = new PhotoDao();//dao메소드 생성
	ArrayList<Photo> list = photoDao.selectPhotoListByPage(beginRow, rowPerPage);
	
	int lastPage =0; //마지막페이지
	int totalCount = photoDao.selectPhotoTotalRow();
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>photoList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container p-3 my-3 border border-dark">
<!-- 메인메뉴 -->
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<!-- include시 컨텍스명(프로젝트이름)을 명시하지 않는다. -->
<!-- 메인메뉴 끝 -->
	<h2 class="text-left font-weight-bold">사진 목록</h2>
	<a href="<%=request.getContextPath() %>/photo/insertPhotoForm.jsp" class="btn btn-outline-success btn-block">사진 추가하기</a>
	<table class="table table-striped table-hover">
	<tr>
	<!-- 
		td의 개수가 5의 배수가 되도록
		list.size() 가 1~5 td:5개
		list.size()가 6~10 td:10개
	-->
	<%
		System.out.println("사진 개수: "+list.size() + "개");
	
		int endIdx =(((list.size()-1)/5)+1)*5; //5의 배수가 되어야함.
		System.out.println("10개: "+endIdx);
		//for(Photo p : list){ //size()만큼 반복되므로 5의배수가 아닐수도 있다.
		for(int i=0; i < endIdx; i++){ //01234-> 0123456789
			//새로운 tr 추가
			if(i !=0 &&i%5 == 0){ //5일때(0 제외한 5의 배수일때)
	%>
	</tr>
	<tr>
	<%
			}
		
			if(i<list.size()){
	%>
		<td>
			<a href="<%=request.getContextPath()%>/photo/photoOne.jsp?photoNo=<%=list.get(i).getPhotoNo()%>">
				<img src="<%=request.getContextPath()%>/upload/<%=list.get(i).getPhotoName()%>" width="100" height="100">
			</a>
		</td>
	<% 	
		}else{
	%>
		<td>&nbsp;</td>
	<%
		}	
	}	
%>
			
			
			
	</tr>
	</table>
	<div class="btn-group">
			<!-- 페이지가 if 10페이지였다면 이전:9page, 다음:11page -->
			<%
				if(currentPage >1){ //현재페이지가 1이면 이전페이지가 존재해서는 안된다
			%>
				<a href="<%=request.getContextPath()%>/photo/photoList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-info">이전</a> 		
			<%	
				}
			%>
				<!-- 전체 행  마지막 페이지 알아내기
					마지막 페이지 = 전체행 / rowPerPage -->
			<%
				if(currentPage <lastPage){
			%>
				<a href="<%=request.getContextPath()%>/photo/photoList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-info">다음</a>
			<% 		
				}
			%>		
				<!-- 다음페이지로 넘어가기 / 세부카테고리 리스트에서도 다음페이지 넘어가게 -->
	</div>
	
</div>
</body>
</html>