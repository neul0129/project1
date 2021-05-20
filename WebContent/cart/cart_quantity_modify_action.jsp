<%@page import="site.margaret.dao.CartDAO"%>
<%@page import="site.margaret.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	int cartNo =Integer.parseInt(request.getParameter("cartNo"));
	int cartQuantity =Integer.parseInt(request.getParameter("cartQuantity"));
	int productNo =Integer.parseInt(request.getParameter("productNo"));
	
	
	CartDTO cart = new CartDTO();
	cart.setCartNo(cartNo);
	cart.setCartQuantity(cartQuantity);
	cart.setProductNo(productNo);
	
	CartDAO.getDAO().updateCountCart(cart);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=cart&work=cart_list';");
	out.println("</script>");


%>
