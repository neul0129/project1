<%@page import="java.io.File"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전달값(제품번호)을 반환받아 저장
	// int productNo=Integer.parseInt(request.getParameter("productNo"));
	// String[] productNoArr = request.getParameter("productNo").split(",");
	/* 
	for(String delProductNo : productNoArr){
		int productNo=Integer.parseInt(delProductNo);

		// 제품이미지가 저장된 서버 디렉토리의 시스템 경로를 반환받아 저장
		String saveDirectory=request.getServletContext().getRealPath("admin/product_image");
		
		// 삭제할 제품의 이미지 파일명을 반환받아 저장
		String mainImage=ProductDAO.getDAO().selectNoProduct(productNo).getMainImage();
		
		// 제품번호를 이용하여 PRODUCT 테이블에 저장된 해당 제품정보를 삭제하는 DAO 클래스의 메소드 호출
		ProductDAO.getDAO().deleteProduct(productNo);
		
		// 제품 이미지파일 삭제
		new File(saveDirectory, mainImage).delete();
	}
	 */
	 
	String checkProductNo=request.getParameter("productNo");
	String[] productNoArr = checkProductNo.split(",");
	 
	for(String delProductNo : productNoArr){
		int productNo=Integer.parseInt(delProductNo);

		// 제품이미지가 저장된 서버 디렉토리의 시스템 경로를 반환받아 저장
		String saveDirectory=request.getServletContext().getRealPath("admin/product_image");
			
		// 삭제할 제품의 이미지 파일명을 반환받아 저장
		String mainImage=ProductDAO.getDAO().selectNoProduct(productNo).getMainImage();
			
		// 제품 이미지파일 삭제
		new File(saveDirectory, mainImage).delete();
	}
	 
	ProductDAO.getDAO().checkDeleteProduct(checkProductNo);
	
	 
	//제품목록 출력페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("alert('상품번호 "+checkProductNo+" 상품이 삭제되었습니다');");
	out.println("location.href='"+request.getContextPath()+"/admin/admin_index.jsp?workgroup=product&work=product_manager';");
	out.println("</script>");

%>