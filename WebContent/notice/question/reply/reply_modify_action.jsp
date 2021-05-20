<%@page import="site.margaret.dao.ReplyDAO"%>
<%@page import="site.margaret.dto.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equals("GET")) {		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	int replyNo=Integer.parseInt(request.getParameter("replyNo"));
	int boardNo=Integer.parseInt(request.getParameter("boardNo"));
	String id=request.getParameter("id");
	String replyContent=request.getParameter("replyContent");
	
	ReplyDTO reply= new ReplyDTO();
	reply.setReplyNo(replyNo);
	reply.setBoardNo(boardNo);
	reply.setId(id);
	reply.setReplyContent(replyContent);
	
	int modify =ReplyDAO.getDAO().updateReply(reply);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=notice/question&work=question_list';");
	out.println("</script>");
%>