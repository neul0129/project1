<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.CartDAO"%>
<%@page import="site.margaret.dto.CartJoinDTO"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@page import="java.util.List"%>
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
	
	int totalsum =0;
	int shippingfee=0;
	
	
	//String[] cartNo =request.getParameterValues("cartNo");
	//for(String loginId:cartNo){
	//CartDAO.getDAO().selectCartList(loginId);
	//}
	
%>   

<style type="text/css">
caption {display : none;}
h1 {font-size : 14px! important;}
thead {display : none;}
table {
	border : 0; 
	border-spacing : 0; 
	border-collapse : collapse;
	text-align: left;
}
th, td {border : 0; vertical-align : middle;}

.orderArea {margin-bottom : 60px;} 
input [type = "checkbox"] {display : inline-block! important} 

.error {
	color: gray;
	font-style: italic;
	font-weight: bold;
	display: none;
}

#paymentBtn, #orderBtn {
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


</style>

<form action="<%=request.getContextPath()%>/index.jsp?workgroup=payment&work=payment_action" id="paymentForm" name="paymentForm" method="post" >
<input type="hidden" value="" name="order_status"/>
<!-- YOUR ORDER -->
<div class="orderListArea ">
<div class="page-title"><h1>YOUR ORDER</h1></div>

</div>

<div class="">
<table border="1" summary="" class="gMerge">
<caption>기본배송</caption>
 <colgroup>
<col style="width:29px;" class=""/>
<col style="width:500px;"/>
<col style="width:300px;"/>
<col style="width:95px;"/>
<col style="width:40px;"/>
<col style="width:85px;"/>
</colgroup>
<thead>
	<tr>
	<th scope="col" class="">
	<input type="checkbox" onclick="EC_SHOP_FRONT_ORDERFORM_PRODUCT.proc.setCheckOrderList('chk_order_cancel_list_basic', this);"/></th>
    <th scope="col">상품정보</th>
    <th scope="col">판매가</th>
    <th scope="col">수량</th>
    <th scope="col">합계</th>
	</tr>
</thead>

<tbody class="xans-element- xans-order xans-order-normallist center middle">
<% for(CartJoinDTO cartList:cart) {%>
<tr class="xans-record-">
<td><input type="hidden" name="id" value="<%=cartList.getId()%>"></td>
<td class=""><input id="chk_order_cancel_list0" name="chk_order_cancel_list_basic0" value="1009:000A:F:3809" type="checkbox"  /></td>
                        <td class="left">
                            <div class="product">
                                <a href="/product/detail.html?product_no=1009&cate_no=30"><strong> <br/><%=cartList.getProductName() %></strong></a>
                                <div class="option ">[옵션:<%=cartList.getProductSize() %> ]</div>
								<input type="hidden" name="productNo" value="<%=cartList.getProductNo()%>">
                            </div>
                        </td>
                        <td>
                            <div class="discount"><%=df.format(cartList.getProductPrice()) %><p class="displaynone"></p>
</div>
                        </td>
                        <td><%=cartList.getCartQuantity() %><input type="hidden" name="productQty" value="<%=cartList.getCartQuantity() %>"></td>
                        
                        <td>
<strong><%=df.format(cartList.getProductPrice()*cartList.getCartQuantity())%></strong><div class="displaynone"></div>
</td>
<%totalsum = totalsum+cartList.getProductPrice()*cartList.getCartQuantity(); } %>
</tbody>
</table>
</div>
<div colspan="9" class="right" style="text-align: right;">
<% if(totalsum>50000){shippingfee=0;}else{shippingfee=2500;} %>
<span class="type">[기본배송]</span> 상품구매금액 <strong><%=df.format(totalsum) %><span class="displaynone"></span></strong>+ 배송비 <span id="domestic_ship_fee"><%=shippingfee %></span> = 합계 : <strong id="domestic_ship_fee_sum" class="total  txtStrong17B"><%=df.format(totalsum+shippingfee) %> </strong> <span class="displaynone"></span>
</div>

<br/>
<br/>

<!-- DELEVERY -->
<div class="orderArea">
    <div class="page-title"><h1>DELIVERY</h1></div>
    <table border="1" summary="">
	<caption>배송 정보 입력</caption>
 
 <colgroup>
<col style="width:139px;"/>
<col style="width:auto;"/>
</colgroup>

