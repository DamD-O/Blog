<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import="dao.BoardDao" %>
<%
	BoardDao boardDao = new BoardDao();//dao객체 생성
	//값 가져오기, 숫자형 문자열은 정수(10진수)로 반환
	int boardNo = Integer.parseInt(request.getParameter("boardNo")); // 게시물 번호
	String boardPw = request.getParameter("boardPw"); //비밀번호
	
	//요청받은 값 가져와서 저장
	Board board = new Board(); //저장할 객체생성
	board.setBoardNo(boardNo); //번호
	board.setBoardPw(boardPw); //패스워드
	
	//디버깅
	int row =  boardDao.deleteBoard(boardNo, boardPw); //삭제 기능 가져오기?
	if(row == 0){ //삭제실패
		response.sendRedirect(request.getContextPath()+"/board/deleteBoardForm.jsp?boardNo=" + board.getBoardNo());
		System.out.println("삭제실패");
	}else if(row == 1){//삭제성공
		response.sendRedirect("./boardList.jsp");
		System.out.println("삭제된 행(row):" + row);
	}else{
		System.out.println("error");
	}
%>
