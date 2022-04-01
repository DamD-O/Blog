<%@page import="dao.PhotoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="vo.*" %>
<%@page import="java.io.File"%>
<%

	/*
	form태그의 enctype="multipart/form-data"로 넘겨져서 request.getParameter() API를 사용할수 없다.
	
	String writer = request.getParameter("writer");
	System.out.println("writer: " + writer);
	String photo = request.getParameter("photo");
	System.out.println("photo: " + photo);
	request.getParameter() API대신 다른 API를 사용해야되는데 복잡함
	--> 따라서, request를 단순하게 사용하게 해주는 cos.jar같은 API(외부라이브러리) 사용
	*/
	request.setCharacterEncoding("utf-8"); //인코딩
	//DefaultFileRenamePolicy rp = new DefaultFileRenamePolicy();
	String path= request.getRealPath("upload"); //application 변수 톰캣을 가르키는 변수
	System.out.println("path" + path);
	MultipartRequest multiReq = new MultipartRequest(request,path,1024*1024*100,"utf-8", new DefaultFileRenamePolicy()); 
	//2^10 byte = 1kbyte 1024byte = 1kbyte
	//2^10 kbyte = 1mbyte
	//100 mbyte =1024*1024*100byte =104857600byte 곱셈을 계산해서 코딩하면 가독성이 떨어진다.
	
	String photoPw = multiReq.getParameter("photoPw");
	String writer = multiReq.getParameter("writer");
	//<input type="file" name="photo">처리
	String photoOriginalName = multiReq.getOriginalFileName("photo"); //파일 업로드 시 원본의 이름
	String photoName = multiReq.getFilesystemName("photo"); //new DefaultFileRenamePolicy() 객체를 통해 변경된 이름
	String photoType = multiReq.getContentType("photo");
	
	
	System.out.println("photoPw:" + photoPw);
	System.out.println("writer:" + writer);
	System.out.println("photoOriginalName:" + photoOriginalName );
	System.out.println("photoName:" + photoName);
	System.out.println("photoType:" + photoType);
	
	//파일 업로드의 경우 100Mbyte 이하의 image/gif, image/png, image/jpeg 3가지 이미지만 허용
	if(photoType.equals("image/gif") ||photoType.equals("image/png")||photoType.equals("image/jpeg")){
		//db에 저장
		System.out.println("사진 db에 저장");
		PhotoDao photoDao = new PhotoDao();
		Photo photo = new Photo();
		photo.setPhotoName(photoName);
		photo.setPhotoOriginalName(photoOriginalName);
		photo.setPhotoType(photoType);
		photo.setPhotoPw(photoPw);
		photo.setWriter(writer);
		photoDao.insertPhoto(photo); //메서드 구현
		
		response.sendRedirect(request.getContextPath()+"/photo/photoList.jsp");
		
	}else{
		System.out.println("이미지 파일을 올려주세요");
		//잘못들어온 파일이므로 업로드된 파일 지우고 폼으로 이동
		File file = new File(path+"\\"+photoName); //잘못된 파일을 불러오기
		file.delete(); //잘못된 파일 삭제
		response.sendRedirect(request.getContextPath()+"/photo/insertPhotoForm.jsp");
	}	
%>
