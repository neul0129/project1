<%@page import="site.margaret.dto.BoardDTO"%>
<%@page import="site.margaret.dao.ReplyDAO"%>
<%@page import="site.margaret.dto.ReplyDTO"%>
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
	String id=request.getParameter("id");
	String replyContent=request.getParameter("replyContent");
	
	ReplyDTO reply = new ReplyDTO();
	reply.setBoardNo(boardNo);
	reply.setId(loginMember.getId());
	reply.setReplyContent(replyContent);
	
	int rows=ReplyDAO.getDAO().insertReply(reply);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=notice/question&work=question_list';");
	out.println("</script>");
	

%>