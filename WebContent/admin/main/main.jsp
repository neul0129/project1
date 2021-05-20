<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.margaret.dao.ShopOrderDAO"%>
<%@page import="site.margaret.dto.ShopOrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int dayordertotal = Integer.parseInt(request.getParameter("dayordertotal"));
	int daypaymenttotal = Integer.parseInt(request.getParameter("daypaymenttotal"));
	int dayrefundtotal = Integer.parseInt(request.getParameter("dayrefundtotal"));
	String count1 = request.getParameter("count1");
	String count2 = request.getParameter("count2");
	String count3 = request.getParameter("count3");
	String count4 = request.getParameter("count4");
	String count5 = request.getParameter("count5");
	String count6 = request.getParameter("count6");
	String count7 = request.getParameter("count7");
	String count8 = request.getParameter("count8");
	DecimalFormat df = new DecimalFormat("###,###,###");
	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

%>    
<!-- 매출현황 Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h3 class="h3 mb-0 text-gray-800">오늘 매출 현황<span style="font-size: 0.5em;">(<%=currentDate %> 기준)</span></h3>
						<a href="<%=request.getContextPath()%>/index.jsp"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
							쇼핑몰 바로가기</a>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=sales&work=sales_manager">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													주문</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><span><%=df.format(dayordertotal) %></span>원</div>
											</div>
											<div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-primary"></i>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=sales&work=sales_manager">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													결제</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><span><%=df.format(daypaymenttotal) %></span>원</div>
											</div>
											<div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-primary"></i>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=sales&work=sales_manager">
								<div class="card border-left-danger shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-danger text-uppercase mb-1">
													환불</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><span><%=df.format(dayrefundtotal) %></span>원</div>
											</div>
											<div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-danger"></i>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>

					<!-- 주문현황 Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h3 class="h3 mb-0 text-gray-800">주문현황<span style="font-size: 0.5em;">(최근 1개월 기준)</span></h3>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count1 %></div>
												<div class="h5 mb-0 font-weight-bold text-primary" style="text-align: center;">입금전</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count2 %></div>
												<div class="h5 mb-0 font-weight-bold text-primary" style="text-align: center;">배송준비중</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count3 %></div>
												<div class="h5 mb-0 font-weight-bold text-primary" style="text-align: center;">배송중</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count8 %></div>
												<div class="h5 mb-0 font-weight-bold text-primary" style="text-align: center;">배송완료</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

					</div>

					<!-- 취소 교환 반품 환불 현황 Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h3 class="h3 mb-0 text-gray-800">취소 / 교환 / 반품 / 환불현황<span style="font-size: 0.5em;">(최근 1개월 기준)</span></h3>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-danger shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count4 %></div>
												<div class="h5 mb-0 font-weight-bold text-danger" style="text-align: center;">취소</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-danger shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count5 %></div>
												<div class="h5 mb-0 font-weight-bold text-danger" style="text-align: center;">교환</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-danger shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count6 %></div>
												<div class="h5 mb-0 font-weight-bold text-danger" style="text-align: center;">반품</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="<%=request.getContextPath()%>/admin/admin_index.jsp?workgroup=order&work=order_manager">
								<div class="card border-left-danger shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div style="text-align: center;"
													class="text-xs font-weight-bold text-dark text-uppercase mb-1">
													<%=count7 %></div>
												<div class="h5 mb-0 font-weight-bold text-danger" style="text-align: center;">환불현황</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>