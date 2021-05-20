<%@page import="site.margaret.dto.MemberDTO"%>
<%@page import="site.margaret.dao.MemberDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

//오늘 날짜
	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	//검색 관련 전달값을 반환받아 저장
	String search_type = request.getParameter("search_type");//검색어(이름, 아이디, 등등)
	if (search_type == null)
		search_type = "";
	String type = request.getParameter("type");//검색어(검색값)
	if (type == null)
		type = "";
	
	String sales_type = request.getParameter("sales_type");//구매건수 전달값이 있으면 주문일 필수입력
	if (sales_type == null)
		sales_type = "";
	String min_sales_amount = request.getParameter("min_sales_amount");//검색어(검색값)
	if (min_sales_amount == null)
		min_sales_amount = "";
	String max_sales_amount = request.getParameter("max_sales_amount");//검색어(검색값)
	if (max_sales_amount == null)
		max_sales_amount = "";
	
	String ord_date_kind = request.getParameter("ord_date_kind");//주문일
	if (ord_date_kind == null)
		ord_date_kind = "";
	String ord_start_date = request.getParameter("ord_start_date");//검색어(검색값)
	if (ord_start_date == null)
		ord_start_date = "";
	String ord_end_date = request.getParameter("ord_end_date");//검색어(검색값)
	if (ord_end_date == null)
		ord_end_date = "";
	
	int pageNum=1;
	if(request.getParameter("pageNum")!=null) {//전달값이 존재하는 경우
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=2;
	
	int totalmember=MemberDAO.getDAO().selectmemberCount(search_type, type, sales_type, min_sales_amount, max_sales_amount, ord_date_kind, ord_start_date, ord_end_date);
	
	int totalPage=(int)Math.ceil((double)totalmember/pageSize);
	
	if(pageNum<=0 || pageNum>totalPage) {
		pageNum=1;
	}
	
	int startRow=(pageNum-1)*pageSize+1;
 	
	int endRow=pageNum*pageSize;

	if(endRow>totalmember) {
		endRow=totalmember;
	}
	
	List<MemberDTO> memberList=MemberDAO.getDAO().selectMemberList(startRow, endRow, search_type, type, sales_type, min_sales_amount, max_sales_amount, ord_date_kind, ord_start_date, ord_end_date);
			
	
	int number=totalmember-(pageNum-1)*pageSize;
	
%>
<style>
</style>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800"
	style="margin: 2.5rem .5rem 3.0rem .5rem !important;">회원관리</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-body">
		<form
			action="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_manager"
			method="post" name="searchForm">
			<div class="table-responsive">

				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0" style="text-align: left;">
					<tr>
						<th width="200px">검색어</th>
						<td colspan="5"><select name="search_type" >
								<option value='name' <% if(search_type.equals("name")) {%> selected="selected"<%} %>>이름</option>
								<option value='id' <% if(search_type.equals("id") || search_type.equals("")) {%> selected="selected"<%} %>>아이디</option>
								<option value='email' <% if(search_type.equals("email")) {%> selected="selected"<%} %>>이메일</option>
								<option value='phone'<% if(search_type.equals("phone")) {%> selected="selected"<%} %>>전화번호</option>
								<option value='mobile' <% if(search_type.equals("moblie")) {%> selected="selected"<%} %>>휴대폰번호</option>
						</select> <input type="text" name="type" value="<%=type %>" class="fText"
							style="width: 240px;" /></td>
					</tr>
					<tr>
						<th>구매금액/건수</th>
						<td colspan="5"><select id="sales_type" name="sales_type">
								<option value="" <% if(sales_type.equals("")) {%> selected="selected"<%} %>>전체</option>
								<option value='3' <% if(sales_type.equals("3")) {%> selected="selected"<%} %>>총 주문금액</option>
								<option value='4' <% if(sales_type.equals("4")) {%> selected="selected"<%} %>>총 실결제금액</option>
								<option value='2' <% if(sales_type.equals("2")) {%> selected="selected"<%} %>>총 주문건수</option>
								<option value='5' <% if(sales_type.equals("5")) {%> selected="selected"<%} %>>총 실주문건수</option>
						</select> <div id="salesperiod" name="salesperiod" <% if(sales_type.equals("")) {%> style="display: none;"<%} else {%>style="display: inline;" <%} %>><input type="text" name="min_sales_amount" size="8" value="<%=min_sales_amount%>">원 ~ <input
							type="text" name="max_sales_amount" size="8" value="<%=max_sales_amount%>">원</div></td>
					</tr>
					<tr>
						<th>주문일/결제완료일</th>
						<td colspan="5"><select id="ord_date_kind"
							name="ord_date_kind" class="fSelect">
								<option value="order_date" <% if(ord_date_kind.equals("order_date")) {%> selected="selected"<%} %>>주문일</option>
								<option value="pay_date" <% if(ord_date_kind.equals("pay_date")) {%> selected="selected"<%} %>>결제완료일</option>
						</select> <input type="date" id="ord_start_date"  name="ord_start_date" value="<%=ord_start_date%>"> ~ <input
							type="date" id="ord_end_date" name="ord_end_date" value="<%=ord_end_date%>"></td>
					</tr>
				</table>

				<div style="text-align: center;">
					<button type="button" id="msearch" class="btn btn-primary">검색</button>
				</div>
		</form>
	</div>
</div>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
		<form name="memberForm" id="memberForm">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck" class="allCheck"></th>
						<th width="120px">아이디</th>
						<th width="100px">이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>가입일</th>
						<th>로그인날짜</th>
						<th>회원상태</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th><input type="checkbox" id="allCheck" class="allCheck"></th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>가입일</th>
						<th>로그인날짜</th>
						<th>회원상태</th>
					</tr>
				</tfoot>
				<tbody>
					<%
						if (memberList.isEmpty()) {
					%>
					<tr>
						<td colspan="9">등록된 회원이 한명도 없습니다.</td>
					</tr>
					<% } else { %>
					<% for(MemberDTO member:memberList) { %>
					<tr>
						<td class="member_check">
							<% if(member.getStatus()==9) { %>
								관리자
							<% } else { %>
								<input type="checkbox" name="checkId" value="<%=member.getId()%>" class="check">
							<% } %>
						</td>
						<td class="member_id"><%=member.getId() %></td>
						<td class="member_name"><%=member.getName() %></td>
						<td class="member_email"><%=member.getEmail() %></td>
						<td class="member_mobile"><%=member.getPhone() %></td>
						<td class="member_address">
							[<%=member.getZipcode() %>]<%=member.getAddress1() %> <%=member.getAddress2() %>
						</td>
						<td class="member_join"><%=member.getJoindate().substring(0, 19) %></td>
						<td class="member_login">
							<% if(member.getLastLogin()!=null) { %>
								<%=member.getLastLogin().substring(0, 19) %>
							<% } %>
						</td>
						<td class="member_status">
							<select class="status" name="<%=member.getId()%>">
								<option value="1" <% if(member.getStatus()==1) { %> selected="selected" <% } %>>
									일반회원
								</option>
								<option value="9" <% if(member.getStatus()==9) { %> selected="selected" <% } %>>
									관리자
								</option>
							</select>
						</td>
					</tr>
					<%}%>
					<%}%>
				</tbody>
			</table>
			<div>
			<%-- 페이지 번호 출력(페이징 처리) --%>
	<%
		//페이지 블럭에 출력될 페이지 번호의 갯수 설정
		int blockSize=5;
	
		//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
		// => 1 Block : 1, 2 Block : 6, 3 Block : 11, 4 Block : 16, ...
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		                 
		//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
		// => 1 Block : 5, 2 Block : 10, 3 Block : 15, 4 Block : 20, ...
		int endPage=startPage+blockSize-1;
		
		//마지막 페이지 블럭의 종료 페이지 번호 변경
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>
	<div style="text-align: center;">
	<% if(startPage>blockSize) { %>
		<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_manager&pageNum=1&search_type=<%=search_type%>&type=<%=type%>">[처음]</a>
		<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_manager&pageNum=<%=startPage-blockSize%>&search_type=<%=search_type%>&type=<%=type%>">[이전]</a>
	<% } else { %>
		[처음][이전]	
	<% } %>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) { %>
			<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_manager&pageNum=<%=i%>&search_type=<%=search_type%>&type=<%=type%>&ord_date_kind=<%=ord_date_kind %>&ord_start_date=<%=ord_start_date %>&ord_end_date=<%=ord_end_date %>">[<%=i %>]</a>
		<% } else { %>
			[<%=i %>]
		<% } %>
	<% } %> 
	
	<% if(endPage!=totalPage) { %>
		<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_manager&pageNum=<%=startPage+blockSize%>&search_type=<%=search_type%>&type=<%=type%>">[다음]</a>
		<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_manager&pageNum=<%=totalPage%>&search_type=<%=search_type%>&type=<%=type%>">[마지막]</a>
	<% } else { %>
		[다음][마지막]	
	<% } %>
	</div>
	<div>&nbsp;</div>
			</div>
			<p style="text-align: center;"><button type="button" id="removeBtn" class="btn btn-primary" >선택회원삭제</button></p>
			<div id="message" style="color: red; text-align: center; " ></div>
			</form>
			
		</div>
	</div>
