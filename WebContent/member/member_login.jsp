<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 로그인 인증정보를 입력받기 위한 JSP 문서 --%>
<%-- => [로그인]을 클릭한 경우 로그인 처리페이지(member_login_action.jsp) 이동 - 입력값 전달 --%>

<%
if (request.getParameter("state")!=null) {
	if (request.getParameter("state").equals("1")) {
		session.removeAttribute("url");
	}
}

String message = (String) session.getAttribute("message");
if (message == null) {
	message = "";
} else {
	session.removeAttribute("message");
}

String id = (String) session.getAttribute("id");
if (id == null) {
	id = "";
} else {
	session.removeAttribute("id");
}
%>



<style type="text/css">
.page-title {
	width: 100%;
	border-bottom: 1px solid #6A696C;
	padding-bottom: 15px;
	line-height: 20px;
	letter-spacing: 0.13em;
	margin-bottom: 25px;
	text-transform: uppercase;
	font-size: 14px;
}

.login_tag {
	margin: 5px auto;
	width: 300px;
	padding-top: 10px;
}

#login label {
	text-align: right;
	width: 100px;
	float: left;
}

#id, #passwd{
border: 1px solid #6A696C;
    padding: 2px;
    margin-bottom: 15px;
}


#login input:focus {
	border: 2px solid aqua;
}

#login_btn {
	background: transparent;
    border: 1px solid #6a696c;
    padding: 8px 15px 6px;
    width: 200px;
    display: inline-block;
    letter-spacing: 0.2em;
    color: #6a696c;
    font-size: 14px;
    text-align: center;
    transition: background-color 0.2s ease;
}

#search {
	margin-top: 10px;
	margin-bottom: 20px;
}

#message {
	color: red;
	font-weight: bold;
}

#search a:hover {
	background-color: skyblue;
}
#button-submit2 {
    background: transparent;
    border: 1px solid #6a696c;
    padding: 8px 15px 6px;
    width: 200px;
    letter-spacing: 0.2em;
    color: #6a696c;
    font-size: 14px;
    text-align: center;
    transition: background-color 0.2s ease;
}
.create_text{
	margin-top: 50px;
	line-height: 20px;
}



</style>
<div class="page-title">
	<h1>SIGN IN</h1>
</div>
<div id="space"></div>
<form id="login" name="loginForm" method="post"
	action="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_login_action">
	
	<div class="login_left">
	<ul class="login_tag">
		<li><label for="id" >USERNAME</label> <input type="text" name="id"
			id="id" value="<%=id%>"></li>
		<li><label for="id">PASSWORD</label> <input type="password"
			name="passwd" id="passwd"></li>
	</ul>
	</div>
	<div id="login_btn" style="padding: 0px;" >SIGN IN</div>
	<div id="message" style="color:red;"><%=message%></div>
	<div id="search">
		<a href="index.jsp?workgroup=member&work=id_find">FORGOTTEN USERNAME</a> | <a href="index.jsp?workgroup=member&work=pw_find">FORGOTTEN PASSWORD</a>
	</div>
		
	<div class="create_text">
            회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.<br><br>
            <a href="index.jsp?workgroup=member&work=agree" class="create_btn" id="button-submit2">CREATE ACCOUNT</a>
        </div>
</form>

<script type="text/javascript">
$("#passwd").keydown(function(key) {

	if (key.keyCode == 13) {

	$("#login").submit();

	}

	});		
	
$("#id").focus();

$("#login_btn").click(function() {
	if ($("#id").val() == "") {
		$("#message").text("아이디를 입력해 주세요.");
		$("#id").focus();
		return;
	}
        
	if ($("#passwd").val() == "") {
		$("#message").text("비밀번호를 입력해 주세요.");
		$("#passwd").focus();
		return;
	}
	
	$("#login").submit();

});

	
</script>

