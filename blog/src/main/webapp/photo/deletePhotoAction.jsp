<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.PhotoDao" %>
<%@page import="java.io.File"%>
<%
	//1.테이블 데이터 삭제 --> photoNo
	//2.upload폴더에 이미지 삭제 -->photoName
	//값가져오기
	int photoNo = Integer.parseInt(request.getParameter("photoNo"));
	String photoPw = request.getParameter("photoPw");
	System.out.println("번호:" +photoNo);
	System.out.println("비밀번호:" +photoPw);
	
	PhotoDao photoDao = new PhotoDao(); //메소드 생성
	String photoName = photoDao.selectPhotoName(photoNo); //사진이름 함수 호출
	
	//1.테이블 데이터 삭제
	int delRow = photoDao.deletePhoto(photoNo, photoPw);
	
	//2.폴더이미지 삭제
	if(delRow == 1){ //삭제 성공
		System.out.println("삭제 성공");
		String path = application.getRealPath("upload"); //프로젝트 안의 upload폴더 실제 경로
		File file = new File(path+"\\"+photoName);// 이미지 파일을 불러온다. java.io.File  
		file.delete(); //잘못된 파일 삭제
		response.sendRedirect(request.getContextPath()+"/photo/photoList.jsp"); //리스트로 이동
		
	}else{//삭제실패
		System.out.println("사진 삭제실패");
		response.sendRedirect(request.getContextPath()+"/photo/deletePhotoForm.jsp"); //리스트로 이동
	}
	
%>