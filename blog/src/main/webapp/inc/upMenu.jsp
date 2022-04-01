<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>

<!-- 다른 페이지의 부분으로 사용되는 페이지 -->
<div >
	<ul class="nav justify-content-end bg-info ">
		<li class="nav-item ">
			<a href="<%=request.getContextPath()%>/index.jsp" class="nav-link text-white">Home</a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="nav-link text-white" >게시판</a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="nav-link text-white">사진</a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp" class="nav-link text-white">방명록</a>
		</li>
		<li class="nav-item">
			<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp"  class="nav-link text-white">PDF자료실</a>
   		</li>
     </ul>
</div>