<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>id_find</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">

<style>
tr {
 border: 0px solid none;
}

 

k:hover {
 text-decoration: none;
 color: #9354ED
}

#enter, #cancle{
font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
	padding: 2px 10px;
	border: 1px solid black;
}
</style>


<script>
 

 function id_search1() { //이름,핸드폰으로 '찾기' 버튼

  var frm = document.idfindscreen;

  if (frm.name.value.length < 1) {
   alert("이름을 입력해주세요");
   return;
  }

  if (frm.phone1.value.length<2 || frm.phone1.value.length>4) {
   alert("핸드폰번호를 정확하게 입력해주세요");
   return;
  }
  if (frm.phone2.value.length<2 || frm.phone2.value.length>4) {
   alert("핸드폰번호를 정확하게 입력해주세요");
   return;
  }

  frm.method = "post";
  frm.action = "/margaret/member/id_searchCtl.jsp"; //넘어간화면
  frm.submit();  }


 function id_search2() { //이름,이메일로 '찾기' 버튼

  var frm = document.idfindscreen;

  if (frm.name2.value.length < 1) {
   alert("이름을 입력해주세요");
   return;
  }
  if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
   alert("이메일을 입력해주세요");
   return;
  }

  frm.method = "post";
  frm.action = "<%=request.getContextPath()%>/index.jsp?workgroup=member&work=id_searchCtl2"; 
  frm.submit(); 
  }
  
 //이메일 부분

 function checkid() {

  var frm = document.idfindscreen;

  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';

  if (!regExp.test(frm.email.value)) {

   alert('올바른 email을 입력해주세요.');

   frm.email.focus();

  }

 }

 function domainCheck() {

  var frm = document.idfindscreen;

  if (frm.domain.value == 0) {
   frm.e_domain.value = "";
   frm.e_domain.disabled = false;

  } else {
   frm.e_domain.value = frm.domain.value;
   frm.e_domain.disabled = true;

  }

 }
</script>


</HEAD>

<BODY>
 <form name="idfindscreen">
 <font face="Yang Rounded">


  
    <tr>
     <td>
      <table width="600px" align="center" border="0"
       style="color: black; background-color: #F6F6F6; font-size: 20px;">
       <tr>
        <td>
         <table width="800px" align="center" border=0;
          style="background-color: black; margin-top: 3%">
          <tr>
           <td style="text-align: center; padding-left: 280px; color:white; }">아이디 찾기</td>
           <td width="300px"></td>
          </tr>
         </table>
        </td>
       </tr>

       <tr>
        <td>
            <tr>
           <td>
            <table width="700px" height="10px" border="0"
             style="margin-top: 3%; color: black; font-size: 18px;">
             <tr>
              
              <td style="text-align :center;">&nbsp;이름,핸드폰번호로 찾기</td>
             </tr>
            </table>
           </td>
          </tr>

          <tr>
           <td>
            <table width="380px" height="70px" align="center" border="0"
             style="font-size: 16px;">
             <tr>
              <td>이름</td>
              <td><input type="text" name="name" style="width: 228px;"></td>
             </tr>
             <tr>
              <td>휴대폰</td>
              <td><select name="phone">
                <option value="010" selected="selected">010</option>
                </select> - 
                <input type="text" name="phone1" style="width: 70px">
              - <input type="text" name="phone2" style="width: 70px"></td>
             </tr>
            </table>
           </td>
          </tr>

 

          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%;" align="center">
             <tr>
              <td><input type="button" name="enter1" value="  찾기  "
               align="center"
               style="cursor: pointer; background: black; color: white; border-color: black; align:center" 
               onClick="id_search1()" id="enter"></td>
              <td><input type="button" name="cancle1"
               value="  취소  " 
               style="cursor: pointer; background: black; color: white; border-color: black; algin:center"
               onClick="cancle()" id="cancle"></td>
             </tr>
            </table>
           </td>
          </tr>

          <tr>
           <td>
            <table width="500px" height="20px" border="0"
             style="margin-top: 3%; font-size: 18px;">
             <br>
             <br>
             <tr>
             <td style="text-align :right; padding-right:100px;}">이름,이메일로 찾기</td>
             </tr>
            </table>
           </td>
          </tr>

          <td>
           <table width="380px" height="70px" align="center" border="0"
            style="font-size: 16px;">
            <tr>
             <td>이름</td>
             <td><input type="text" name="name2" style="width:286px"></td>
            </tr>
            <tr>
             <td style="text-align: center;">e-mail&nbsp;</td>
             <td><input type="text" name="email"
              style="width: 80px" onblur="checkid()"> @ <input
              type="text" name="e_domain" style="width: 80px"> <select
              name="domain" onchange="domainCheck();">
               <option value="0" selected="selected">직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="hanmail.net">hanmail.net</option>
               <option value="nate.com">nate.com</option>
               <option value="yahoo.com">yahoo.com</option>
             </select></td>
            </tr>
           </table>
          </td>
          </tr>

          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%" align="center">
             <tr>
              <td><input type="button" name="enter2" value="  찾기  "
               align="center"
               style="cursor: pointer; background: black; color: white; border-color: black; align: center "
               onClick="id_search2()" id="enter"></td>
              <td><input type="button" name="cancle2"value="  취소  " 
               style="cursor: pointer; background: black; color: white; border-color: black ; align: center "  
               onClick="cancle()" id="cancle"></td>
             </tr>
            </table>
            <br>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>


  </font>
 </form>
</BODY>
</HTML>

