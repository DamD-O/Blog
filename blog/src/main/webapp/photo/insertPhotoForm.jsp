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
	<h1>사진 등록</h1>
	<!-- 1)form태그 안에 값을 넘기는 기본값(enctype속성)은 문자열
	2)파일을 못넘김 -> 기본값변경
	3)기본값을 "multipart/form-data"변경하면 기본값이 문자열에서 바이너리(이진수)로 변경된다. 
	4)같은 폼안에 모든 값이 바이너리로 넘어간다. 글자를 넘겨받는 request.getParmeter사용 못함
	5)복잡한 코드를 통해서만 바이너리 내용을 넘겨 받을수 있다
	6)외부 라이브러리를 사용해서 복잡한 코드 간단하게 구현-->
	<form action="<%=request.getContextPath()%>/photo/insertPhotoAction.jsp" method="post" enctype="multipart/form-data">
		<table class="form-group table table-striped">
			<tr class="table-info text-dark">
				<td>사진파일</td>
				<td><input type="file" name="photo"></td>
				
				<td>비밀번호</td>
				<td><input type="password" name="photoPw" class="form-control"></td>
				
				<td>작성자</td>
				<td><input type="text" name="writer" class="form-control"></td>
			</tr>
		</table>
		<div>
		<button type="submit" class="btn btn-outline-success">사진 등록</button>
		<a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-outline-success">사진첩으로 돌아가기</a>
		</div>
	</form>
</div>
</body>
</html>