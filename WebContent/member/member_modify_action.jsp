<%@page import="site.margaret.dto.MemberDTO"%>
<%@page import="site.margaret.dao.MemberDAO"%>
<%@page import="site.margaret.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 회원정보를전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 회원정보 상세 출력페이지로 이동 --%>
<%@include file="/security/login_check.jspf" %>

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
	String passwd=request.getParameter("password");
	if(passwd!=null && !passwd.equals("")) {
		passwd=Utility.encrypt(passwd);
	}else { 
		passwd=loginMember.getPasswd();
	}
	String name=request.getParameter("name").trim();
	String email=request.getParameter("email");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=Utility.stripTag(request.getParameter("address2"));
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")
	+"-"+request.getParameter("phone3");
	
	
	//DTO 클래스 로 인스턴스 생성
	MemberDTO member= new MemberDTO();
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setEmail(email);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	member.setPhone(phone);
	
	//DAO클래스 메소드 호출
	MemberDAO.getDAO().updateMember(member);
	
	//회원정보 변경
	session.setAttribute("loginMember", MemberDAO.getDAO().selectIdMember(id));
	
	//마이페이지이동 
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=member&work=mypage';");
	out.println("</script>");

%>













