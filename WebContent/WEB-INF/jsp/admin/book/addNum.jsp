<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- input-forms -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>THÊM SỐ LƯỢNG CHO SẢN PHẨM  ${pro.name_pro }</h2>
					</div>
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/pros">Quay lại</a></h3>
								</div>
								<div class="form-body">
									<form action="" method="post" enctype="multipart/form-data"> 
										<div class="form-group"> 
											<label for="exampleInputEmail1">Số lượng bạn muốn thêm</label> 
											<input type="number" step="1" name="numAdd" class="form-control" id="exampleInputEmail1" placeholder="số lượng" required="required" min="0" requiredmsg="Trường này là số lớn hơn 0">
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
		