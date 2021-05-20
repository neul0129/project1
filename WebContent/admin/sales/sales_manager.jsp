<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dto.shopOrderJoinDTO"%>
<%@page import="site.margaret.dao.ShopOrderDAO"%>
<%@page import="site.margaret.dto.ShopOrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	DecimalFormat dfno = new DecimalFormat("###,###,###");

	Calendar cal = Calendar.getInstance();
    cal.setTime(new Date());
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat uf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    String currentDate = df.format(cal.getTime());
    String updateDate = uf.format(cal.getTime());
    
    int[] num = new int[3];
    int ordercount=0,ordertotal=0,refundtotal=0;
    int[] ordercountList = new int[180];
    int[] ordertotalList = new int[180];
    int[] refundtotalList = new int[180];
    String[] dateList = new String[180];

	
	//전달값 검증
	String ord_start_date = request.getParameter("ord_start_date");
	if(ord_start_date == null){
		cal.setTime(new Date()); cal.add(Calendar.DATE, -7);
		ord_start_date = df.format(cal.getTime());
	}
	
	String ord_end_date = request.getParameter("ord_end_date");
	if(ord_end_date == null){
		ord_end_date =currentDate;
	}
	
	String go = request.getParameter("go");
	if(go==null){
		go="7";
	}  
	
	for(int i = 0 ; i<Integer.parseInt(go); i++){
		cal.setTime(new Date()); cal.add(Calendar.DATE, -i);
		dateList[i] = df.format(cal.getTime());
		
	//주문수와 총매출 검색
    List<shopOrderJoinDTO> paymentcompleteList = ShopOrderDAO.getDAO().selectPaymentComplete(1,dateList[i]);
    for(shopOrderJoinDTO paymentcomplete : paymentcompleteList ){
    	ordercount++;
    	ordertotal += paymentcomplete.getProductPrice();
    }
        
    ordercountList[i] = ordercount;
    
    ordertotalList[i] = ordertotal;
    ordercount = 0;
    ordertotal = 0;
    
    //환불 검색
    paymentcompleteList = ShopOrderDAO.getDAO().selectPaymentComplete(2,dateList[i]);
    for(shopOrderJoinDTO paymentcomplete : paymentcompleteList ){
    	refundtotal += paymentcomplete.getProductPrice();
    }
    refundtotalList[i] = refundtotal;
    refundtotal = 0;
	}
    
	int orco =0, orTo=0,rfTo=0;
	
%>

<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	width: 100px; padding : 20px;
	text-align: center;
	padding: 20px;
}
</style>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">매출 분석</h1>

<!-- DataTales Example -->
<form action="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=sales&work=sales_manager"  name="periodForm" method="post">
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0" style="text-align: left;">
				<tr>
					<th style="width: 200px !important;">기간</th>
					<td colspan="5" style="text-align: left !important;"><div
							class="btn-group" role="group"
							aria-label="Basic outlined example">
							<button type="button" id="go"   class="btn btn-outline-primary" ><input type="hidden" value="1" id="g1" name="g"> 오늘</button>
							<button type="button" id="go3" class="btn btn-outline-primary" ><input type="hidden" value="3" id="g3" name="g">3일</button>
							<button type="button" id="go7" class="btn btn-outline-primary" ><input type="hidden" value="7" id="g7" name="g">7일</button>
							<button type="button" id="go30" class="btn btn-outline-primary" ><input type="hidden" value="30" id="g30" name="g">1개월</button>
							<button type="button" id="go90"  class="btn btn-outline-primary" ><input type="hidden" value="90" id="g90"  name="g">3개월</button>
							<button type="button" id="go180" class="btn btn-outline-primary" ><input type="hidden" value="180" id="g180" name="g">6개월</button>
						</div>
						<input type="date" id="ord_start_date" name="ord_start_date" value="<%=request.getParameter("ord_start_date")%>"> ~ <input
						type="date" name="ord_end_date" value="<%=currentDate%>"></td>
				</tr>
			</table>
			<div style="text-align: center;">
				<button type="button" id="searchperiod" name="searchperiod" class="btn btn-primary">검색</button>
			</div>
		</div>
	</div>
</div>
</form>
<!-- Content Row -->
<div class="row">

	<div class="col-xl-12 col-lg-12">

		<!-- Area Chart -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">통계 그래프</h6>
			</div>
			<div class="card-body">
				<div id="columnchart_material" style="width: 100%; height: 500px;"></div>
				<hr>
			</div>
		</div>
	</div>
