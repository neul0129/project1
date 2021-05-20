<%@page import="site.margaret.dao.BoardDAO"%>
<%@page import="site.margaret.dao.CartDAO"%>
<%@page import="site.margaret.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/security/login_check.jspf" %>

<% 
	
	String[] cartNo =request.getParameterValues("cartNo");
	for(String cart:cartNo){
	CartDAO.getDAO().deleteCart(Integer.parseInt(cart));
	}
	//장바구니 새로고침 
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=cart&work=cart_list';");
	out.println("</script>");
%>