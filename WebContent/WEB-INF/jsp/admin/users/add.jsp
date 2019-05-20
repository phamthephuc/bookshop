<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- input-forms -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>THÊM NGƯỜI DÙNG</h2>
					</div>
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/users">Quay lại</a></h3>
								</div>
								<div class="form-body">
									<form action="" method="post"> 
										<div class="form-group"> 
											<label for="exampleInputEmail1">Username</label> 
											<input type="text" name="username" class="form-control" id="exampleInputEmail1" placeholder="username"  required="required" minlength="4" maxlength="200"  requiredmsg="Trường này có từ 4 đến 200 ký tự">
											<label for="exampleInputEmail1">Password</label> 
											<input type="password" name="password" class="form-control" id="exampleInputEmail1" placeholder="password"  required="required" minlength="5" maxlength="200"  requiredmsg="Trường này có từ 5 đến 200 ký tự">
											<label for="exampleInputEmail1">Fullname</label> 
											<input type="text" name="fullname" class="form-control" id="exampleInputEmail1" placeholder="fullname"  required="required" minlength="5" maxlength="200"  requiredmsg="Trường này có từ 5 đến 200 ký tự">
											<label for="exampleInputEmail1">Phone</label> 
											<input type="number" name="phone" class="form-control" id="exampleInputEmail1" placeholder="phone"  required="required" minlength="10" maxlength="12"  requiredmsg="Số điện thoại là số có độ dài từ 10 đến 12">
											<label for="exampleInputEmail1">Email</label> 
											<input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="email" required="required" requiredmsg="nhập đúng định dạng 1 email. Ví dụ abc@gmail.com">
											<label for="exampleInputEmail1">Address</label> 
											<input type="text" name="address" class="form-control" id="exampleInputEmail1" placeholder="address"  required="required" minlength="20" maxlength="300"  requiredmsg="Trường này có từ 20 đến 300 ký tự">
											<label for="exampleInputEmail1">Chọn quyền</label>
											<select class="form-control" id="exampleInputEmail1" name="role_id">
												<c:forEach items="${listRole }" var="role">
													<option value="${role.role_id }">${role.name }</option>
												</c:forEach>
											</select> 
											<label for="exampleInputEmail1">Trạng thái</label>
											<select class="form-control" id="exampleInputEmail1" name="enable">
												<option value="0">Tạm dừng hoạt động</option>
												<option value="1">Cho phép hoạt động</option>
											</select> 
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
		