<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container p-3 my-3 border border-dark">
	<h1 class="font-weight-bold text-center" style="padding: 10px">HOME</h1>
	<div class="card-deck"  >
		<div class="card" >
			<img class="card-img-top" src="<%=request.getContextPath()%>/img/board.png" alt="Card image">
			<div class="card-body">
			<h4 class="card-title">취미 목록 게시판</h4>
			<p class="card-text">hobbies list</p>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-outline-secondary">게시판</a>
			</div>
		</div>
		<div class="card">
			<img class="card-img-top" src="<%=request.getContextPath()%>/img/photo.png" alt="Card image">
			<div class="card-body">
			<h4 class="card-title">사진 목록</h4>
			<p class="card-text">photo list</p>
			<a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-outline-secondary">사진첩</a>
			</div>
		</div>
		<div class="card">
			<img class="card-img-top" src="<%=request.getContextPath()%>/img/guestbook.png" alt="Card image">
			<div class="card-body">
			<h4 class="card-title">방명록 목록</h4>
			<p class="card-text">guest book list</p>
			<a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp" class="btn btn-outline-secondary">방명록</a>
			</div>
		</div>
		<div class="card">
			<img class="card-img-top" src="<%=request.getContextPath()%>/img/pdf.png" alt="Card image">
			<div class="card-body">
			<h4 class="card-title">PDF 업로드</h4>
			<p class="card-text">upload .PDF</p>
			<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp" class="btn btn-outline-secondary">PDF자료실</a>
			</div>
		</div>
		
	</div>
</div>

</body>
</html>