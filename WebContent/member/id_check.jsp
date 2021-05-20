<%@page import="site.margaret.dao.MemberDAO"%>
<%@page import="site.margaret.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%    
    //비정상적인 요청에 대한 응답
	if(request.getParameter("id")==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
    //전달값을 반환받아 저장
	String id=request.getParameter("id");
    
	//아이디를 이용하여 MEMBER 테이블에 저장된 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 아이디 사용 가능
	// => 회원정보 반환 : 회원정보 검색 - 아이디 사용 불가능
	MemberDTO member =MemberDAO.getDAO().selectIdMember(id);	
	
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
div {
	text-align: center;
	margin: 12px;
}	

.id { color: red; }
</style>
</head>

<body>
	<% if(member==null) {  %>
	<div>입력한<span class="id">[<%=id%>]</span>는 사용가능한 아이디 입니다.</div>
	<div><button type="button" onclick="windowClose();">아이디 사용</button></div>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
	function windowClose() {
		//opener 객체 : 부모창을 표현하는 자바스크립트 객체
		opener.joinForm.id.value="<%=id%>";
		opener.joinForm.idCheckResult.value="1";
		window.close();
	}
	</script>
	<% } else {//아이디가 사용 불가능한 경우 %>
	<div id="message">입력한 <span class="id">[<%=id %>]</span>는 이미 사용중인 아이디 입니다.<br>
	다른 아이디를 입력하고 [확인]을 눌러주세요.</div>
	<div>
	<form name="checkForm">
	<input type="text" name="id">
	<button type="button" id="submitBtn">확인</button>
	</form>
	</div>
	
	<script type="text/javascript">
	document.getElementById("submitBtn").onclick=function() {
		var id=checkForm.id.value;
		if(id=="") {
			document.getElementById("message").innerHTML="아이디를 입력해 주세요";
			document.getElementById("message").style="color: red;"
			return;
		}
		
		var idReg=/^[a-zA-Z]\w{5,19}$/g;
		if(!idReg.test(id)) {
			document.getElementById("message").innerHTML="아이디는 영문자로 시작되는 영문자,숫자,_의 6~20범위의 문자로만 작성 가능합니다.";
			document.getElementById("message").style="color: red;"
			return;
		}
		
		checkForm.submit();
	}
	</script>
	<% } %>

</body>
</html>

