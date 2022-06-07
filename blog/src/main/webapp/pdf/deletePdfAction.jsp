<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.PdfDao" %>
<%@page import="java.io.File"%>
<%
	int pdfNo = Integer.parseInt(request.getParameter("pdfNo"));
	String pdfPw = request.getParameter("pdfPw");
	System.out.println("번호:" +pdfNo);
	System.out.println("비밀번호:" +pdfPw);
	
	PdfDao pdfDao = new PdfDao();//메소드 생성
	String PdfName = pdfDao.selectPdfName(pdfNo); //이름 함수 호출
	
	//db데이터 삭제
	int delrow = pdfDao.deletePdf(pdfNo, pdfPw);
	
	//폴더 파일 삭제
	if(delrow ==1){
		System.out.println("삭제 성공");
		String path = application.getRealPath("upload"); //프로젝트 안의 upload폴더 실제 경로
		File file = new File(path+"\\"+PdfName);// 이미지 파일을 불러온다. java.io.File  
		file.delete(); //잘못된 파일 삭제
		response.sendRedirect(request.getContextPath()+"/pdf/pdfList.jsp"); //리스트로 이동
	}else{
		System.out.println("사진 삭제실패");
		response.sendRedirect(request.getContextPath()+"/photo/deletePdfForm.jsp"); //삭제폼으로 이동
	}
%>