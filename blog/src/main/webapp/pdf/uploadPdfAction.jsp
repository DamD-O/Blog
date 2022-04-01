<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	request.setCharacterEncoding("utf-8"); //인코딩
	
	String path= application.getRealPath("upload"); //application 변수 톰캣을 가르키는 변수
	System.out.println("path" + path);
	MultipartRequest multiReq = new MultipartRequest(request,path,1024*1024*100,"utf-8", new DefaultFileRenamePolicy()); 
	//값 가져오기
	String pdfPw = multiReq.getParameter("pdfPw");
	String writer = multiReq.getParameter("writer");
	String pdfOriginalName = multiReq.getOriginalFileName("pdf"); //파일 업로드 시 원본의 이름
	String pdfName = multiReq.getFilesystemName("pdf"); //new DefaultFileRenamePolicy() 객체를 통해 변경된 이름
	String pdfType = multiReq.getContentType("pdf");
	
	System.out.println("pdfPw:" + pdfPw);
	System.out.println("writer:" + writer);
	System.out.println("pdfOriginalName:" + pdfOriginalName);
	System.out.println("pdfName:" + pdfName);
	System.out.println("pdfType:" + pdfType);
	
	//파일 업로드의 경우 pdf만 허용
	if(pdfType.equals("application/pdf")){
		//db에 저장
		System.out.println("pdf db에 저장");
		PdfDao pdfDao = new PdfDao();
		Pdf pdf = new Pdf();
		pdf.setPdfName(pdfName);
		pdf.setPdfOriginalName(pdfOriginalName);
		pdf.setPdfType(pdfType);
		pdf.setPdfPw(pdfPw);
		pdf.setWriter(writer);
		pdfDao.uploadPdf(pdf); //메서드 구현
		
		response.sendRedirect(request.getContextPath()+"/pdf/pdfList.jsp");
		
		}else{
			System.out.println("PDF파일을 올려주세요");
			//잘못들어온 파일이므로 업로드된 파일 지우고 폼으로 이동
			File file = new File(path+"\\"+pdfName); //잘못된 파일을 불러오기
			file.delete(); //잘못된 파일 삭제
			response.sendRedirect(request.getContextPath()+"/pdf/uploadPdfForm.jsp");
			
		}
	
%>