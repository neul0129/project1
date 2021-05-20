<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 에러메세지를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => [메인으로]를 클릭한 경우 메인페이지(product_list.jsp)로 이동 --%>    
<h3>비정상적인 방법으로 페이지를 요청 하였습니다. 
다시한번입력해주세요.</h3>
<p><a href="<%=request.getContextPath()%>/index.jsp">
메인으로</a></p>