</div>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">[업데이트: <%=updateDate %> ]</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead style="background-color: #f3f3f3;">
					<tr>
						<th rowspan="2">일자</th>
						<th colspan="3">결제완료 주문</th>
						<th rowspan="2">결제합계</th>
						<th rowspan="2">환불합계</th>
						<th rowspan="2">순매출</th>

					</tr>
					<tr>
						<th>주문수</th>
						<th>상품구매금액</th>
						<th>배송비</th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0 ; i<Integer.parseInt(go); i++) {%>
					<tr>
						<th><%=dateList[i] %></th>
						<th><%=dfno.format(ordercountList[i]) %></th>
						<th><%=dfno.format(ordertotalList[i]) %></th>
						<th>0</th>
						<th><%=dfno.format(ordertotalList[i]) %></th>
						<th><%=dfno.format(refundtotalList[i]) %></th>
						<th><%=dfno.format(ordertotalList[i] - refundtotalList[i]) %></th>
						<%orco+= ordercountList[i]; orTo+= ordertotalList[i]; rfTo+= refundtotalList[i]; %>
					</tr>
					<%} %>
				</tbody>
				<tfoot>
					<tr>
						<th>합계</th>
						<th><%=dfno.format(orco) %></th>
						<th><%=dfno.format(orTo) %></th>
						<th>0</th>
						<th><%=dfno.format(orTo) %></th>
						<th><%=dfno.format(rfTo) %></th>
						<th><%=dfno.format(orTo-rfTo) %></th>
					</tr>
				</tfoot>
			</table>
			
	<div>&nbsp;</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$("#go").on({
	"click":function() {
		$("#ord_start_date").attr("value", "<%=currentDate%>");
		$("#g1").attr("name","go");
		$("#g3").attr("name","g");
		$("#g7").attr("name","g");
		$("#g30").attr("name","g");
		$("#g90").attr("name","g");
		$("#g180").attr("name","g");
	}
});
$("#go3").on({
	"click":function() {
		$("#ord_start_date").attr("value", "<%cal.setTime(new Date()); cal.add(Calendar.DATE, -3); %><%=df.format(cal.getTime())%>");
		$("#g1").attr("name","g");
		$("#g3").attr("name","go");
		$("#g7").attr("name","g");
		$("#g30").attr("name","g");
		$("#g90").attr("name","g");
		$("#g180").attr("name","g");
	}
});
$("#go7").on({
	"click":function() {
		$("#ord_start_date").attr("value", "<%cal.setTime(new Date()); cal.add(Calendar.DATE, -7); %><%=df.format(cal.getTime())%>");
		$("#g1").attr("name","g");
		$("#g3").attr("name","g");
		$("#g7").attr("name","go");
		$("#g30").attr("name","g");
		$("#g90").attr("name","g");
		$("#g180").attr("name","g");
	}
});
$("#go30").on({
	"click":function() {
		$("#ord_start_date").attr("value", "<%cal.setTime(new Date()); cal.add(Calendar.DATE, -30); %><%=df.format(cal.getTime())%>");
		$("#g1").attr("name","g");
		$("#g3").attr("name","g");
		$("#g7").attr("name","g");
		$("#g30").attr("name","go");
		$("#g90").attr("name","g");
		$("#g180").attr("name","g");
	}
});
$("#go90").on({
	"click":function() {
		$("#ord_start_date").attr("value", "<%cal.setTime(new Date()); cal.add(Calendar.DATE, -90); %><%=df.format(cal.getTime())%>");
		$("#g1").attr("name","g");
		$("#g3").attr("name","g");
		$("#g7").attr("name","g");
		$("#g30").attr("name","g");
		$("#g90").attr("name","go");
		$("#g180").attr("name","g");
	}
});
$("#go180").on({
	"click":function() {
		$("#ord_start_date").attr("value", "<%cal.setTime(new Date()); cal.add(Calendar.DATE, -180); %><%=df.format(cal.getTime())%>");
		$("#g1").attr("name","g");
		$("#g3").attr("name","g");
		$("#g7").attr("name","g");
		$("#g30").attr("name","g");
		$("#g90").attr("name","g");
		$("#g180").attr("name","go");
	}
});
$("#searchperiod").click(function() {
	periodForm.submit();
});
</script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['', '판매', '환불', '수익']
          <%for(int i = Integer.parseInt(go)-1 ; i>=0; i--) {%>
          ,['<%=dateList[i] %>', <%=ordertotalList[i]%>, <%=refundtotalList[i] %>, <%=ordertotalList[i] - refundtotalList[i]%>]
          <%}%>
        ]);

        var options = {

        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
</script>


