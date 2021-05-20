<%@page import="site.margaret.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//삭제하고자 선택된 회원정보의 아이디 목록을 반환받아 저장
	// => 같은 이름으로 전달된 값이 여러개 있는 경우 request.getParameterValues() 메소드 호출
	String[] checkId=request.getParameterValues("checkId");
	
	//반복문으로 배열요소에 저장된 아이디를 이용하여 MEMBER 테이블에 저장된 해당 아이디의
	//회원정보를 삭제하는 DAO 클래스의 메소드를 호출
	for(String id:checkId) {
		MemberDAO.getDAO().deleteMember(id);
	}
	
	//회원목록 출력페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/admin/admin_index.jsp?workgroup=member&work=member_manager';");
	out.println("</script>");
%>
