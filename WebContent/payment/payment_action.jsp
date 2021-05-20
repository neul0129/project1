<%@page import="site.margaret.dto.CartDTO"%>
<%@page import="site.margaret.dao.CartDAO"%>
<%@page import="site.margaret.dto.ShopOrderDTO"%>
<%@page import="site.margaret.dao.ShopOrderDAO"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
    
<%
	
	//전달값을 반환받아 저장
	int orderNo=ShopOrderDAO.getDAO().selectNextOrderNo();
	String[] productNo = request.getParameterValues("productNo");
	String[] productQty = request.getParameterValues("productQty");
	int payNo=Integer.parseInt(request.getParameter("creadit_card"));
	int orderStatus=Integer.parseInt(request.getParameter("order_status"));
	String recipient = request.getParameter("name");
	String deZipcode = request.getParameter("zipcode");
	String deAddress1 = request.getParameter("address1");
	String deAddress2 = request.getParameter("address2");
	String omessage = request.getParameter("omessage");//검색어(이름, 아이디, 등등)
	if (omessage == null)
		omessage = "";
	String deMessage = request.getParameter("omessage");
	String phone= request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	String rePhone = phone;
	//DTO 인스턴스 생성 및 전달값으로 필드값 변경
		int j=0;	
		for(String a : productNo){
		if(j==productQty.length) break;
		for(int i=1;i<=Integer.parseInt(productQty[j]);i++){
		ShopOrderDTO order = new ShopOrderDTO();
		order.setOrderNo(orderNo);
		order.setId(loginMember.getId());
		order.setProductNo(Integer.parseInt(a));
		order.setOrderSeq(""+i);
		order.setOrderStatus(orderStatus);
		order.setPayNo(payNo);
		order.setRecipient(recipient);
		order.setDeZipcode(deZipcode);
		order.setDeAddress1(deAddress1);
		order.setDeAddress2(deAddress2);
		order.setDeMessage(deMessage);
		order.setRePhone(rePhone);
		ShopOrderDAO.getDAO().InsertOrder(order);
		
		ProductDAO.getDAO().updateProductStock(Integer.parseInt(a),-1);
		}j++;
		}
	
		
	CartDAO.getDAO().deleteAllCart(loginMember.getId());
		
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=member_product';");
	out.println("</script>");
	
%>
