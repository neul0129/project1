<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int productNo=Integer.parseInt(request.getParameter("productNo"));
	ProductDTO product=ProductDAO.getDAO().selectNoProduct(productNo);
%>
<h2>제품상세정보</h2>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form action="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_add_action" name="cartForm" method="post">
	<div>
	<input type="hidden" name="productNo" value="<%=productNo %>">
		<div class="headingArea ">
			<div class="detailArea ">
				<div class="imgArea ">
					<div class="listImg">
						<ul>
							<li class="xans-record-"><img
								src="<%=request.getContextPath() %>/admin/product_image1/<%=product.getMainImage() %>"
								class="ThumbImage" alt=""></li>
							</ul>
					</div>
				</div>


				<div class="infoArea">
					<div class="product-detaildesign">
						<tr class=" xans-record-">
							<td><div style="font-size: 14px; color: #6a696c; ">
									<br><%=product.getProductName() %>
								</div></td>
						</tr>
						<tr class=" xans-record-">
							<td style="line-height: 18px !important;"><div
									style="font-size: 11px; color: #6a696c;">
									<%=product.getProductDetail() %>
								</div></td>
						</tr>
						<tr class=" xans-record-">
							<td style="line-height: 18px !important;"><div
									style="margin: 10px; font-size: 14px; color: #6a696c;">
									<%=product.getProductPrice() %>
									<strong id="span_product_price_text"></strong><input
										id="product_price" name="product_price" value="<%=product.getProductPrice() %>" type="hidden">
								</div></td>
						</tr>
					</div>

					<tbody
						class="option_button">
						<tr>
							<th scope="row">SIZE</th>
							<div class="button_type">
								<button id="product_btn1" type="button">1</button>
								<button id="product_btn2" type="button">2</button>
								<button id="product_btnF" type="button">F</button>
							</div>
						</tr>
					</tbody>
					
					<div class="displaynone1">
						<label>1:</label><p><%=product.getProductName() %></p>
						<span><%=product.getProductPrice() %></span>
					</div>
	
					<div class="displaynone2">
						<label>2:</label><p><%=product.getProductName() %></p>
						<span><%=product.getProductPrice() %></span>
					</div>
					<div>
					수량 : <input type="number" name="cartQuantity" min="1" max="<%=product.getStock() %>"></p>
					</div>
					

					<div class="option_button2 ">
						<div class="buttonArea">
							<span class="gLeft"> <button type="button"
										id="button_cart">
										<span style="font-size: 14px;">ADD TO BAG</span>
									</button> <a href="#"><button type="button" class="review"
										style="margin-top: 10px;">REVIEW</button></a>
							</span>
						</div>
					</div>
				</div>
			</div>
		
		</div>
		</div>
				</form>
</body>
</html>
<%-- <table>
	
	<tr>
		<td class="title">제품명</td>
		<td class="value"><%=product.getProductName() %></td>
	</tr>
	<tr>
		<td class="title">제품이미지</td>
		<td class="value"><img src="<%=request.getContextPath() %>/site/product_image/<%=product.getMainImage() %>" width="200"></td>
	</tr>
	<tr>
		<td class="title">상세설명</td>
		<td class="value"><%=product.getProductDetail().replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<td class="title">제품수량</td>
		<td class="value"><%=DecimalFormat.getInstance().format(product.getStock()) %></td>
	</tr>
	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=DecimalFormat.getCurrencyInstance().format(product.getProductPrice()) %></td>
	</tr>
</table>
 --%>
 
 <script type="text/javascript">
 document.getElementById("button_cart").onclick = function() {
		
	 cartForm.submit();
	}
 </script>
