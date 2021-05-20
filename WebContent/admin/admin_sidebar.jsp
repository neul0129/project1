<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=main&work=main_action">
		<div class="sidebar-brand-icon rotate-n-15"></div>
		<div class="sidebar-brand-text mx-3">MARGARET</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">


	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Nav Item - 상품관리 Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href=""
		data-toggle="collapse" data-target="#merchandise" aria-expanded="true"
		aria-controls="collapseTwo"> <span>상품관리</span>
	</a>
		<div id="merchandise" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="admin_index.jsp?workgroup=product&work=product_add">상품 등록</a> 
				<a class="collapse-item" href="admin_index.jsp?workgroup=product&work=product_manager">상품 목록</a> 
			</div>
		</div></li>

	<!-- Nav Item - 주문관리 Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#order" aria-expanded="true"
		aria-controls="collapseTwo"> <span>주문관리</span>
	</a>
		<div id="order" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="admin_index.jsp?workgroup=order&work=order_manager">전체주문목록</a> <a
					class="collapse-item" href="admin_index.jsp?workgroup=delivery&work=delivery_manager">배송 관리</a> 
			</div>
		</div></li>

	<!-- Nav Item - 회원관리 Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="admin_index.jsp?workgroup=member&work=member_manager"> <span>회원관리</span>
	</a></li>

	<!-- Nav Item - 매출관리 Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="admin_index.jsp?workgroup=sales&work=sales_manager"> <span>매출분석</span>
	</a></li>
</ul>