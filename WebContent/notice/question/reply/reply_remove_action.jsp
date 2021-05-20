<%@page import="site.margaret.dto.ReplyDTO"%>
<%@page import="site.margaret.dao.ReplyDAO"%>
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
	ReplyDAO.getDAO().deleteReply(replyNo);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=notice/question&work=question_list';");
	out.println("</script>");
%>