<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@include file="/security/login_check.jspf" %>  --%>
<%
	String message = (String) session.getAttribute("message");
if (message == null) {
	message = "";
} else {
	session.removeAttribute("message");
}

ProductDTO product = (ProductDTO) session.getAttribute("product");
if (product != null) {
	session.removeAttribute("product");
}

String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());

int productNo=Integer.parseInt(request.getParameter("productNo"));

ProductDTO uptProduct=ProductDAO.getDAO().selectNoProduct(productNo);

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
	<h2>제품등록</h2>
		<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">Margaret Howell Product Update</h6>
	</div>
	
	<div class="card-body">
	
	<form action="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=product&work=product_modify_action"
		method="post" enctype="multipart/form-data" id="productForm">
		<input type="hidden" value="<%=uptProduct.getProductNo()%>" name="productNo" /> 
	<table class="type03">
		<tr>
			<th scope="row">제품명</th>
			<td>
				<input type="text" name="productName" id="productName"
					value="<%=uptProduct.getProductName() %>">  영문 50자 이내로 작성
			</td>
		</tr>
		<tr>
			<th scope="row">카테고리</th>
			<td>
				<select name="category" id="category">
					<option value="SHIRTS">SHIRTS</option>
					<option value="OUTERWEAR">OUTERWEAR</option>
					<option value="KNITWEAR" >KNITWEAR</option>
					<option value="SKIRTS" >SKIRTS</option>
					<option value="TROUSERS" >TROUSERS</option>
					<option value="ACCESSORIES" >ACCESSORIES</option>
					<option value="SPORTSWEAR" >SPORTSWEAR</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">사이즈</th>
			<td>
				<select name="productSize" id="productSize">
				<option value="F" >F</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">메인이미지</th>
			<td>
				<input type="file" name="mainImage" id="mainImage">
			</td>
		</tr>
		<tr>
			<th scope="row">상세정보</th>
			<td>
				<textarea rows="7" cols="60" name="productDetail" id="productDetail"><%=uptProduct.getProductDetail()%></textarea>
			</td>
		</tr>
		<tr>
			<th scope="row">재고</th>
			<td>
				<input type="text" name="stock" id="stock" 
					value="<%=uptProduct.getStock() %>">  개
			</td>
		</tr>
		<tr>
			<th scope="row">제품가격</th>
			<td>
				<input type="text" name="productPrice" id="productPrice"
					value="<%=uptProduct.getProductPrice()%>" >  원
			</td>
		</tr>
		<tr>
			<th scope="row">등록날짜</th>
			<td>
				<input type="text" name="addDate" id="addDate" value="<%=uptProduct.getAddDate() %>" readonly="readonly" > 
				
			</td>
		</tr>
	</table>
	<div id="btnDiv">
		<button type="submit">수정</button>
		<button type="button" id="productListBtn">취소</button>
	</div>
	</form>	
	
</div>
</div>
	<div id="message" style="color: red;"><%=message%></div>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("category").value='<%=uptProduct.getCategory()%>';
	document.getElementById("productSize").value='<%=uptProduct.getProductSize()%>';
}

$("#productForm").submit(function() {
	if($("#productName").val()=="") {
		$("#message").text("제품명을 입력해 주세요.");
		$("#productName").focus();
		return false;
	}
	
	if($("#category").val()=="") {
		$("#message").text("카테고리를 선택해 주세요.");
		$("#cateogory").focus();
		return false;
	}
	
	if($("#productSize").val()=="") {
		$("#message").text("사이즈를 선택해 주세요.");
		$("#productName").focus();
		return false;
	}
	
	if($("#mainImage").val()=="") {
		$("#message").text("상품이미지를 입력해 주세요.");
		$("#mainImage").focus();
		return false;
	}
	
	if($("#productDetail").val()=="") {
		$("#message").text("상품상세설명을 입력해 주세요.");
		$("#productDetail").focus();
		return false;
	}
	
	if($("#stock").val()=="") {
		$("#message").text("상품의 재고를 입력해 주세요.");
		$("#stock").focus();
		return false;
	}
	
	if($("#productPrice").val()=="") {
		$("#message").text("제품가격을 입력해 주세요.");
		$("#productPrice").focus();
		return false;
	}
});

$("#productListBtn").click(function() {
	location.href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=product&work=product_manager";

});
</script>