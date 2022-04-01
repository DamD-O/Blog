<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.PhotoDao"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%
	PhotoDao photoDao = new PhotoDao(); //메소드생성
	
	int photoNo = Integer.parseInt(request.getParameter("photoNo"));
	
	Photo photo = photoDao.selectPhotoOne(photoNo);
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
	<!-- 상세보기 -->
		<div class="col-sm-9">
		<div class="container p-1 my-1 bg-primary text-white"><h4>사진 상세보기</h4></div>
		<div>
			<a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-outline-info btn-block btn-sm">목록으로 돌아가기</a> 		
		</div>
		<table class="table table-striped table-hover">
			<tr>
				<td>photo</td>
				<td>
					<img src="<%=request.getContextPath()%>/upload/<%=photo.getPhotoName()%>" style="max-width: 100%; height: auto;">
				</td>
			</tr>
			<tr>
				<td>photoNo</td>
				<td><%=photo.getPhotoNo()%></td>
			</tr>
			<tr>
				<td>photoName</td>
				<td><%=photo.getPhotoName()%></td>
			</tr>
			<tr>
				<td>photoOriginalName</td>
				<td><%=photo.getPhotoOriginalName()%></td>
			</tr>
			<tr>
				<td>photoType</td>
				<td><%=photo.getPhotoType()%></td>
			</tr>
			<tr>
				<td>photoPw</td>
				<td><%=photo.getPhotoPw()%></td>
			</tr>
			<tr>
				<td>createDate</td>
				<td><%=photo.getCreateDate()%></td>
			</tr>
			<tr>
				<td>updateDate</td>
				<td><%=photo.getUpdateDate()%></td>
			</tr>
		</table>
		<div class="btn-group ">
			<a href="<%=request.getContextPath() %>/photo/deletePhotoForm.jsp?photoNo=<%=photoNo%>" class="btn btn-outline-danger">삭제</a>
		</div>
		</div>
</div>
</body>
</html>