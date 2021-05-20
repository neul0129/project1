<%@page import="java.util.List"%>
<%@page import="site.margaret.dao.ShopOrderDAO"%>
<%@page import="site.margaret.dto.shopOrderJoinDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search = "";	
	String status = "";
	List<shopOrderJoinDTO> orderList = null;
	
	search = "order_date";
	orderList = ShopOrderDAO.getDAO().selectSearchOrder(search, status);
	int dayordertotal =0;
	for(shopOrderJoinDTO order : orderList){
		dayordertotal+= order.getProductPrice();
	}
	
	search = "pay_date";
	orderList = ShopOrderDAO.getDAO().selectSearchOrder(search, status);
	int daypaymenttotal =0;
	for(shopOrderJoinDTO order : orderList){
		daypaymenttotal+= order.getProductPrice();
	}
	
	search = "pay_date";
	status = "7";
	orderList = ShopOrderDAO.getDAO().selectSearchOrder(search, status);
	int dayrefundtotal =0;
	for(shopOrderJoinDTO order : orderList){
		dayrefundtotal+= order.getProductPrice();
	}
	
	search = "";
	int[] count={0,0,0,0,0,0,0,0};
	for(int i =0; i<8;i++){
	status = (i+1)+"";
	orderList = ShopOrderDAO.getDAO().selectSearchOrder(search, status);
	for(shopOrderJoinDTO order : orderList){
		count[i]++;
	}
	}
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/admin/admin_index.jsp?workgroup=main&work=main&dayordertotal="+dayordertotal+"&daypaymenttotal="+daypaymenttotal+"&dayrefundtotal="+dayrefundtotal+"&count1="+count[0]+"&count2="+count[1]+"&count3="+count[2]+"&count4="+count[3]+"&count5="+count[4]+"&count6="+count[5]+"&count7="+count[6]+"&count8="+count[7]+"'");
	out.println("</script>");
	
%>
<h1>처리 페이지</h1>
<div> 당일 주문 금액 = <%=dayordertotal %> 당일 결제 금액 = <%=daypaymenttotal%>  당일 환불 금액<%=dayrefundtotal %></div>
<div>입금전<%=count[0] %> 배송준비중<%=count[1] %> 배송중<%=count[2] %> 취소<%=count[3] %> 교환<%=count[4] %> 반품<%=count[5] %> 환불<%=count[6] %> 배송완료<%=count[7] %> </div>
