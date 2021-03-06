<%@page import="site.margaret.dao.ReplyDAO"%>
<%@page import="site.margaret.dto.ReplyDTO"%>
<%@page import="site.margaret.dto.MemberDTO"%>
<%@page import="site.margaret.dao.BoardDAO"%>
<%@page import="site.margaret.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%
	if(request.getParameter("boardNo")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	int boardNo=Integer.parseInt(request.getParameter("boardNo"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");

	BoardDTO board=BoardDAO.getDAO().selectNumboard(boardNo);
	
	if(board==null || board.getBoardStatus()==9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	
	if(board.getBoardStatus()==1) {
		if(loginMember==null || !loginMember.getId().equals(board.getId()) && loginMember.getStatus()!=9) {
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=member_login';");
			out.println("</script>");
			return;
		}
	}
	
	ReplyDTO reply= ReplyDAO.getDAO().selectNumReply(boardNo);
	
%>
<style type="text/css">
.title {
    min-height: 30px;
    margin: 0px 0 0px;
}
table {
width : 60%; 
border : border :1px solid #d7d5d5; 
border-spacing : 0;
border-collapse : collapse; 
text-align: left;
padding-left: 200px;
} 
caption {display : none;} 
.boardWait {
width: 50%;
margin : 60px; 
padding : 20px; 
border :1px solid #d7d5d5; 
font-size : 12px;
}
.xans-board-read-9 .boardWait p, .xans-board-read-9 table tr.view .detail p {font-size : 11px! important; text- transform : uppercase;}
#contents {
	width: 1300px;
}

h2 {
	text-align: left;
}

button {
	border: 0;
	outline: 0;
	background-color: white;
	color: gray;
	cursor: pointer;
}

th, td {
    border:1px solid #d7d5d5; 
    vertical-align: middle;
    height: 50px;
}
th{
	text-align: center;
}

.td {float : left; padding : 0px 10px 8px 10px;}

li {
	list-style: none;
}

#replytable {
	height: 30px;
	padding: 10px 10px 10px 10px;
}
#modify_delete{
position: absolute;
    right: 260px;
}
</style>
<div id="contents" class="contents_qna">
<div class="xans-element- xans-board xans-board-readpackage-9 xans-board-readpackage xans-board-9 "><div class="xans-element- xans-board xans-board-title-9 xans-board-title xans-board-9 "></div>
<div class="title">
            <h2>Q&amp;A</h2>
</div>
<p class="imgArea"></p>
</div>


<div class="boardView">
<table border="1" summary="">
	<tr>
	<th scope="row">TITLE</th>
			<td> <% if(board.getBoardStatus()==1) { %>&nbsp;&nbsp;[?????????]<% } %>
				&nbsp;&nbsp;<%=board.getTitle() %>
			</td>
	</tr>
	
	<tr>
	<th scope="row">WRITER</th>
		<td class="edit2">
			&nbsp;&nbsp;<%=board.getId() %> 
		</td>
	</tr>
	
	<tr class="etcArea">
	<th scope="row">DATE</th>	
	<td>
		&nbsp;&nbsp;<%=board.getBoardDate().substring(0, 19) %>
	</td>
</tr>

<tr class="view">
	<td colspan="2">
	<p>	&nbsp;&nbsp;<%=board.getBoardContent().replace("\n", "<br>") %></p>
	</td>
</tr>
</table>
</div>

<div class="">
<form id="replydWriteForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=notice/question/reply&work=reply_action"
	method="post" id="replyForm" >
<input type="hidden" name="boardNo" value="<%=board.getBoardNo() %>"> 	
<% if(reply!=null) { %><input type="hidden" name="replyNo" value="<%=reply.getReplyNo() %>"> <% } %>

<%-- ?????? ?????? --%>
<div class="">
	<% if(loginMember.getStatus()==9) { //???????????? ?????? %>
		<% if(reply==null) { //????????? ?????? ?????? : ??????????????? %>
					<table class="replytable">
					<tr>
						<td><textarea name="replyContent" rows="3" cols="130" id="content" class="replytable" style="resize: none; border: 0; width: 90%; outline: none">????????? ??????????????????</textarea></td>
				        <td colspan="2" class="button"><button type="submit" id="add_btn" style="width: 100px;">????????????</button></td>
				   </tr>
				    </table>
				<% }else { //????????? ?????? ?????? : ?????? ????????? %>
			   <table>
				   <tr class="replytable">
						<td>
						<td><textarea name="replyContent" rows="3" cols="120" id="content" class="replytable" style="resize: none; border: 0; width: 90%; outline: none"><%= reply.getReplyContent() %></textarea>
						</td>
						<td><span><button type="button" id="reply_modify_btn" style="width: 80px;" >????????????</button></span></td>
						<td><span><button type="button" id="reply_delete_btn" style="width: 80px;">????????????</button></span></td>
					</tr>  
			 	</table>
			 	<% } %>
	<% } else if(loginMember.getStatus()==1) {//?????? ????????? ???????????? ??????  %>
				<% if(reply!=null) { %>
				<table class="replytable">
					<tr>
						<th scope="row" style="width: 40%;"><%=board.getId() %> ?????? ?????? ?????? ?????? ?????? ?????? </th>
						<td>&nbsp;&nbsp;<%= reply.getReplyContent() %></td>
					 </tr>
					 <tr>
					 <td colspan="2" style="text-align: right; height: 20px; font-style: italic; border: none;">(<%=reply.getReplyDate().substring(0, 16) %> by ??????????????? margarethowell)</td>
					 </tr>
	            </table>
	            <% } else { %>
	            <table class="replytable">
					<tr>
					<th scope="row" style="width: 40%;"><%=board.getId() %> ?????? ?????? ?????? ?????? ?????? ?????? </th>
					<td>&nbsp;&nbsp;?????? ?????? ?????? ?????? ??????????????????. ????????? ????????? ?????????!</td>
					 </tr>
	            </table>
	            <% } %>
	 <% } %>
		
 </div>
 </form>
</div>
 <br>
 
 <div id="board_menu">
 		
 		<a href="index.jsp?workgroup=notice/question&work=question_list"><button type="button" style="float: left" >?????????</button></a>
		<% if(loginMember!=null && (loginMember.getId().equals(board.getId()) 
				|| loginMember.getStatus()==9)) { %>
		<span id="modify_delete">
		<button type="button" id="removeBtn">?????????</button>
		<button type="button" id="modifyBtn">?????????</button>
		</span>
		<% } %>
</div>       
</div>

<form id="boardForm" method="post">
		<input type="hidden" name="boardNo" value="<%=board.getBoardNo() %>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="search" value="<%=search%>">
		<input type="hidden" name="keyword" value="<%=keyword%>">
</form>
	
<script type="text/javascript">
	$("#removeBtn").click(function() {
		if(confirm("???????????? ????????? ?????? ???????????????????")) {
			$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=notice/question&work=question_remove_action");
			$("#boardForm").submit();		
		}
	});
	$("#modifyBtn").click(function() {
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=notice/question&work=question_modify");
		$("#boardForm").submit();	
	});
	
	$("#reply_delete_btn").click(function() {
		if(confirm("????????? ?????? ???????????????????")) {
			$("#replydWriteForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=notice/question/reply&work=reply_remove_action");
			$("#replydWriteForm").submit();		
		}
	});
	$("#reply_modify_btn").click(function() {
		$("#replydWriteForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=notice/question/reply&work=reply_modify_action");
		$("#replydWriteForm").submit();	
	});
		
</script>
	
