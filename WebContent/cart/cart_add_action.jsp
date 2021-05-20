<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="site.margaret.dto.CartDTO"%>
<%@page import="site.margaret.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%	
	//비정상적인 요청 
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	

	//전달값을 반환받아 저장
	int cartNo = CartDAO.getDAO().selectNextCartNo();
	int productNo =Integer.parseInt(request.getParameter("productNo"));
	int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
	
	CartDTO cart = new CartDTO();
	cart.setCartNo(cartNo);
	cart.setProductNo(productNo);
	cart.setId(loginMember.getId());
	cart.setCartQuantity(cartQuantity);
	
	CartDTO serchcart = CartDAO.getDAO().searchSameProduct(productNo, loginMember.getId());
	
	if(serchcart != null){
		CartDAO.getDAO().updateCart(cart);
	} else {
		CartDAO.getDAO().insertCart(cart);
	}
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=cart&work=cart_list'");
	out.println("</script>");

%>