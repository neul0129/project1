<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%
	List<ProductDTO> productList=ProductDAO.getDAO().selecAllProduct("",request.getParameter("category"),"","","");
%>


<% for(ProductDTO product:productList) { %>
	<%-- <% if(category.equals(product.getCategory())) { %> --%>
	<div class="product">
		<div>
	<a href="<%=request.getContextPath()%>/index.jsp?workgroup=shirts&work=shirts_detail&productNo=<%=product.getProductNo()%>">
				<img src="<%=request.getContextPath()%>/admin/product_image/<%=product.getMainImage()%>" width="200px"></a>
		</div>
		<div><%=product.getProductName() %></div>
		<div>
			<%=DecimalFormat.getCurrencyInstance().format(product.getProductPrice()) %>
		</div>
	</div>
	
	<% } %>
<%-- <% } %> --%>
<!--  <!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
		
		<div class="headingArea ">
			<div class="detailArea ">
				<div class="imgArea ">
					<div class="listImg">
						<ul>
							<li class="xans-record-"><img
								src="//www.margarethowell.co.kr/web/product/small/202102/7d2d1520083094926cef2c4ef2a04f9a.jpg"
								class="ThumbImage" alt=""></li>
							<li class="xans-record-"><img
								src="//www.margarethowell.co.kr/web/product/extra/small/202102/7f2fe1c36d0df2875564cf25781278be.jpg"
								class="ThumbImage" alt=""></li>
							<li class="xans-record-"><img
								src="//www.margarethowell.co.kr/web/product/extra/small/202102/253cc5d24364268a8116f00cfe216bc2.jpg"
								class="ThumbImage" alt=""></li>
						</ul>
					</div>
				</div>


				<div class="infoArea">
					<div class="product-detaildesign">
						<tr class=" xans-record-">
							<td><div style="font-size: 14px; color: #6a696c;">
									MHL. <br> GARMENT DYE BASIC POPLIN <br> GRAY
								</div></td>
						</tr>
						<tr class=" xans-record-">
							<td style="line-height: 18px !important;"><div
									style="font-size: 11px; color: #6a696c;">
									코튼 소재의 셔츠입니다. <br> 여성용 제품입니다. <br> <br> 원산지 : 중국
									<br> 품번 : MHP42M0003GY <br> 혼용율 : 면 100%<br>
									세탁방법 <br> 30℃에서 중성세제로 약하게 세탁하십시오. <br> 염소, 산소 표백은
									피해주십시오. <br> 사이즈 가이드<br>1 : 가슴둘레 100cm, 총길이 64.5cm,
									소매길이 75cm <br>2 : 가슴둘레 104cm, 총길이 68.5cm, 소매길이 80cm<br>
									사이즈는 실제 크기와 다를 수 있습니다.<br>
								</div></td>
						</tr>
						<tr class=" xans-record-">
							<td style="line-height: 18px !important;"><div
									style="margin: 10px; font-size: 14px; color: #6a696c;">
									<strong id="span_product_price_text">328,000</strong><input
										id="product_price" name="product_price" value="" type="hidden">
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
							</div>
						</tr>
					</tbody>
					
					<div class="displaynone1">
						<label>1:</label><p>MHL. GARMENT DYE BASIC POPLIN</p>
						<span>328,000</span>
					</div>
	
					<div class="displaynone2">
						<label>2:</label><p>MHL. GARMENT DYE BASIC POPLIN</p>
						<span>328,000</span>
					</div>
					

					<div class="option_button2 ">
						<div class="buttonArea">
							<span class="gLeft"> <button type="button"
										id="button_addtobag">
										<span style="font-size: 14px;">ADD TO BAG</span>
									</button> <a href="#"><button type="button" class="review"
										style="margin-top: 10px;">REVIEW</button></a>
							</span>
						</div>
					</div>
				</div>
			</div>
		
		</div>
</body>
</html>
-->