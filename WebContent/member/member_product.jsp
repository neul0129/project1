<%@page import="site.margaret.dao.MemberDAO"%>
<%@page import="site.margaret.dto.MemberDTO"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dto.shopOrderJoinDTO"%>
<%@page import="site.margaret.dao.ShopOrderDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>

<%	
	//int productNo=Integer.parseInt(request.getParameter("productNo"));

	String id = loginMember.getId();
    List<shopOrderJoinDTO> orderList=ShopOrderDAO.getDAO().selectProductOrder(id);
%>
<script type="text/javascript">
	function reviewPopup(productNo, id, orderNo){
	    var url = "<%=request.getContextPath()%>/review/review_edit_pop.jsp?productNo="+productNo+"&id="+id+"&orderNo="+orderNo;
	    var name = "review";
	    var option = "width = 700, height = 300, top = 100, left = 200, location = no, resizable = no"
	    window.open(url, name, option);
	}
	
	function uptOrderStatus(productNo, orderNo, orderStatus, orderSeq){
		var msg = "";
		if(orderStatus == 4){
			msg = "취소 하시겠습니까?";
		}else if(orderStatus == 2){
			msg = "입금 하시겠습니까?";
		}else if(orderStatus == 6){
			msg = "반품 하시겠습니까?";
		}else if(orderStatus == 10){
			msg = "구매확정 하시겠습니까?";
		}
		
		if(confirm(msg)){
			location.href="<%=request.getContextPath()%>/member/member_uptStatus_action.jsp?productNo="+productNo+"&orderNo="+orderNo+"&orderStatus="+orderStatus+"&mode=user&orderSeq="+orderSeq;
		}
	}
</script>
<style type="text/css">

table {width: 100%; border : 0; border-spacing : 0; border-collapse : collapse;}

#bottom_line {
	border-bottom: 1px solid gray;
}
#padding{
	padding-bottom: 5px;
	padding-top: 5px;
}
</style>
<!-- Begin Page Content -->
<div class="product">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800" style="text-align: center;">주문내역목록</h1>

	<!-- DataTales -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" style="text-align: center; padding-bottom: 100px;">Margaret Howell Order List</h6>
		</div>
		<div class="card-body" style="width: 1000px;">
			<div class="table-responsive">
				<table style="padding-top: 5px;">
					<thead style="width: 50px;">
						<tr id="bottom_line">
							<th>주문날짜&nbsp;&nbsp;</th>
							<th>주문번호&nbsp;&nbsp;</th>
							<th>상품&nbsp;&nbsp;</th>
							<th>상품명&nbsp;&nbsp;</th>
							<th>수량&nbsp;&nbsp;</th>
							<th>주문금액&nbsp;&nbsp;</th>
							<th>주문상태&nbsp;&nbsp;</th>
							<th>리뷰</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<%if(orderList.isEmpty()) { %>
						<tr>
							<th colspan="8">등록된 제품이 없습니다.</th>
						</tr>
					<%} else { %>
						<%for(shopOrderJoinDTO order:orderList) { %>
				 		<tr>
							<th id="padding"><%=order.getOrderdate().substring(0, 10) %></th>
							<th id="padding"><%=order.getOrderNo() %></th>
							<th id="padding"><img src="<%=request.getContextPath() %>/admin/product_image/<%=order.getMainImage()%> " width="80" height="80">
								&nbsp;&nbsp;</th>
							<th id="padding"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_detail&productNo=<%=order.getProductNo()%>"><%=order.getProductName() %></a></th>
							<th id="padding"><%=order.getOrderSeq()%></th>
							<th id="padding"><%=DecimalFormat.getCurrencyInstance().format(order.getProductPrice()*Integer.parseInt(order.getOrderSeq())) %></th>
							<th id="padding">
									<% if(order.getOrderStatus()==1) { %> 
										입금전<br>
										<input type="button" value="입금" onclick="uptOrderStatus('<%=order.getProductNo()%>','<%=order.getOrderNo()%>','2')"/>
										<input type="button" value="취소" onclick="uptOrderStatus('<%=order.getProductNo()%>','<%=order.getOrderNo()%>','4','<%=order.getOrderSeq()%>')"/>  <% } %>
									<% if(order.getOrderStatus()==2) { %> 
										배송준비중 <br>
										<input type="button" value="취소" onclick="uptOrderStatus('<%=order.getProductNo()%>','<%=order.getOrderNo()%>','4','<%=order.getOrderSeq()%>')"/>
										<% } %>
									<% if(order.getOrderStatus()==3) { %> 배송중 <% } %>
									<% if(order.getOrderStatus()==4) { %> 주문취소 <% } %>
									<% if(order.getOrderStatus()==5) { %> 교환 <% } %>
									<% if(order.getOrderStatus()==6) { %> 반품 <% } %>
									<% if(order.getOrderStatus()==7) { %> 환불 <% } %>
									<% if(order.getOrderStatus()==8) { %> 
										배송완료<br>
										<input type="button" value="반품" onclick="uptOrderStatus('<%=order.getProductNo()%>','<%=order.getOrderNo()%>', '6','<%=order.getOrderSeq()%>')"/>
										<input type="button" value="구매확정" onclick="uptOrderStatus('<%=order.getProductNo()%>','<%=order.getOrderNo()%>', '10')"/>
									 <% } %>
									<% if(order.getOrderStatus()==9
									|| order.getOrderStatus()==10) { %> 구매확정 <% } %>
							</th>
							<th id="padding">	
								<% if(order.getOrderStatus()==8 || order.getOrderStatus()==10) { %> 
								<button type="button" class="review" style="margin-top: 10px;" 
									onclick="javascript:reviewPopup('<%=order.getProductNo()%>','<%=order.getId()%>','<%=order.getOrderNo()%>');">리뷰작성</button> 
								<% } else if(order.getOrderStatus()==9){%>
									작성완료
								<% } else { %>
									-								
								<%} %>
							</th>
						</tr>
						<% } %>
					<%} %>
				</table>
			</div>
		</div>
	</div>

</div>


<!-- /.container-fluid -->

<!-- End of Main Content -->

<!-- Footer -->

