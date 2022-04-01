<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.GuestbookDao" %>
<%
	GuestbookDao guestbookDao = new GuestbookDao(); //메소드생성
	
	//값 가져오기, 숫자형 문자열은 정수(10진수)로 반환
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo")); //번호
	String guestbookPw = request.getParameter("guestbookPw"); //비밀번호
	System.out.println("번호:" +guestbookNo);
	System.out.println("비밀번호:"+guestbookPw);
	
	//요청해서 받은 값 가공해서 하나의 변수로 묶기
	Guestbook guestbook = new Guestbook();
	guestbook.setGuestbookNo(guestbookNo);
	guestbook.setGuestbookPw(guestbookPw);
	
	guestbookDao.deleteGuestbook(guestbookNo, guestbookPw); //dao 삭제하는 함수호출
	
	response.sendRedirect(request.getContextPath()+"/guestbook/guestbookList.jsp");//list페이지로 이동
	
%>
