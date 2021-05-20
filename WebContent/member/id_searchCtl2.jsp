<%@page import="site.margaret.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
 request.setCharacterEncoding("UTF-8");

 String name = request.getParameter("name2");
 String email = request.getParameter("email");
 String domain = request.getParameter("domain");
 String e_domain = request.getParameter("e_domain");

 System.out.println("이름:" + name);

 if (domain.equals("0")) {
  email = email + "@" + e_domain;
 } else {
  email = email + "@" + domain;
 }

 System.out.println("이메일:" + email);
 
 String id = null; 
 id= MemberDAO.getDAO().id_find2(name, email); 
 
%>
<HTML>
<HEAD>
<style>
tr,td {
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
        <td style="height: 170px">* 회원님의 아이디를 찾았습니다! *</td>
       </tr>
       <tr align=center>
        <td style="font-size: 20px"><%=id%></td>
       </tr>
      </table> <%
  } else {
 %>
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
      </form>

</font>
</body>
</HTML>

