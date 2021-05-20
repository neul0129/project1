<%@page import="site.margaret.dao.MemberDAO"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="site.margaret.dao.ShopOrderDAO"%>
<%-- 비밀번호를 전달받아 로그인 사용자의 비밀번호와 비교하여 같은 경우 MEMBER 테이블에 저장된 
로그인 사용자의 회원정보를 삭제하고 로그아웃 처리페이지(member_logout_action.jsp)로 이동--%>
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%-- => 전달받은 비밀번호가 로그인 사용자의 비밀번호와 같지 않은 경우 비밀번호 입력페이지(password_confirm.jsp)로 이동 --%>    
<%@include file="/security/login_check.jspf" %>
<%
	// 상태값 변경을 위한 파라미터 productNo, orderNo, orderStatus
	int productNo=Integer.parseInt(request.getParameter("productNo"));
	int orderNo=Integer.parseInt(request.getParameter("orderNo"));
	int orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
	
	// 상태값 변경 위치(user, admin) 분기처리를 위한 파라미터
	String mode = request.getParameter("mode");
	
	// 상태값 변경
	ShopOrderDAO.getDAO().updateOrderStatus(productNo, orderNo, orderStatus);

	// 반품, 취소 시 재고 추가 
	// if null 처리 해준 이유 > 재고 취소에 대한 로직을 뒤늦게 추가하여 반품, 취소시에만 orderSeq 파라미터를 받음.
	// null일경우 parseInt 시 number format 예외가 발생하기 떄문에 널처리
	if(request.getParameter("orderSeq") != null){
		ProductDAO.getDAO().updateProductStock(productNo,Integer.parseInt(request.getParameter("orderSeq")));
	}
	
	// 반환 페이지 url, mode 값에 따라 반환 페이지가 바뀜 
	String url = "";
	if(mode.equals("admin")){
		url = "/admin/admin_index.jsp?workgroup=order&work=order_manager';";	
	}else if(mode.equals("user")){
		url = "/index.jsp?workgroup=member&work=member_product';";
	}
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+url);
	out.println("</script>");
%>
