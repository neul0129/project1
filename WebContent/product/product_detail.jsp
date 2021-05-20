<%@page import="site.margaret.dto.shopOrderJoinDTO"%>
<%@page import="site.margaret.dto.MemberDTO"%>
<%@page import="site.margaret.dao.BoardDAO"%>
<%@page import="site.margaret.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#product_detail{
position: relative;
    left: 55px;
    text-align: left;
    }
#padding {
	padding-bottom: 10px;
	padding-top: 10px;
}
</style>
<%
	int productNo=Integer.parseInt(request.getParameter("productNo"));
	ProductDTO product=ProductDAO.getDAO().selectNoProduct(productNo);
	List<BoardDTO> reviewList=BoardDAO.getDAO().selectReviewList(productNo);
	
	//세션에 저장된 회원정보를 반환받아 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
%>
<h2>제품상세정보</h2>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table {width : 100 %; border : 0; border-spacing : 0; border-collapse : collapse;}

	#bottom_line {
		border-bottom: 1px solid gray;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form action="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_add_action" name="cartForm" method="post">
	<div style="display: block;">
	<input type="hidden" name="productNo" value="<%=productNo %>">
		<div class="headingArea ">
			<div class="detailArea ">
				<div class="imgArea ">
					<div class="listImg">
						<ul>
							<li class="xans-record-">
								<img src="<%=request.getContextPath()%>/admin/product_image/<%=product.getMainImage()%>" width="200px">
							</li>
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
									style="font-size: 11px; color: #6a696c;" id="product_detail">
									<%=product.getProductDetail().replace("\n","<br>") %>
								</div></td>
						</tr>
						<tr class=" xans-record-">
							<td style="line-height: 18px !important;"><div
									style="margin: 10px; font-size: 14px; color: #6a696c;">
									<%=DecimalFormat.getCurrencyInstance().format(product.getProductPrice()) %>
									<strong id="span_product_price_text"></strong><input
										id="product_price" name="product_price" value="<%=product.getProductPrice() %>" type="hidden">
								</div></td>
						</tr>
					</div>

					<tbody class="option_button">
						<tr>
							<th scope="row">SIZE</th>
							<div class="button_type">
							
								<button id="product_btnF" type="button">F</button>
							</div>
						</tr>
					</tbody>
					
				<%-- 	<div class="displaynone1">
						<label>1:</label><p><%=product.getProductName() %></p>
						<span><%=DecimalFormat.getCurrencyInstance().format(product.getProductPrice()) %></span>
					</div>
	
					<div class="displaynone2">
						<label>2:</label><p><%=product.getProductName() %></p>
						<span><%=DecimalFormat.getCurrencyInstance().format(product.getProductPrice()) %></span>
					</div> --%>
					<div>
					수량 : <input type="number" name="cartQuantity" id="go_cart" min="1" max="<%=product.getStock() %>" value="1">  개 </p>
					</div>
					

					<div class="option_button2 ">
						<div class="buttonArea">
							<%if(product.getStock() == 0){ %>
							<span class="gLeft"> 
								<span style="font-size: 14px;color: red">SOLD OUT</span>
							</span>
							<%}else{ %>
							<span class="gLeft"> 
								<button type="button" id="button_cart">
									<span style="font-size: 14px;">ADD TO BAG</span>
								</button> 
							</span>
							<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</form>
		<!-- 리뷰등록 -->
		<div style="display: block;">
			<table style="width: 100%">
				<tr id=bottom_line>
					<th width="100">NUMBER</th>
					<th width="100">ID</th>
					<th width="200">TITLE</th>
					<th width="750">CONTENT</th>
					<th width="100">DATE</th>
					<th width="50">GRADE</th>
				</tr> 
				<%if(reviewList.size()==0) { %>
					<tr>
						<td colspan="6">등록된 리뷰가 없습니다.</td>
					</tr>
				<% } else { %>
					<%
					int num = 1;
					for(BoardDTO review:reviewList) { %>
				 	<tr style="background-color:#FFFFFF; color:#555555; border-bottom: solid 1px #CCC;" class="xans-record-">
						<td id="padding">
							<%=num %>
						</td>
						<td id="padding">
							<%=review.getId() %>
						</td>
						<td>
							<%=review.getTitle() %>
						</td>
						<td align="left">
							<%=review.getBoardContent() %>
						</td>
						<td id="padding">
							<%=review.getBoardDate().substring(1, 10) %>
						</td>
						<td id="padding">
							<%
							for(int i=0; i<Integer.parseInt(review.getReviewGrade()); i++){
								%><font color="orange">★</font><%
							}
							 %>
						</td>
					</tr>
					<% num++;
					} %>
				<% } %>
			</table>
		</div>
</body>
</html>

 <script type="text/javascript">
 document.getElementById("button_cart").onclick = function() {
	 	if($("#go_cart").val()==""){
		alert("수량을 입력하세요.");
		$("#go_cart").focus();
		}else{
	   cartForm.submit();  
		}
	}
 </script>