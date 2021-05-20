<%@page import="site.margaret.util.Utility"%>
<%@page import="site.margaret.dao.MemberDAO"%>
<%@page import="site.margaret.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장하고 로그인 입력페이지(member_login.jsp)로 이동하는 JSP 문서 --%>    
<%
	//비정상적인 요청에 대한 응답 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
				
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	//전달값을 암호화 처리된 변환값으로 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	String name=request.getParameter("name").trim();
	String email=request.getParameter("email");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	//전달값에서 태그 관련 문자열을 제거하여 저장
	String address2=Utility.stripTag(request.getParameter("address2"));
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")
	+"-"+request.getParameter("phone3");
	
	//DTO 클래스로 인스턴스를 생성하여 전달값으로 필드값 변경
	MemberDTO member=new MemberDTO();
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setEmail(email);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	member.setPhone(phone);
	
	//회원정보(DTO 인스턴스)를 전달하여 MEMBER 테이블에 삽입하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().insertMember(member);
	
	//로그인 입력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=member_login';");
	out.println("</script>");
%>
