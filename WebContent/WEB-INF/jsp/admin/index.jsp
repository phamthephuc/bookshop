<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<div class="main-grid">
			
			<div class="social grid">
					<div class="grid-info" >
						<div class="col-md-3 top-comment-grid">
							<div class="comments likes">
								<div class="comments-icon">
									<i class="fa fa-shopping-cart"></i>
								</div>
								<div class="comments-info likes-info">
									<h3>${numOrderChuaXuLy }</h3>
									<a href="${pageContext.request.contextPath }/admin/orders/chua-xu-ly">Order Mới</a>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="col-md-3 top-comment-grid">
							<div class="comments">
								<div class="comments-icon">
									<i class="fa fa-user"></i>
								</div>
								<div class="comments-info">
									<h3>${numUser }</h3>
									<a href="${pageContext.request.contextPath }/admin/users">Người dùng</a>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="col-md-3 top-comment-grid">
							<div class="comments tweets">
								<div class="comments-icon">
									<i style="font-size: 80px" class="fa fa-book"></i>
								</div>
								<div class="comments-info tweets-info">
									<h3>${numPro }</h3>
									<a href="${pageContext.request.contextPath }/admin/book/running-out">Sách sắp hết</a>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						
						
						<div class="col-md-3 top-comment-grid">
							<div class="comments views">
								<div class="comments-icon">
									<i style="font-size: 80px" class="fa fa-bar-chart"></i>
								</div>
								<div class="comments-info tweets-info">
									<h3>&nbsp</h3>
									<a href="${pageContext.request.contextPath }/admin/thong-ke">Thống kê</a>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						
						<div class="clearfix"> </div>
					</div>
			</div>
		<div style="text-align: center;font-size: 50px;padding: 50px 0px">Chào : <span style="font-weight: bold">${userInfo.fullname }</span> </div>		
		</div>
<!-- charts -->
		