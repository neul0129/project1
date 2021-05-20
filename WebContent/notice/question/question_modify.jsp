<%@page import="site.margaret.dao.BoardDAO"%>
<%@page import="site.margaret.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>   
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
	
	if(!loginMember.getId().equals(board.getId()) && loginMember.getStatus()!=9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
%>

<style type="text/css">
* {
    margin: 0;
    padding: 0;
}

*, *:before, *:after {
    box-sizing: inherit;
}
.btnArea {
overflow : hidden; margin : 20px 0 50px; text-align : right; font-size : 12px; line-height : 30px;}
table {
	border-collapse : collapse;
	margin: 0 auto;
}
caption {display : none;}

#subject {
    width: 390px;
    height: 14px;
    padding: 3px;
}
th {
	width: 70px;
	font-weight: normal;
}

td {
    width: auto;
    padding: 10px 10px 8px 10px;
    border-top: 0px solid #e8e8e8;
    text-align: left;
}

body {
	margin: 0;
    padding: 0;
}
h2 {
	text-align: left;
}

button {
	border: 0;
	outline: 0;
	background-color: white;
	color: gray;
	padding-right: 70px;
	cursor: pointer;
}
</style>

 <div id="contents">
 <br>
 <br>
 <br>
 
<div class="xans-element- xans-board xans-board-writepackage-9 xans-board-writepackage xans-board-9 "><div class="xans-element- xans-board xans-board-title-9 xans-board-title xans-board-9 "><div class="title">
            <h2>Q&amp;A</h2>
            <hr>
            <br>
        </div>
<p class="imgArea"></p>
</div>


<form id="boardWriteForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=notice/question&work=question_modify_action"
	method="post" id="boardForm"target="_self" >
	<input type="hidden" name="boardNo" value="<%=boardNo%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="keyword" value="<%=keyword%>">
<div class="boardWrite">
<table border="1" summary="" style="display: inline-block;">


<tr class="first">
<th scope="row" >TITLE</th>
	<td> <input id="subject" name="title" class="inputTypeText" maxLength="125"  value="<%=board.getTitle()%>">  
	<input type="checkbox" name="title" value="1"<% if(board.getBoardStatus()==1) { %> checked="checked" <% } %>>비밀글
	</td>
</tr>

<tr>
		<td colspan="2"><textarea id="contents" rows="30" cols="130"  name="boardContent" maxlength="2048" style="width:100%; resize: none;"><%=board.getBoardContent()%></textarea></td>
</tr>	
</table>

</div>

<div class="btnArea">
	<button type="submit"><span class="buttonG">SUBMIT</span></button>
</div>
</form>
</div>
</div>
<div id="message" style="color: red;"></div>


<script type="text/javascript">
$("#subject").focus();

$("#boardForm").submit(function() {
	if($("#subject").val()=="") {
		$("#message").text("제목을 입력해 주세요");
		$("#subject").focus();
		return false;
	}
	
	if($("#contents").val()=="") {
		$("#message").text("내용을 입력해 주세요");
		$("#contents").focus();
		return false;
	}
});

</script>

