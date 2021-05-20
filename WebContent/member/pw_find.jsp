<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
 <HEAD>
  <TITLE> pw_find </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">

<style>

  tr, td{
    border: 0px solid none; 
}
#design{
color:white;
}
#design2 {
width:210px;
}
    </style>


 <script>
  	    function enter(){

	   var frm=document.pwfindscreen;

	   if(frm.id.value.length<3){
	    alert("아이디를 올바르게 입력해주세요");
	    return;
	   }

	   if(frm.phone1.value.length<1){
	    alert("연락처를 올바르게 입력해주세요");
	    return;
	   }
	   if(frm.phone2.value.length<1){
	    alert("연락처를 올바르게 입력해주세요");
	    return;
	   }
	   frm.method="post";
	   frm.action="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=pw_searchCtl";
	   frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
	   }
	   

	  </script>

 </HEAD>

 <BODY>

 <form name="pwfindscreen">

 
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    <tr>
    <td>
     <table width="750px" align="center" border=0; style="background-color:black; margin-top:3%" >
      <tr>
       <td id="design" style="text-align:center">비밀번호 찾기</td>
      
      </tr>
     </table>
    </td> 
    </tr>       
   <tr> 
    <td>
   <table width="600px"  height="300px" align="center" border="0"  style=" background-color:none; border:dotted 5px none;">
    <tr>
     <td>
      <table width="400px"  border="0" style="margin-top:3%">
       <tr>
        </td>
        <td><div style="text-align:center; padding-left: 80px; font-size:16px">&nbsp;아이디와 핸드폰번호를 입력해주세요.</div>
        
        </td>
       </tr>
      </table>
     </td>
    </tr>

    <tr>
     <td>
      <table width="380px" align="center" border="0" style="font-size:19px">
       <tr>
        <td>아이디</td>
        <td><input type="text" name="id" style="display: block;" id= "design2" ></td>
       </tr>
       <tr>
        <td>휴대폰</td>
        <td style="display: flex;"><select name="phone" >
        <option value ="010" selected="selected">010</option>
        </select> -
        <input type="text" name="phone1" style="width:70px"> -
        <input type="text" name="phone2" style="width:70px" ></td>
       </tr>
      </table>
     </td>
    </tr>
   
    <tr>
     <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="button" name="enter2" value="  찾기  "  style="cursor:pointer; border-color:black; background:black; color:white;" onClick="enter()" >
         <input type="button" name="cancle2" value="  취소  "  style="cursor:pointer; border-color:black; background:black; color:white;" onclick="cancle()"></td>
       </tr>
      </table>
     </td>
    </tr>

  </table>
 </td>
</tr>
</table>
</td>
</table>

</form>

 </BODY>
</HTML> 

 

