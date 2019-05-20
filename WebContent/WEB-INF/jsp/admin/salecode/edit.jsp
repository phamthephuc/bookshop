<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- input-forms -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>SỬA SALECODE</h2>
					</div>
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/salecodes">Quay lại</a></h3>
								</div>
								<div class="form-body">
									<form action="" method="post"> 
										<div class="form-group"> 
											<label for="exampleInputEmail1">Mã Code</label> 
											<input type="text" name="code" class="form-control" id="exampleInputEmail1" placeholder="" value="${salecode.code }" required="required" minlength="5" maxlength="50"  requiredmsg="Trường này có từ 5 đến 50 ký tự">
											<label for="exampleInputEmail1">Discount</label> 
											<input type="number" required="required" min="0" max="99" requiredmsg="Trường này là số lớn hơn 0 nhỏ hơn 100" step="1" name="discount" class="form-control" id="exampleInputEmail1" value="${salecode.discount }" placeholder="">
											<label for="exampleInputEmail1">Số lượng</label> 
											<input type="number" required="required" min="0" max="1000" requiredmsg="Trường này là số lớn hơn 0 nhỏ hơn 1000" step="1" name="number_rest" class="form-control" id="exampleInputEmail1" value="${salecode.number_rest }" placeholder="">
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
		