<%@page import="site.margaret.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 비밀번호를 전달받아 로그인 사용자의 비밀번호와 비교하여 같은 경우 클라이언트에게 회원정보를
입력태그의 초기값으로 전달하고 변경값을 입력받기 위한 JSP 문서 --%>   
<%-- => 비로그인 사용자가 요청한 경우 에러페이지 이동 - 비정상적인 요청 --%>
<%-- => 전달받은 비밀번호가 로그인 사용자의 비밀번호와 같지 않은 경우 비밀번호 입력페이지(password_confirm.jsp)로 이동 --%>
<%-- => [우편번호 검색]를 클릭한 경우 새창에 우편번호 검색페이지(post_search.jsp) 요청 --%>
<%-- => [회원정보변경]를 클릭한 경우 회원정보 변경 처리페이지(member_modify_action.jsp)로 이동 - 입력값 전달 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//전달받은 비밀번호와 로그인 사용자의 비밀번호가 같지 않은 경우
	if(!loginMember.getPasswd().equals(passwd)) {
		session.setAttribute("message", "비밀번호가 맞지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=password_confirm&action=modify';");
		out.println("</script>");	
		return;
	}
%>
<style type="text/css">
fieldset {
	text-align: left;
	margin: 10px auto;
	width: 1100px;
}

legend {
	font-size: 1.2em;
}

#join label {
	width: 150px;
	text-align: right;
	float: left;
	margin-right: 10px;
}

#join ul li {
	list-style-type: none;
	margin: 15px 0;
}

#fs {
	text-align: center;
}

.error {
	color: red;
	position: relative;
	left: 160px;
	display: none;
}

#idCheck, #postSearch {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
	padding: 2px 10px;
	border: 1px solid black;
}

#idCheck:hover, #postSearch:hover {
	background: aqua;
}
#submit_modify, #member_reset, #member_remove, #zipcode_find{
background: transparent;
    border: 1px solid #6a696c;
    padding: 8px 15px 6px;
    width: 150px;
    display: inline-block;
    letter-spacing: 0.2em;
    color: #6a696c;
    font-size: 14px;
    text-align: center;
    transition: background-color 0.2s ease;
}
#zipcode_find{
padding: 0px;
width: 100px;
}
#member_remove{
padding: 4px;
}
</style>
<form name="joinForm" id="join" method="post"
	action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_modify_action">
<fieldset>
	<legend>회원가입 정보</legend>
	<ul>
		<li>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="<%=loginMember.getId()%>" readonly="readonly">
		</li>
		<li>
			<label for="passwd">비밀번호</label>
			<input type="password" name="passwd" id="passwd">
			<span style="color: red;">비밀번호를 변경하지 않을 경우 입력하지 마세요.</span>
			<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
		</li>
		<li>
			<label for="passwd">비밀번호 확인</label>
			<input type="password" name="repasswd" id="repasswd">
			<div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
		</li>
		<li>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%=loginMember.getName()%>">
			<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
		</li>
		<li>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="<%=loginMember.getEmail()%>">
			<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
			<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
		</li>
		<li>
			<label>우편번호</label>
			<input type="text" name="zipcode" id="zipcode" size="10" readonly="readonly">
			<input type="button" id="zipcode_find" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<div id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</div>
		</li>
		<li>
			<label for="address1">기본주소</label>
			<input type="text" name="address1" id="address1" size="50" readonly="readonly">
			<input type="text" id="sample6_extraAddress" size="30">
			<div id="address1Msg" class="error">기본주소를 입력해 주세요.</div>
		</li>
		<li>
			<label for="address2">상세주소</label>
			<input type="text" name="address2" id="address2" size="50" value="<%=loginMember.getAddress2()%>">
			<div id="address2Msg" class="error">상세주소를 입력해 주세요.</div>
		</li>
		
			<li>
			<% String[] phone=loginMember.getPhone().split("-"); %>
			<label for="mobile">전화번호</label>
			<select name="mobile1">
				<option value="010" <% if(phone[0].equals("010")) { %> selected <% } %>>&nbsp;010&nbsp;</option>
			</select>
			- <input type="text" name="phone2" id="phone2" size="4" maxlength="4" value="<%=phone[1]%>">
			- <input type="text" name="phone3" id="phone3" size="4" maxlength="4" value="<%=phone[2]%>">
			<div id="mobileMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
			<div id="mobileRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
		</li>
	</ul>
</fieldset>
<div id="fs">
	 <button type="submit" id="submit_modify">회원정보변경</button> 
	 <button type="reset" id="member_reset">다시입력</button> 
	<a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=password_confirm&action=remove" id="member_remove">회원탈퇴</a>
</div>
</form>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 $(function(){
	  //
	  $("#member_remove").click(function(){
		         		  
		    alert("정말 탈퇴하시겠습니까? 지금 탈퇴하시면 혜택을 더 이상 받지 못하실수도 있습니다.");
	  });
 });
 </script>


<%--다음 우편번호서비스  --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                             
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져옴
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우
                    addr = data.jibunAddress;
                }
               
                if(data.userSelectedType === 'R'){
                  
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만듬
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣음
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣음
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 $(function(){
	  //id="submit_modify" 클릭시
	  $("#submit_modify").click(function(){
		  if($('#zipcode').val()==""){
	       	    alert("우편번호를 입력해주세요");
	       	    $('#zipcode').focus();
	       	    return;
	       	   }
	    	   if($('#address1').val()==""){
	          	 alert("기본주소를 입력해주세요");
	             $('#address1').focus();
	          	 return;
	    	   } 
	           if($('#address2').val()==""){
	           	 alert("상세주소를 입력해주세요");
	             $('#address2').focus();
	             return;
	           }
		  
		    alert("변경이완료되었습니다.");
	  });
 });
 </script>

<script type="text/javascript">
 $("#join").submit(function() { 
	var submitResult=true;
	
	$(".error").css("display","none");

	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#passwd").val()!="" && !passwdReg.test($("#passwd").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	} 
	
	if($("#passwd").val()!=$("#repasswd").val()) {
		$("#repasswdMatchMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#name").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
	
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if($("#email").val()=="") {
		$("#emailMsg").css("display","block");
		submitResult=false;
	} else if(!emailReg.test($("#email").val())) {
		$("#emailRegMsg").css("display","block");
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
	
	if($("#address2").val()=="") {
		$("#address2Msg").css("display","block");
		submitResult=false;
	}
	
	var phone2Reg=/\d{3,4}/;
	var phone3Reg=/\d{4}/;
	if($("#phone2").val()=="" || $("#phone3").val()=="") {
		$("#phoneMsg").css("display","block");
		submitResult=false;
	} else if(!phone2Reg.test($("#phone2").val()) || !phone3Reg.test($("#phone3").val())) {
		$("#phoneRegMsg").css("display","block");
		submitResult=false;
	}
	
	return submitResult;
});

</script>











