<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.GuestbookDao" %>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");  
	
	GuestbookDao guestbookDao = new GuestbookDao(); //객체생성
	//요청한 값 가져오기
	String guestbookContent = request.getParameter("guestbookContent");
	String writer = request.getParameter("writer");
	String guestbookPw = request.getParameter("guestbookPw");
	System.out.println("방명록:" + guestbookContent);
	System.out.println("글쓴이:" +writer);
	System.out.println("비밀번호:"+guestbookPw);
	
	//요청해서 받은 값 가공해서 하나의 변수로 묶기
	Guestbook guestbook = new Guestbook();
	guestbook.setGuestbookContent(guestbookContent);
	guestbook.setWriter(writer);
	guestbook.setGuestbookPw(guestbookPw);
	
	guestbookDao.insertGuestbook(guestbook); //dao 입력하는 함수호출
		
	response.sendRedirect(request.getContextPath()+"/guestbook/guestbookList.jsp");//list페이지로 이동
%>
