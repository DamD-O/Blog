<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container p-3 my-3 border border-dark">
    <h2>BLOG</h2>
    <br>
	   <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#bordList">게시판</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#photo">사진첩</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#guestbook">방명록</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#pdf">PDF자료실</a>
	    </li>
	  </ul>
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="bordList" class="container tab-pane active"><br>
	       <jsp:include page="/board/boardList.jsp"/>
	    </div>
	    <div id="photo" class="container tab-pane fade"><br>
	      <jsp:include page="/photo/photoList.jsp" />
	    </div>
	    <div id="guestbook" class="container tab-pane fade"><br>
	      <jsp:include page="/guestbook/guestbookList.jsp" />
	    </div>
	    <div id="pdf" class="container tab-pane fade"><br>
          <jsp:include page="/pdf/pdfList.jsp"/>
        </div>
	  </div>
	</div>
</div>
</body>
</html>