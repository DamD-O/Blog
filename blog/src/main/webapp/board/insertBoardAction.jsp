<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.BoardDao"%>
<%
	/*
	INSERT INTO board(category_name, board_title,board_content,board_pw,create_date,update_date) VALUES(?,?,?,?,NOW(),NOW());
	*/
	request.setCharacterEncoding("utf-8");  //인코딩
	
	//DAO객체생성
	BoardDao boardDao = new BoardDao();
	
	//http가 요청한 파라미터 값 얻어오기
	String categoryName = request.getParameter("categoryName");
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String boardPw = request.getParameter("boardPw");
	System.out.println("categoryName ->" + categoryName);
	System.out.println("boardTitle ->" + boardTitle);
	System.out.println("boardContent ->" + boardContent);
	System.out.println("boardPw ->" + boardPw);

	//요청해서 넘겨진  값을 가공해서 하나의 변수로 묶기
	Board board = new Board();
	board.setCategoryName(categoryName);//카테고리 이름
	board.setBoardTitle(boardTitle); //제목
	board.setBoardContent(boardContent); //내용
	board.setBoardPw(boardPw); //비밀번호
	
	boardDao.insertBoard(board); //dao입력하는 함수 호출
	
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");//list페이지로 이동
	
%>