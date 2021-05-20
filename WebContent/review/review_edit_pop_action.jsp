<%@page import="site.margaret.dao.ShopOrderDAO"%>
<%@page import="site.margaret.util.Utility"%>
<%@page import="site.margaret.dto.BoardDTO"%>
<%@page import="site.margaret.dao.BoardDAO"%>
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

	// 전달값을 반환받아 저장
	String title=Utility.escapeTag(request.getParameter("title"));
	int section=1;// 전달값이 없는 경우 : 리뷰 - 1(초기값)   
	
	// review_edit_pop.jsp의 REVIEW_GRADE를 전달받음
	String reviewGrade=request.getParameter("REVIEW_GRADE");
	String boardContent=Utility.escapeTag(request.getParameter("boardContent"));
	int productNo=Integer.parseInt(request.getParameter("productNo"));

	
	// 시퀀스 따오는거
	int boardNo=BoardDAO.getDAO().selectNextNum();
	
	BoardDTO board=new BoardDTO();
	board.setBoardNo(boardNo);
	board.setId(loginMember.getId());
	board.setSection(section);
	board.setTitle(title);
	board.setBoardContent(boardContent);
	board.setReviewGrade(reviewGrade);
	board.setProductNo(productNo);	
	
	BoardDAO.getDAO().insertBoard(board);
	
	String id=request.getParameter("id");
	int orderNo=Integer.parseInt(request.getParameter("orderNo"));
	
	int status=ShopOrderDAO.getDAO().updateOrderStatus(productNo, orderNo, 9);
	
	out.println("<script type='text/javascript'>");
	out.println("opener.location.reload();");
	out.println("window.close();");
	out.println("</script>");
%>