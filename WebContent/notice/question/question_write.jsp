<%@page import="site.margaret.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%
	String pageNum="1";
	int boardNo=BoardDAO.getDAO().selectNextNum();
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


<form id="boardWriteForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=notice/question&work=question_write_action"
	method="post" id="boardForm"target="_self"  >
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<div class="boardWrite">
<table border="1" summary="" style="display: inline-block;">


<tr class="first">
<th scope="row" >TITLE</th>
	<td> <input id="title" name="title" class="inputTypeText" maxLength="125" value="" type="text"  />  
	<input type="checkbox" name="secret" value="1">비밀글
	</td>
</tr>

<tr>
		<td colspan="2"><textarea id="content" rows="30" cols="130"  name="boardContent" maxlength="2048" style="width:100%; resize: none;"></textarea></td>
</tr>	
</table>

</div>

<div class="btnArea">
	<button type="submit" id="submitBtn"><span class="buttonG">SUBMIT</span></button>
</div>
</form>
</div>
</div>



<script type="text/javascript">
$("#title").focus();

$("#submitBtn").click(function() {
	if($("#title").val()=="") {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
	
	if($("#content").val()=="") {
		 alert("내용을 입력해주세요");
		$("#content").focus();
		return false;
	}
});

</script>