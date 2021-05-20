<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    
    #complete {
    background: transparent;
    border: 1px solid #6a696c;
    padding: 0px 0px 6px;
    padding: 2px 10px 2px;
    idth: 100px;
    display: inline-block;
    letter-spacing: 0.2em;
    color: #6a696c;
    font-size: 12px;
    text-align: center;
    transition: background-color 0.2s ease;
}
</style>
<%-- 회원정보 변경 또는 탈퇴를 위해 비밀번호를 입력하는 JSP 문서 --%>    
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%@include file="/security/login_check.jspf" %>
<%
	String action=request.getParameter("action");

	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
%>
<form name="passwdForm" method="post">
	<% if(action.equals("modify")) { %>
	<p>회원정보 변경을 위한 비밀번호를 입력해 주세요.</p>
	<% } else if(action.equals("remove")) { %>
	<p>회원 탈퇴를 위한 비밀번호를 입력해 주세요.</p>
	<% } %>
	<p>
		<input type="password" name="passwd">
		<button type="button" onclick="submitCheck();" id ="complete" >입력완료</button>
	</p>
	<p id="message" style="color: red;"><%=message %></p>	
</form>
 
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 $(function(){
	  //
	  $("#complete").click(function(){
		         		  
		    alert("처리완료되었습니다.");
	  });
 });
 </script>
 
<script type="text/javascript">
passwdForm.passwd.focus();

function submitCheck() {
	if(passwdForm.passwd.value=="") {
		document.getElementById("message").innerHTML="비밀번호를 입력해 주세요.";
		passwdForm.passwd.focus();
		return;
	}
	
	<% if(action.equals("modify")) { %>
	passwdForm.action="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_modify";
	<% } else if(action.equals("remove")) { %>
	passwdForm.action="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_remove_action";
	<% } %>
	
	passwdForm.submit();
}
</script>











