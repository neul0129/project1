<%@page import="site.margaret.dto.BoardDTO"%>
<%@page import="site.margaret.dao.BoardDAO"%>
<%@page import="site.margaret.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	if(request.getMethod().equals("GET")) {		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String pageNum=request.getParameter("pageNum");
	
	
	String title=Utility.escapeTag(request.getParameter("title"));
	int boardStatus=0;//전달값이 없는 경우 : 일반글 -  0(초기값)   
	if(request.getParameter("secret")!=null) {//전달값이 있는 경우 : 비밀글 - 1
		boardStatus=Integer.parseInt(request.getParameter("secret"));
	}
	
	String boardContent=Utility.escapeTag(request.getParameter("boardContent"));
	
	int boardNo=BoardDAO.getDAO().selectNextNum();
	

	BoardDTO board=new BoardDTO();
	board.setBoardNo(boardNo);
	board.setId(loginMember.getId());
	board.setTitle(title);
	board.setBoardContent(boardContent);
	board.setBoardStatus(boardStatus);
	
	
	BoardDAO.getDAO().insertBoard(board);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=notice/question&work=question_list&pageNum="+pageNum+"';");
	out.println("</script>");
%>