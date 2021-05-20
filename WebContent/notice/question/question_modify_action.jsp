<%@page import="site.margaret.dao.BoardDAO"%>
<%@page import="site.margaret.dto.BoardDTO"%>
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

	int boardNo=Integer.parseInt(request.getParameter("boardNo"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	String title=Utility.escapeTag(request.getParameter("title"));
	int boardStatus=0; 
	if(request.getParameter("secret")!=null) {
		boardStatus=Integer.parseInt(request.getParameter("secret"));
	}
	
	String boardContent=Utility.escapeTag(request.getParameter("boardContent"));
	
	BoardDTO board=new BoardDTO();
	board.setBoardNo(boardNo);
	board.setId(loginMember.getId());
	board.setTitle(title);
	board.setBoardContent(boardContent);
	board.setBoardStatus(boardStatus);
	
	BoardDAO.getDAO().updateBoard(board);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/index.jsp?workgroup=notice/question&work=question_detail&boardNo="+boardNo+"&pageNum="
		+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
			
			
	

%>