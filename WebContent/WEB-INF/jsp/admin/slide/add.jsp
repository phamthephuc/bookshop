<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- input-forms -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>THÊM SLIDE</h2>
					</div>
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/slides">Quay lại</a></h3>
								</div>
								<div class="form-body">
									<form action="" method="post" enctype="multipart/form-data"> 
										<div class="form-group"> 
											<label for="exampleInputEmail1">Link</label> 
											<input type="url" name="link" class="form-control" id="exampleInputEmail1" placeholder="LINK">
											<label for="exampleInputEmail1">Hình ảnh</label> 
											<input type="file" required="required"  name="hinh1" class="form-control" id="exampleInputEmail1" placeholder="tên danh mục"  requiredmsg="Trường này là bắt buộc">
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
		