<%@page import="site.margaret.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("utf-8");

 String name = request.getParameter("name");
 String phone = request.getParameter("phone");
 String phone1 = request.getParameter("phone1");
 String phone2 = request.getParameter("phone2");
 phone = phone +"-"+ phone1+"-" + phone2;
 
 System.out.println(name+" = "+phone);
 
 String id = null; 
 id = MemberDAO.getDAO().id_find(name, phone);
 %>

<HTML>
<HEAD>
<style>
tr {
 border: 0px solid none;
}

 

k:hover {
 text-decoration: none;
 color: #9354ED
}
</style>



</HEAD>

<body>
 <font face="Yang Rounded">
  <form name="idsearch" method="post">
   <table width="1330px" height="530px" align="center">
    <tr>
     <td>
      <%
       if (id != null) {
      %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px"> * 회원님의 아이디를 찾았습니다! *</td>
       </tr>
       <tr align=center>
        <td style="font-size: 20px"><%=id%></td>
       </tr>
      </table>
   <%} else { %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 아이디 찾기를 실패하셨습니다. *</td>
       </tr>
       <tr align=center>
        <td><input type="button" value="돌아가기"
         onClick="history.back()"></td>
       </tr>
      </table> <%
  }
 %> </font>
      </form> </font>
</body>
</HTML>

 