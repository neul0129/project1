<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 클라이언트에게 회원정보를 입력받기 위한 JSP 문서 --%>
<%-- => [회원가입]을 클릭한 경우 회원가입 처리페이지(member_join_action.jsp) 요청 - 입력값 전달 --%>
<%-- => [아이디 중복 검사]를 클릭한 경우 새창에 아이디 중복 검사페이지(id_check.jsp) 요청 - 아이디 전달 --%>
<%-- => [우편번호 검색]를 클릭한 경우 새창에 우편번호 검색페이지(post_search.jsp) 요청 --%>
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

#postSearch,#ok,#zip {
	background: transparent;
    border: 1px solid #6a696c;
    padding: 0px 15px 0px;
    width: 100px;
    display: inline-block;
    letter-spacing: 0.2em;
    color: #6a696c;
    font-size: 14px;
    text-align: center;
    transition: background-color 0.2s ease;
}
#idCheck{
	background: transparent;
    border: 1px solid #6a696c;
    padding: 0px 15px 0px;
 	display: inline-block;
    letter-spacing: 0.2em;
    color: #6a696c;
    font-size: 14px;
    text-align: center;
    transition: background-color 0.2s ease;
}

#idCheck:hover, #postSearch:hover {
	background: gray;
}

.mid-0.xans-member-join .boxTheme+.boxTheme {
	margin-top: -1px;
	padding-bottom: 30px;
	padding-top: 10px;
}

.mid-0.xans-member-join .boxTheme {
	margin: 0;
	border-width: 1px;
	background-color: #fff;
}

.mid-0.xans-member-join .agreeArea .content {
	overflow: auto;
	height: 110px;
	padding: 20px;
	border: 1px solid #d5d5d5;
	background: #fff;
}

.mid-0.xans-member-join .agreeArea .check {
	padding: 7px 0 0 0;
}