<tbody class="middle ">
	<tr class="">
		<td scope="row">배송지 선택
			<span class="gSpace"><input id="sameaddr" name="selectaddr"  type="radio"/><label for="sameaddr" >회원 정보와 동일</label>
			<input id="newaddr" name="selectaddr" value="F" type="radio"  /><label for="newaddr" >새로운 배송지</label></span>
	     </td>
    </tr>
    
	<tr>
		<td scope="row">받으시는 분 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/><br/>
		<input id="name" name="name" class="inputTypeText" placeholder="" size="15" value="" type="text"  /><br>
   		 <span id="nameMsg" class="error">이름을 입력해 주세요.</span>
		</td>
    </tr>
    <tr>
    </tr>
    
	<tr>
		<td scope="row">
			<label>주소</label> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/><br/>
	        <input id="zipcode" name="zipcode"  size="6" readonly="readonly"type="text"  /> 
	        <input type="button" id="zip" onclick="sample6_execDaumPostcode()" value="우편번호" style="background-color: #fff; border: 1px solid gray; padding: 3px; cursor: pointer; color: gray; border-radius:5px; "><br/>
	        <span id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</span>
	        <label for="address1"  class="gSingle">기본주소<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/></label><br/> 
	        <input type="text" id="address1" name="address1" size="50" class="inputTypeText"  size="50" readonly="readonly"   />
	        <span id="address1Msg" class="error">기본주소를 입력해 주세요.</span>
	        <label for="address2" class="gSingle">나머지주소 (선택입력가능)</label>
	        <br/><input id="address2" name="address2" size="40" type="text"  />  
    	</td>
    </tr>
    
  	<!-- 휴대전화 -->
	<tr class="">
		<td scope="row">휴대전화<span class=""> <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/><br/></span>
        	<select id="rphone2_1" name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
			<input id="phone2" name="phone2" maxlength="4"  size="4" value="" type="text"  />-<input id="phone3" name="phone3" maxlength="4" size="4" value="" type="text"  /><br/>
  			<span id="phoneMsg" class="error">전화번호를 입력해 입력해 주세요.</span>
			<span id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해주세요.</span>
			</td>
   </tr>
</tbody>
    
 

<!-- 이메일 -->
<tbody class="ec-shop-deliverySimpleForm">
	<tr>
		<td scope="row">이메일 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif" alt="필수"/><br/>
        <input id="email" name="email" class="mailId" value="" type="text"  />@<input id="email2" name="email2" class="mailAddress" readonly="readonly" value="" type="text"  />
        <select id="oemail3">
			<option value="" selected="selected">- 이메일 선택 -</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="nate.com">nate.com</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="yahoo.com">yahoo.com</option>
			<option value="empas.com">empas.com</option>
			<option value="korea.com">korea.com</option>
			<option value="dreamwiz.com">dreamwiz.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="etc">직접입력</option>
			</select><br/>  
		<span id="emailMsg" class="error">이메일을 입력해 주세요.</span>
		</td>
	</tr>
</tbody>

<!--배송메시지 -->
<tbody class="">
	<tr class="">
		<td scope="row">
		<br/>배송메시지 <br/>
        <textarea id="omessage" name="omessage" maxlength="255" cols="70" rows="3" style="resize: none; border: 1px solid gray; outline: none"></textarea>                        
        <div class="gSingle displaynone"></div>
        </td>
	</tr>
</tbody>

</table>
</div>

<!-- payment -->
<div class="page-title">
    <h1>PAYMENT</h1>
</div>

<div class="totalArea">
<div class="gStrong">
<table border="1" summary="">

<caption>결제 예정 금액</caption>
<colgroup>
<col style="width:auto;"/>
<col style="width:34%;"/>
<col style="width:33%;"/>
</colgroup>

<tr>
	<th scope="col">
	<strong>총 주문 금액</strong> 
	</th>
    <th scope="col" class=""><strong>총 <span id="total_addsale_text" class="">할인</span><span id="plus_mark" class=""></span><span id="total_addpay_text" class=""></span><span> 금액</span></strong></th>
    <th scope="col"><strong>총 결제예정 금액</strong></th>
    </tr>


<tbody class="center">
	<tr>
		<td class="price">
			<span class=" txtOrder"><strong id="total_order_price_view"><%=df.format(totalsum) %></strong> <span class="tail displaynone"><span id="total_order_price_ref_view"></span></span></span>
		</td>
		<td class="">
			<span class=" txtOrder"><strong>-</strong><strong id="total_sale_price_view">0</strong> <span class="tail displaynone"><span id="total_sale_price_ref_view"></span></span></span>
		</td>
	    <td>
	    <span class="total  txtOrderTotal"><strong>=</strong><strong id="total_order_sale_price_view" name="orderPrice"><%=df.format(totalsum+shippingfee) %></strong> <span class="tail displaynone"><span id="total_order_sale_price_ref_view"></span></span></span>
	    </td>
	</tr>
</tbody>
</table>
</div>
<br>
<div class="payArea gStrong">
        <div class="payment" style="float: left;">
	      <span>결제수단 >> </span><input type="radio" id="creadit_card" name="creadit_card" value="1"  checked="checked" />&nbsp;<button style="background: #fff; border: 1px solid gray; color: gray;">신용카드</button>
	    </div>
 </div>
 <br/>
		<div style="float: left;">
			<span class="gSingle" id="pg_paymethod_info_pg">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span>
		</div>
 </div>
 <br>
 <br>
 <br>
 
 <!-- 최종결제금액 -->
        <div class="total" style="float: left; font-style: bold;" >
        <span> 최종결제 금액</span>
            <input id="total_price"  name="total_price" class="inputTypeText" placeholder="" style="text-align:right;ime-mode:disabled;clear:none;border:0px;float:none;" size="10" readonly="1" value="<%=df.format(totalsum+shippingfee) %>" type="text"  /> 원
            <input type="hidden" name="totalPrice" value="<%=totalsum+shippingfee%>">
 		</div>
 		<br/>
