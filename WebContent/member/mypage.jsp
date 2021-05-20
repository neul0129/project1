<%@page import="site.margaret.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<style>
.shopMain {
    padding: 27px 30px 27px 30px;
    border-bottom: 0px solid #e9e9e9;
}
.shopMain h3 {
    padding: 0 0 5px;
}
.shopMain p a {
    line-height: 1.4;
}

</style>
    
<div class="page-title"><h1>MY ACCOUNT</h1></div>

<div class="shopMain order">
        <h3 class="txtTitle16B"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_product" style="font-size:12px;letter-spacing:0.1em;" style="font-size:12px;letter-spacing:0.1em;">ORDER HISTORY</a></h3>
        <p class="txtSub11"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_product" style="font-size:12px;">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.</a></p>
    </div>
    
    <div class="shopMain profile">
        <h3 class="txtTitle16B"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=modify" style="font-size:12px;letter-spacing:0.1em;">PERSONAL DETAILS</a></h3>
        <p class="txtSub11"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=modify" style="font-size:12px;">회원이신 고객님의 개인정보를 관리하는 공간입니다.</a></p>
    </div>
    
    


















