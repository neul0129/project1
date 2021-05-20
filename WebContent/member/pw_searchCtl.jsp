<%@page import="site.margaret.util.RandomPassword"%>
<%@page import="site.margaret.util.Utility"%>
<%@page import="site.margaret.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String phone = request.getParameter("phone");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	System.out.println("id:" + id);
	
	phone = phone +"-"+ phone1+"-" + phone2;
	System.out.println("phone: " + phone);
	
	String passwd = null; 
	passwd= MemberDAO.getDAO().pw_search(id, phone);

			

%>
<html>
<head>
<style>
tr,td {
 border: 0px solid none;
}

k:hover {
 text-decoration: none;
 color: #9354ED
}
</style>

</head>

<BODY>
 <form name="pwsearch">
  <font face="Yang Rounded">
  <table width="1330px" border="0" height="430px" align="center">
    <tr>
     <td>
      <%
       if (id!=null) {
      %>
      <table width="450px" align="center" border="0"
       style="color: black; margin-top: -4%">
       <tr>
        <td>
         <table width="500px" align="center" border=0
          style="font-size: 30px">
          <tr>
          <td>회원님의 비밀번호는 ?</td>
          </tr>
         </table>
        </td>
       </tr>

       <tr>
        <td>
         <table width="400px" height="200px" align="center" border="1"
          style="font-size: 25px; margin-top: 2%;">
          <tr align="center">
           <td style="border: 0"><%=passwd%> 입니다.</td>
          </tr>
         </table>
        </td>
       </tr>
      </table> 
      <%} else{%>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 비밀번호 찾기를 실패하셨습니다. *</td>
       </tr>
       <tr align=center>
        <td><input type="button" value="돌아가기"
         onClick="history.back()"></td>
       </tr>
      </table>
       <% } %>
     </td>
    </tr>
   </table>

  </font>
 </form>
</body>
</HTML>

 