<!-- 결제하기  -->
		 <div class="button">
		 	<button type="button" id="orderBtn" class="btnCheckout" style="width:100%" onclick="orderSubmit(1)"><span id="button-addtobag">주문하기</span></button>
		 	<hr>
		 	<button type="button" id="paymentBtn" class="btnCheckout" style="width:100%" onclick="orderSubmit(2)"><span id="button-addtobag">결제하기</span></button>
		 </div>
</form>
            
<!-- 이용안내 -->
	<div class="helpTheme" style="text-align: left;">
    <br>
    <h3>이용안내</h3>
    <hr>
		<div class="">
         <h4>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h4>
         	<ul>
				<li class="item1 "><strong>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</strong></li>
                <li class="item2 ">결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능</li>
                <li class="item3 ">최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br/>(무통장, 휴대폰결제 포함)</li>
           </ul>
		</div>

<!-- 세금계산서 발행 안내 -->
<div>
        <div>
        <br>
         <h4>세금계산서 발행 안내</h4>
         	<ul>
				<li class="item1">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
                <li class="item2">세금계산서는 사업자만 신청하실 수 있습니다.</li>
                <li class="item3">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
                <li class="item4">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
                <li class="item5">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
            </ul>
		</div>
<!-- 부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내 -->
        <br>
        <div>
        <h4>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</h4>
            <ul>
				<li class="item1">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행&gt;이 불가하며</li>
                <li class="item2">신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
                <li class="item3">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
            </ul>
		</div>
<!-- 현금영수증 이용안내 -->
        <br>
        <div>
        <h4>현금영수증 이용안내</h4>
            <ul>
				<li class="item1">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</li>
                <li class="item2">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
                <li class="item3">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
                <li class="item4">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
                <li class="item5">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
            </ul>
        </div>
</div>
</div>

<script type="text/javascript">
	function orderSubmit(orderStatus){
		$("input[name=order_status]").val(orderStatus);
		var msg = "";
		
		if(orderStatus == 1){
			msg = "주문하시겠습니까?";
		}else{
			msg = "결제하시겠습니까?";
		}
		
		if(confirm(msg)){
			document.getElementById("paymentForm").submit();
		}
	}
	
	$("#sameaddr").click(function() {
		$("#name").attr("value" , "<%=loginMember.getName()%>");
		$("#zipcode").attr("value" , "<%=loginMember.getZipcode()%>");
		$("#address1").attr("value" , "<%=loginMember.getAddress1()%>");
		$("#address2").attr("value" , "<%=loginMember.getAddress2()%>");
		<%String phone = loginMember.getPhone();
		String[] phoneNum = phone.split("-");
		String Num1=phoneNum[1];
		String Num2=phoneNum[2];%>
		$("#phone2").attr("value" , "<%=Num1%>");
		$("#phone3").attr("value" , "<%=Num2%>");
		<%String email = loginMember.getEmail();
		String[] emailsp = email.split("@");
		String em1 = emailsp[0];
		String em2 = emailsp[1];
		%>
		$("#email").attr("value" , "<%=em1%>");
		$("#email2").attr("value" , "<%=em2%>");
	});
	
	$("#newaddr").click(function() {
		$("#name").attr("value" , "");
		$("#zipcode").attr("value" , "");
		$("#address1").attr("value" , "");
		$("#addrdss2").attr("value" , "");
		$("#phone2").attr("value" , "");
		$("#phone3").attr("value" , "");
		$("#email").attr("value" , "");
		$("#email2").attr("value" , "");
	});
	
	
$("#paymentForm").submit(function() {
		var submitResult=true;
		
		$(".error").css("display","none");
		if($("#name").val()=="") {
			$("#nameMsg").css("display","block");
			submitResult=false;
		}
		
		if($("#email").val()=="") {
			$("#emailMsg").css("display","block");
			submitResult=false;
		} 
		
		if($("#zipcode").val()=="") {
			$("#zipcodeMsg").css("display","block");
			submitResult=false;
		}
			
		if($("#address1").val()=="") {
			$("#address1Msg").css("display","block");
			submitResult=false;
		}
		
		
		var phone2Reg=/\d{3,4}/;
		var phone3Reg=/\d{4}/;
		if($("#phone2").val()=="" || $("#phone3").val()=="") {
			$("#phoneMsg").css("display","block");
			submitResult=false;
		} else if(!phone2Reg.test($("#phone2").val()) || !mobile3Reg.test($("#phone3").val())) {
			$("#phoneRegMsg").css("display","block");
			submitResult=false;
		}
		
		return submitResult;
	});	
	
		
		

</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                             
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
               
                if(data.userSelectedType === 'R'){
                  
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>
 