.boxTheme p {
	font-size: 11px !important;
	line-height: 18px;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, textarea, p, blockquote, th, td, img {
	-webkit-text-size-adjust: none !important;
	margin: 0;
	padding: 0;
	font-family: 'GillSansMTPro-Medium', 'NotoSans-Regular', Helvetica Neue,
		Helvetica, Arial, Apple SD Gothic Neo, Malgun Gothic, dotum,
		sans-serif !important;
	font-size: 12px;
	line-height: 24px;
	font-weight: 400;
	font-style: normal;
	color: #6A696C 
	letter-spacing: 0.1em;
}

* {
	margin: 0;
	padding: 0;
}

*, *:before, *:after {
	box-sizing: inherit;
}

 textarea {
    padding: 0px;
    width: 70%;
    height: 150px;
    background: #fff;
    border: 1px solid #d8d9df;
    font-size: 12px;
    color: #98989f;
    line-height: 1.6em;
    overflow: auto;
    resize: none;
    }
</style>
<form name="joinForm" id="join" method="post"
	action="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_join_action">
	<%-- 아이디 중복 검사 실행 유무를 판단하기 위한 입력태그 --%>
	<%-- => 입력값 : 0 - 아이디 중복 검사 미실행(사용 불가능한 아이디) --%>
	<%-- => 입력값 : 1 - 아이디 중복 검사 실행(사용 가능한 아이디) --%>
	<input type="hidden" name="idCheckResult" id="idCheckResult" value="0">
	<fieldset>
		<legend>회원가입 정보</legend>
		<ul>
			<li>
			<label for="id">아이디</label>
			 <input type="text" name="id" id="id">
			 <span id="idCheck">아이디 중복 검사</span>
				<div id="idMsg" class="error">아이디를 입력해 주세요.</div>
				<div id="idRegMsg" class="error">아이디는 영문자로 시작되는 영문자,숫자,_의
					6~20범위의 문자로만 작성 가능합니다.</div>
				<div id="idCheckMsg" class="error">아이디는 중복 검사를 반드시 실행해 주세요.</div></li>
			<li>
			<label for="passwd">비밀번호</label>
			 <input type="password"	name="passwd" id="passwd">
				<div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div>
				<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시
					하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div></li>
			<li>
			<label for="passwd">비밀번호 확인</label>
			 <input type="password"	name="repasswd" id="repasswd">
				<div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
				<div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지
					않습니다.</div></li>
			<li>
			<label for="name">이름</label>
			 <input type="text" name="name"	id="name">
				<div id="nameMsg" class="error">이름을 입력해 주세요.</div></li>
			<li>
			<label for="email">이메일</label>
			 <input type="text"	name="email" id="email">
				<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
				<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div></li>
			<li>
			<label for="phone">전화번호</label> 
			<select name="phone1">
			<option value="010" selected>&nbsp;010&nbsp;</option>
			</select> - <input type="text" name="phone2" id="phone2" size="4"
				maxlength="4"> - <input type="text" name="phone3"
				id="phone3" size="4" maxlength="4">
				<div id="phoneMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
				<div id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해주세요.</div></li>
			<li>
			<label>우편번호</label>
			<input type="text" name="zipcode" id="zipcode" size="10" readonly="readonly">
			<input type="button" onclick="sample6_execDaumPostcode()" id="zip" value="우편번호 찾기"><br>
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
			 <input type="text"	name="address2" id="address2" size="50">
			<div id="address2Msg" class="error">상세주소를 입력해 주세요.</div></li>
	</ul>
	</fieldset>
		
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
     $(function(){
    	  //id="btn" 클릭시
    	  $("#ok").click(function(){
    	   //id="아이디"가 공백일경우
    	   if($('#id').val()==""){
    	    //얼럿으로처리
    	    alert("아이디를 입력해주세요");
    	    //아이디를 입력하는곳으로 커서를 이동
    	    $('#id').focus();
    	    return;
    	   }
    	   if($('#passwd').val()==""){
    	    alert("비밀번호를 입력해주세요");
    	    $('#passwd').focus();
    	    return;
    	   }
    	    if($('#repasswd').val()==""){
       	    alert("비밀번호확인을 입력해주세요");
       	    $('#repasswd').focus();
       	    return;
       	   }
    	    if($('#name').val()==""){
            alert("이름을 입력해주세요");
             $('#name').focus();
             return;
           }
    	   if($('#email').val()==""){
          	alert("이메일을 입력해주세요");
            $('#email').focus();
            return;
           }
    	   if($('#phone').val()==""){
            alert("전화번호를 입력해주세요");
            $('#phone').focus();
            return;
           }
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
    	   //전부 입력이 되었을경우 회원가입버튼 클릭시
    	   alert("회원가입이 완료되었습니다.");
    	  });
    	 });

</script>
	<div id="fs" style="padding-top: 15px;">

	<button id="ok" name="ok" type="submit">회원가입</button>
	<button id="ok" type="reset">다시입력</button>
	</div>
</form>

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

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">


$("#id").focus();

$("#join").submit(function() {
	var submitResult=true;
	
	$(".error").css("display","none");

	var idReg=/^[a-zA-Z]\w{5,19}$/g;
	if($("#id").val()=="") {
		$("#idMsg").css("display","block");
		submitResult=false;
	} else if(!idReg.test($("#id").val())) {
		$("#idRegMsg").css("display","block");
		submitResult=false;
	} else if($("#idCheckResult").val()=="0") {
		$("#idCheckMsg").css("display","block");
		submitResult=false;
	}
		
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#passwd").val()=="") {
		$("#passwdMsg").css("display","block");
		submitResult=false;
	} else if(!passwdReg.test($("#passwd").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	} 
	
	if($("#repasswd").val()=="") {
		$("#repasswdMsg").css("display","block");
		submitResult=false;
	} else if($("#passwd").val()!=$("#repasswd").val()) {
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
	} else if(!phone2Reg.test($("#phone2").val()) || !mobile3Reg.test($("#phone3").val())) {
		$("#phoneRegMsg").css("display","block");
		submitResult=false;
	}
	
	return submitResult;
});

$("#idCheck").click(function() {
	$("#idMsg").css("display","none");	
	$("#idRegMsg").css("display","none");	
	
	var idReg=/^[a-zA-Z]\w{5,19}$/g;
	if($("#id").val()=="") {
		$("#idMsg").css("display","block");
		return;
	} else if(!idReg.test($("#id").val())) {
		$("#idRegMsg").css("display","block");
		return;
	}
	
	window.open("<%=request.getContextPath()%>/member/id_check.jsp?id="+ $("#id").val(), "idcheck",
						"width=450,height=100,left=700,top=450");
	});

	$("#id").keyup(function() {
		if ($("#idCheckResult").val() == "1") {
			$("#idCheckResult").val("0");
		}
	});
	
</script>




