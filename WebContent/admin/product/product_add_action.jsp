<%@page import="site.margaret.dto.ProductDTO"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.util.Utility"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달된 파일을 저장하기 위한 서버 디렉토리 시스템 경로를 반환받아 저장
	String saveDirectory=request.getServletContext().getRealPath("/admin/product_image");

	MultipartRequest mr=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8"
			, new DefaultFileRenamePolicy());
	
	//전달값과 업로드 파일명을 반환받아 저장
	String productName=mr.getParameter("productName");
	String category=mr.getParameter("category");
	String productSize=mr.getParameter("productSize");
	String mainImage=mr.getFilesystemName("mainImage");
	String productDetail=Utility.escapeTag(mr.getParameter("productDetail"));
	int stock=Integer.parseInt(mr.getParameter("stock"));
	int productPrice=Integer.parseInt(mr.getParameter("productPrice"));
	String addDate=mr.getParameter("addDate");
	
	//DTO 인스턴스 생성 및 전달값으로 필드값 변경
	ProductDTO product=new ProductDTO();
	product.setProductName(productName);
	product.setCategory(category);
	product.setProductSize(productSize);
	product.setMainImage(mainImage);
	product.setProductDetail(productDetail);
	product.setStock(stock);
	product.setProductPrice(productPrice);
	product.setAddDate(addDate);
	
	ProductDAO.getDAO().insertProduct(product);
	
	//제품목록 출력페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/admin/admin_index.jsp?workgroup=product&work=product_manager';");
	out.println("</script>");
%>    
