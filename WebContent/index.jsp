<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">

<title>Margaret Howell</title>

   
<%   
   request.setCharacterEncoding("utf-8");
   
   String workgroup=request.getParameter("workgroup");
   if(workgroup==null) workgroup="container";

   String work=request.getParameter("work");
   if(work==null) work="main";
   
   String contentPath=workgroup+"/"+work+".jsp";
%>    

</head>
<link href="style.css" rel="stylesheet">
<body>
   <%@include file="header.jspf"%>
   <%@include file="container.jspf"%>
   
      <div class="contents_wrap">
         
         
         <jsp:include page="<%=contentPath %>"/>      
    
      
         <%@include file="footer.jspf"%>
         <script type="text/javascript" src="script.js"></script>
      <script type="text/javascript" src="script.js"></script>
      </div>
   
</body>
</html>


