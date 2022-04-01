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
	
	Pdf pdf = new Pdf();//객체생성
	PdfDao pdfDao = new PdfDao();//dao메소드 생성
	ArrayList<Pdf> list = pdfDao.selectPdfList(beginRow, rowPerPage);
	
	int lastpage = 0;
	int totalCount = pdfDao.selectPdfTotalRow();
	lastpage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); 
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
<!-- 메인메뉴 -->
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<!-- include시 컨텍스명(프로젝트이름)을 명시하지 않는다. -->
<!-- 메인메뉴 끝 -->
<h2 class="text-left font-weight-bold">pdf 목록</h2>
	<a href="<%=request.getContextPath() %>/pdf/uploadPdfForm.jsp" class="btn btn-outline-success btn-block">pdf 추가하기</a>
	<table class="table table-striped table-hover">
		<thead>
				<tr>
					<th>pdfName</th>
				</tr>
		</thead>
		<tbody>
			<%
				for(Pdf p : list) { 
			%>
			
			<tr>
				<td>
				<a href="<%=request.getContextPath()%>/upload/<%=p.getPdfName()%>"download><%=p.getPdfName()%></a>
				</td>
				<td class="btn-group ">
				<a href="<%=request.getContextPath() %>/pdf/deletePdfForm.jsp?pdfNo=<%=p.getPdfNo()%>" class="btn btn-outline-danger">삭제</a>
				</td>
			</tr>
			<%		
				}
			%>
		</tbody>
	
	</table>
	<div class="btn-group">
			<%
				if(currentPage >1){ //현재페이지가 1이면 이전페이지가 존재해서는 안된다
			%>
				<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-info">이전</a> 		
			<%	
				}
			%>
				<!-- 전체 행  마지막 페이지 알아내기
					마지막 페이지 = 전체행 / rowPerPage -->
			<%
				if(currentPage <lastpage){
			%>
				<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-info">다음</a>
			<% 		
				}
			%>		
				<!-- 다음페이지로 넘어가기 / 세부카테고리 리스트에서도 다음페이지 넘어가게 -->
	</div>
</div>
</body>
</html>