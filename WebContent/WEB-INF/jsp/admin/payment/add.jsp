<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- input-forms -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>THÊM HÌNH THỨC THANH TOÁN</h2>
					</div>
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/payments">Quay lại</a></h3>
								</div>
								<div class="form-body">
									<form action="" method="post"> 
										<div class="form-group"> 
											<label for="exampleInputEmail1">Tên hình thức thanh toán</label> 
											<input type="text" name="name" class="form-control" id="exampleInputEmail1" placeholder="" value="${payment.name }" required="required" minlength="5" maxlength="200"  requiredmsg="Trường này có từ 5 đến 200 ký tự">
										</div> 
										<button type="submit" class="btn btn-default w3ls-button">Submit</button> 
									</form> 
								</div>
							</div>
						</div>
					</div>
					
				
				</div>
				<!-- //input-forms -->
			</div>
		</div>
		