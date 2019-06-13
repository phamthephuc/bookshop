<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<section class="title-bar">
			<div class="logo">
				<h1><a href="${pageContext.request.contextPath }/admin"><img src="${pageContext.request.contextPath }/templates/public/nobita.vn/stores/images/logo.png" alt="" /></a></h1>
			</div>
			<div class="full-screen">
			</div>
			<div class="w3l_search">
				<form action="${pageContext.request.contextPath }/admin/books" method="post">
					<input type="text" name="key" 
					required minlength="1" maxlength="200" requiredmsg="Bạn cần nhập từ khóa vào đây">
					<button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
				</form>
			</div>
			<div class="header-right">
				<div class="profile_details_left">
					<div class="header-right-left">
						<!--notifications of menu start -->
						<ul class="nofitications-dropdown">
							
							<li class="dropdown head-dpdn">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell"></i><span class="badge blue">${numNewOrder}</span></a>
								<ul class="dropdown-menu anti-dropdown-menu agile-notification">
									<li>
										<div class="notification_header">
											<h3>Bạn có ${numNewOrder} đơn hàng mới</h3>
										</div>
									</li>
									
									<c:forEach items="${listOrderChuaXuLy}" var="order">
									<li><a href="${pageContext.request.contextPath }/admin/order/view/${order.id_order}">
										<div class="user_img"><img src="images/2.png" alt=""></div>
									   <div class="notification_desc">
										<p>${order.fullname } mới đặt đơn hàng</p>
										<p><span>${order.amount }$</span></p>
										</div>
									  <div class="clearfix"></div>	
									 </a></li>
									 </c:forEach>
									 
									 <li>
										<div class="notification_bottom">
											<a href="${pageContext.request.contextPath }/admin/orders/chua-xu-ly">Xem tất cả đơn hàng mới</a>
										</div> 
									</li>
								</ul>
							</li>	
								
							<div class="clearfix"> </div>
						</ul>
					</div>	
					<div class="profile_details">		
						<ul>
							<li class="dropdown profile_details_drop">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<div class="profile_img">	
										<span class="prfil-img"><i class="fa fa-user" aria-hidden="true"></i></span> 
										<div class="clearfix"></div>	
									</div>	
								</a>
								<ul class="dropdown-menu drp-mnu">
									<li> <a href="${pageContext.request.contextPath }/admin/user/edit/${userInfo.id }"><i class="fa fa-user"></i> Profile</a> </li> 
									<li> <a href="${pageContext.request.contextPath }/auth/logout"><i class="fa fa-sign-out"></i> Logout</a> </li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</section>