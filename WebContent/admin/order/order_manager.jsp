<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<%
	String product_name = request.getParameter("product_name");
	String id = request.getParameter("id");
	String st_order_date = (String)request.getParameter("st_order_date"); 
	String end_order_date = (String)request.getParameter("end_order_date");
	
	if(product_name == null){
		product_name = "";		
	}
	
	if(id == null){
		id = "";		
	}
	
	if(end_order_date == null){
		end_order_date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());		
	}	

	List<shopOrderJoinDTO> orderList=ShopOrderDAO.getDAO().selectSearchAllOrder(product_name, id, st_order_date, end_order_date);
%>

<style type="text/css">

table.type03 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
  width: 147px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #153d73;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
table.type03 td {
  width: 1500px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

</style>
	<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">주문관리</h1>
	<!-- 검색테이블 -->
<div class="product">
	<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
	<!-- 검색 테이블 -->
	<form action="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager" method="post">
		<table class="type03">
		  <tr>
		    <th scope="row">상품명</th>
		    <td>
	    		<input type="text" value="<%=product_name %>" name="product_name" style="width: 50%"/>
		    </td>
		  </tr>
		  <tr>
		    <th scope="row">회원 아이디</th>
		    <td>
	    		<input type="text" value="<%=id %>" name="id" style="width: 50%"/>
		    </td>
		  </tr>
		    <tr>
			    <th scope="row">주문날짜</th>
			    <td>
			    	<input type="date" id="ord_start_date" name="st_order_date" value="<%=st_order_date %>"> ~ <input
						type="date" name="end_order_date" value="<%=end_order_date%>">
			    </td>
		  </tr>
		</table>
		<div style="text-align: center;">
			<button type="submit" class="btn btn-primary">검색</button>
		</div>
		</form>
	</div>
</div>
</div>
	<!-- DataTales -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Margaret Howell Order List</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>주문날짜</th>
							<th>주문번호</th>
							<th>상품명</th>
							<th>회원 아이디</th>
							<th>수량</th>
							<th>주문금액</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<%if(orderList.isEmpty()) { %>
						<tr>
							<td colspan="8">등록된 제품이 없습니다.</td>
						</tr>
					<%} else { %>
						<%for(shopOrderJoinDTO order:orderList) { %>
						<tr>
							<td><%=order.getOrderdate().substring(0, 10) %></td>
							<td><%=order.getOrderNo() %></td>
							<td><img src="<%=request.getContextPath() %>/admin/product_image/<%=order.getMainImage()%> " width="80" height="80">
								&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_detail&productNo=<%=order.getProductNo()%>"><%=order.getProductName() %></a></td>
							<td><%=order.getId() %></td>
							<td><%=order.getOrderSeq()%></td>	
							<td><%=DecimalFormat.getCurrencyInstance().format(order.getProductPrice() * Integer.parseInt(order.getOrderSeq()))%></td>	
							<td align="center">
							<% if(order.getOrderStatus()==1) { %> 입금전 <% } %>
							<% if(order.getOrderStatus()==2) { %> 
								배송준비중 <br>
								<input type="button" value="배송" onclick="uptOrderStatus('<%=order.getProductNo()%>','<%=order.getOrderNo()%>', '3')"/>
								<% } %>
							<% if(order.getOrderStatus()==3) { %> 
								배송중 <br>
								<input type="button" value="배송완료" onclick="uptOrderStatus('<%=order.getProductNo()%>','<%=order.getOrderNo()%>', '8')"/>
								<% } %>
							<% if(order.getOrderStatus()==4) { %> 취소 <% } %>
							<% if(order.getOrderStatus()==5) { %> 교환 <% } %>
							<% if(order.getOrderStatus()==6) { %> 반품 <% } %>
							<% if(order.getOrderStatus()==7) { %> 환불 <% } %>
							<% if(order.getOrderStatus()==8) { %> 배송완료 <% } %>
							<% if(order.getOrderStatus()==9
							|| order.getOrderStatus()==10) { %> 구매확정 <% } %>
							</td>
						</tr>
						<% } %>
					<%} %>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function uptOrderStatus(productNo, orderNo, orderStatus){
	var msg = "";
	if(orderStatus == 3){
		msg = "배송하시겠습니까?";
	}else if(orderStatus == 8){
		msg = "배송을 완료하시겠습니까?";
	}
	
	if(confirm(msg)){
		location.href="<%=request.getContextPath()%>/member/member_uptStatus_action.jsp?productNo="+productNo+"&orderNo="+orderNo+"&orderStatus="+orderStatus+"&mode=admin";
	}
}
</script>
<!-- /.container-fluid -->

<!-- End of Main Content -->

<!-- Footer -->
