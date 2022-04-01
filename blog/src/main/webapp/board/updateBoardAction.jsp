<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@page import="dao.BoardDao"%>
<%
	BoardDao boardDao = new BoardDao(); //dao메소드 생성
	request.setCharacterEncoding("utf-8"); //인코딩
	
	//값 가져오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));//번호
	String categoryName = request.getParameter("categoryName"); //이름
	String boardTitle = request.getParameter("boardTitle"); //제목
	String boardContent = request.getParameter("boardContent"); //내용
	String boardPw = request.getParameter("boardPw");//비밀번호
	String updateDate = request.getParameter("updateDate");//수정날짜
	
	//요청받아서 가지고 온 값 저장
	Board board = new Board();
	board.setBoardNo(boardNo);//번호
	board.setCategoryName(categoryName); //카테고리 이름
	board.setBoardTitle(boardTitle); //제목
	board.setBoardContent(boardContent); //내용
	board.setBoardPw(boardPw);//비밀번호
	board.setUpdateDate(updateDate); //수정날짜
	
	int row = boardDao.updateForm(board); //update -> dao가져오기
	
	if(row ==0){ //업데이트된 행이 없을때
		response.sendRedirect(request.getContextPath()+"/board/updateBoardForm.jsp?boardNo=" + board.getBoardNo());
		System.out.println("수정실패");
	}else if(row == 1){ //업데이트 행이 있을때
		response.sendRedirect("./boardOne.jsp?boardNo="+board.getBoardNo());
		System.out.println("수정된 행(row):" + row);
		System.out.println("categoryName:" + categoryName);
	}else{
		System.out.println("error");
	}
	
	
	
%>