</div>
<script type="text/javascript">
document.getElementById("msearch").onclick = function() {
	if(searchForm.sales_type.value != ""){
		if(searchForm.ord_start_date.value == "" && searchForm.ord_start_date.value == ""){
			alert("주문일을 선택하여 주세요.");
			return;
		}
		
	if($("#ord_start_date").val() != "" && $("#ord_end_date").val() == ""){
		$("#ord_end_date").attr("value", $("#ord_start_date").val());
		}
	
	} else {
		if($("#ord_start_date").val() != "" && $("#ord_end_date").val() == ""){
			$("#ord_end_date").attr("value", "<%=currentDate%>");
			}
	}
	
	
	searchForm.submit();
}


$("#sales_type").change(function() {
	if(searchForm.sales_type.value != ""){
		$("#salesperiod").attr("style","display : inline;");
	} else {
		$("#salesperiod").attr("style","display : none;");
	}
		
});

</script>

<script type="text/javascript">
$(".allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);		
	} else {
		$(".check").prop("checked",false);		
	}
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").length ==0) {
		$("#message").text("선택한 회원이 하나도 없습니다.");
		return;
	}
	
	$("#memberForm").attr("method","post");
	$("#memberForm").attr("action","<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_remove_action");
	$("#memberForm").submit();
});

$(".status").change(function() {
	var id=$(this).attr("name");
	var status=$(this).val();
	location.href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=member&work=member_status_action&id="+id+"&status="+status;
});
</script>
