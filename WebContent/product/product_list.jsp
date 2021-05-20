<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.ProductDAO"%>
<%@page import="site.margaret.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%
	List<ProductDTO> productList=ProductDAO.getDAO().selecAllProduct("",request.getParameter("category"),"","","");
%>

<% for(ProductDTO product:productList) { %>
	<div class="product">
		<div>
		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=product&work=product_detail&productNo=<%=product.getProductNo()%>">
				<img src="<%=request.getContextPath()%>/admin/product_image/<%=product.getMainImage()%>" width="200px"></a>
		</div>
		<div><%=product.getProductName() %></div>
		<div>
			<%=DecimalFormat.getCurrencyInstance().format(product.getProductPrice()) %>
		</div>
	</div>
	
	<% } %>
