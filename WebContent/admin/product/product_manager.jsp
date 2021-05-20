<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@include file="/security/login_check.jspf" %>  --%>
	
<%
	String product_name = request.getParameter("product_name");
	String product_size = request.getParameter("product_size");
	String category = request.getParameter("category");
	String st_add_date = (String)request.getParameter("st_add_date"); 
	String end_add_date = (String)request.getParameter("end_add_date");
	
	if(product_name == null){
		product_name = "";		
	}
	
	if(end_add_date == null){
		end_add_date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());		
	}
	
	List<ProductDTO> productList=ProductDAO.getDAO().selecAllProduct(product_name, category, product_size, st_add_date, end_add_date);

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
  width: 1000px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

</style>
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품목록</h1>
		<!-- Begin Page Content -->
		<div class="product">
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
<!-- 검색 테이블 -->
	<form action="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=product&work=product_manager" method="post">
			<table class="type03">
			  <tr>
			    <th scope="row">상품명</th>
			    <td>
		    		<input type="text" value="<%=product_name %>" name="product_name" style="width: 50%;">
			    </td>
			  </tr>
			  <tr>
			    <th scope="row">카테고리</th>
			    <td>
			    	<select name="category" style="width: 176px;">
			    		<option value="">전체</option>
			    		<option value="SHIRTS">SHIRTS</option>
			    		<option value="OUTERWEAR">OUTERWEAR</option>
			    		<option value="KNITWEAR">KNITWEAR</option>
			    		<option value="SKIRTS">SKIRTS</option>
			    		<option value="TROUSERS">TROUSERS</option>
			    		<option value="SPORTSWEAR">SPORTSWEAR</option>
			    	</select>
			    </td>
			  </tr>
			  <tr>
			    <th scope="row">사이즈</th>
			    <td>
					<input type="text" readonly="readonly" value="F">
			    </td>
			    <tr>
			    <th scope="row">등록일자</th>
			    <td>
			    	<input type="date" id="ord_start_date" name="st_add_date" value="<%=st_add_date %>"> ~ <input
						type="date" name="end_add_date" value="<%=end_add_date%>">
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
			<h6 class="m-0 font-weight-bold text-primary">Margaret Howell Product List</h6>
		</div>
		<div class="card-body">
			<button type="button" id="addBtn">제품등록</button>
			<button type="button" id="removeBtn">선택상품삭제</button>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th><input type="checkbox" id="allCheck" onchange="allChk();"></th>
							<th>제품명</th>
							<th>카테고리</th>
							<th>사이즈</th>
							<th>재고</th>
							<th>가격</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<%if(productList.isEmpty()) { %>
						<tr>
							<th colspan="8">등록된 제품이 없습니다.</th>
						</tr>
					<%} else { %>
						<%for(ProductDTO product:productList) { %>
						<tr>
							<th>
								<input type="checkbox" name="chkProduct" value="<%=product.getProductNo()%>">
							</th>
							<th><img src="<%=request.getContextPath() %>/admin/product_image/<%=product.getMainImage()%> " width="80" height="80">
								&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=product&work=product_modify&productNo=<%=product.getProductNo()%>">
								<%=product.getProductName() %></a></th>
							<th><%=product.getCategory() %></th>
							<th><%=product.getProductSize() %></th>
							<th><%=DecimalFormat.getInstance().format(product.getStock()) %></th>
							<th><%=DecimalFormat.getCurrencyInstance().format(product.getProductPrice()) %></th>
							<th><%=product.getAddDate().substring(0, 10) %></th>
						</tr>
						<% } %>
					<%} %>
				</table>
			</div>
		</div>
	</div>

</div>
<script type="text/javascript">
$(function(){
	if('<%=category%>' != ''){
		document.getElementsByName("category")[0].value='<%=category%>'
	}
	if('<%=product_size%>' != ''){
		document.getElementsByName("product_size")[0].value='<%=product_size%>'
	}
});

$("#addBtn").click(function() {
	 location.href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=product&work=product_add";
});


$("#removeBtn").click(function() {
	var chkArr = document.getElementsByName("chkProduct");
	var delProductNo="";
	
	for(var i = 0; i < chkArr.length; i++){
		if(chkArr[i].checked == true){
			if(delProductNo == ""){
				delProductNo = chkArr[i].value;
			} else {
				delProductNo += ","+chkArr[i].value;
			}
		} 
	} 
	
	if(confirm("현재 제품정보를 삭제 하겠습니까?")) {
		
	 location.href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=product&work=product_remove_action&productNo="+delProductNo;
	} 
});

function allChk(){
	var allCheck=document.getElementById("allCheck").checked;
	var chkArr = document.getElementsByName("chkProduct");

	for(var i = 0; i < chkArr.length; i++){
		chkArr[i].checked = allCheck;
	} 
}

</script>

<!-- /.container-fluid -->

<!-- End of Main Content -->

<!-- Footer -->
