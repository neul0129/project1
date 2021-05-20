<%@page import="oracle.net.aso.d"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="site.margaret.dto.CartJoinDTO"%>
<%@page import="site.margaret.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	String id = "";
	if(loginMember != null){
	id = loginMember.getId();		
	}
	List<CartJoinDTO> cart = CartDAO.getDAO().selectCartList(id);
	
	DecimalFormat df = new DecimalFormat("###,###,###");
	
	int totalsum=0;
	
	int shippingfee=0;
	
%>
<style type="text/css">
caption {display : none;}
table {
	width : 100 %; 
	border : 0; 
	border-spacing : 0; 
	border-collapse : collapse;
	text-align: left;
}

.line {
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	
}
#addtobag {
	background : #6a696c; 
	width : 400px;
	border : 1px solid #6a696c; 
	padding : 8px 15px; width : 200px; 
	letter-spacing : 0.2em; color : #FFF; 
	font-size : 14px; 
	display : block; 
	text-align : center; 
	transition : background-color 0.2 s ease;
	margin: auto 0;
	cursor: pointer;
	} 
#totalremove{
	font-size : 11px; 
	cursor: pointer;
	display: block;
	float: right;
	height: 5%;
	margin-right: 14.5%;
	width: 120px;
}
#addtobag :hover {
	background : transparent;
	width : 100%;
	border : 1px solid #6a696c; 
	padding : 8px 15px; 
	letter-spacing : 0.2em; 
	color : #6a696c; 
	font-size : 14px; 
	display : block; 
	text-align : center; 
	transition : background-color 0.2s ease;
}

.thNone {
	display: none;
}


</style>


<br>
<br>
<div class="orderListArea">
<table>
<caption>기본배송</caption>
<colgroup>
<col style="width:27px;"/>
<col style="width:200px;"/>
<col style="width:280px;"/>
<col style="width:100px;"/>
<col style="width:95px;"/>
<col style="width:145px;"/>
</colgroup>

<% if(cart.isEmpty()) { %>
	<tr>
		<td colspan="6"> 장바구니가 비어 있습니다. </td>
	</tr>
<% }else { %>
	<form action="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_remove_action" method="post" name="cartListForm" id="cartListForm" >
	<tr>
		<th><input type="checkbox" id="allCheck" class="allCheck"></th>
		<th width="150px !important;" class="thNone">상품 이미지</th>
		<th class="thNone">상품정보</th>
		<th class="thNone">판매가</th>
		<th class="thNone">수량</th>
		<th class="thNone">합계</th>
		<th class="thNone">선택</th>		
	</tr>
	<% for(CartJoinDTO cartList:cart) { %>
	<input type="hidden" name="productNo" value="<%=cartList.getProductNo() %>">
	<tr class="line">
	<td><input type="checkbox" class="cartNo" id="cartNo" name="cartNo" value="<%=cartList.getCartNo() %>" ><span><input type="hidden" name="cartNo" value="<%=cartList.getCartNo() %>" ></span></td>
	
	
	<td width="150px !important;"><img alt="" src="<%=request.getContextPath() %>/admin/product_image/<%=cartList.getMainImage()%>" width="100px" height="150px">
	<td><%=cartList.getProductName()%>
		<ul>
       	 <li><%=cartList.getProductSize()%></li>
		</ul>
	</td>
	<td class="totalPrice"><%=df.format(cartList.getProductPrice()) %></td>
	<td>
		<span class="">
		<span class="quantity"><input class="totalPrice" style="width: 30px; text-align: center;" name="cartQuantity" size="2" value="<%=cartList.getCartQuantity() %>" type="number" min="0" /></span>
		<button type="button" id="editbtn" style="background: #fff; border:1px solid gray; padding: 3px; color: gray; font-size: 11px; cursor: pointer; ">EDIT</button>
		</span>
	</td>
	<%-- 총금액 --%>
 	<td>
		<strong><input id=inputTotalPrice1 type="text" readonly="readonly" size="8" style="border: 0; text-align: right; color: gray;"  value="<%=df.format(cartList.getProductPrice()*cartList.getCartQuantity()) %>"></strong>
	</td>
    <td>
		<div class="button">
			<button type="button" id="remove_button" class="cart_removeBtn" style="cursor: pointer;" value="<%=cartList.getCartNo()%>">remove</button>
		</div>
        </td>
	</tr>
	<% totalsum+= cartList.getProductPrice()*cartList.getCartQuantity(); %>
	<% } %>
	</form>
	<div>
<br>
<br>
<br>
<br>
<table style="width: 85% ">
	<caption>총 주문금액</caption>
	<colgroup>
	<col style="width:200;"/>
	<col style="width:50%;"/>
	</colgroup>
	
	<thead class="middle">
		<tr>
			<th scope="col" style="color: gray; ">총 상품금액</th>                    
				<td id="totalNumber" style="text-align: right; padding: 0; margin: 0;"><span class="tail displaynone"><%=df.format(totalsum) %> 원</span></td>
		</tr>
		<tr>
			<% if(totalsum>50000){shippingfee=0;}else{shippingfee=2500;} %>
			<th scope="col" style="color: gray; ">총 배송비</th
			><td style="text-align: right; padding: 0; margin: 0;"><%=shippingfee %> 원</td>
        </tr>
		<tr>
			<th scope="col"style="color: gray; ">결제예정금액</th>
            <td style="text-align: right; padding: 0; margin: 0;"><span class="total  txtOrderTotal"> <%=df.format(totalsum+shippingfee) %> 원<span class="tail displaynone"></span></span></td>
        </tr>
	</thead>
</table>
</div>
<% } %>
</table>
 

<!-- 주문 버튼 -->
	<button type="submit" id="totalremove" class="remove_button">total remove </button>
	<div id="message" style="color: red; text-align: center; " ></div>
	<br>
	<br>
	<a href="index.jsp?workgroup=payment&work=payment_page" id="addtobag" style="width: 85%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CHECKOUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

</div>
<script type="text/javascript">
$("#totalremove").click(function() {
	if($(".cartNo").filter(":checked").length ==0) {
		$("#message").text("선택한 상품이 하나도 없습니다.");
		return;
	}
	
	$("#cartListForm").submit();
});

$(".allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".cartNo").prop("checked",true);		
	} else {
		$(".cartNo").prop("checked",false);		
	}
});

$(".cart_removeBtn").click(function() {
	var cartNo=$(this).val();

	if(confirm("상품을 삭제하시겠습니까?")) {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_remove_action&cartNo="+cartNo;
	}
})

	$("#editbtn").click(function() {
			$("#cartListForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=cart_quantity_modify_action");
			$("#cartListForm").submit();		
	});
</script>