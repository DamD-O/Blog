<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.GuestbookDao" %>
<%

	request.setCharacterEncoding("utf-8");  //인코딩
	
	GuestbookDao guestbookDao = new GuestbookDao(); //메소드생성
	//요청한 값 가져오기
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo"));
	String guestbookContent = request.getParameter("guestbookContent");
	String guestbookPw = request.getParameter("guestbookPw");
	System.out.println("번호:" +guestbookNo);
	System.out.println("방명록:" + guestbookContent);
	System.out.println("비밀번호:"+guestbookPw);
	
	//요청해서 받은 값 가공해서 하나의 변수로 묶기
	Guestbook guestbook = new Guestbook();
	guestbook.setGuestbookNo(guestbookNo);
	guestbook.setGuestbookContent(guestbookContent);
	guestbook.setGuestbookPw(guestbookPw);
	
	guestbookDao.updateGuestbook(guestbook); //dao 수정하는 함수호출
	
	response.sendRedirect(request.getContextPath()+"/guestbook/guestbookList.jsp");//list페이지로 이동
%>
