<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- tables -->
				
				<div class="table-heading">
					<h2>Người dùng</h2>
					<c:if test="${not empty msg }">
						<h3 style="text-align: center;" class="label label-success">${msg }</h3>
					</c:if>
				</div>
				
				<div class="agile-tables">
					<div class="w3l-table-info">
					
					  <h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/user/add">Thêm người dùng</a></h3>
					    <table id="table">
						<thead>
						  <tr>
							<th>ID</th>
							<th>Username</th>
							<th>FullName</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Quyền</th>
							<th>Trạng thái</th>
							<th >Chức năng</th>
						  </tr>
						</thead>
						<tbody>
						<c:forEach items="${listUser }" var="user">
						  <tr>
							<td>${user.id }</td>
							<td>${user.username }</td>
							<td>${user.fullname }</td>
							<td>${user.phone }</td>
							<td>${user.email }</td>
							<td>${user.role_name }</td>
							<td>
								<c:if test="${user.enable == 1 }">Đang hoạt động</c:if>
								<c:if test="${user.enable != 1 }">Bị tạm ngưng</c:if>
							</td>
							<td>
								 <a href="${pageContext.request.contextPath }/admin/user/edit/${user.id }" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                             <a href="${pageContext.request.contextPath }/admin/user/del/${user.id }" onclick="return confirm('Bạn có chắc muốn xóa người dùng này không?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
							</td>
						  </tr>
						</c:forEach>
						  </tbody>
					  </table>
					</div>
			
				  

				</div>
				<!-- //tables -->
				
				<!-- tables -->
				
				<!-- //tables -->
			</div>
		</div>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/admin/css/table-style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/admin/css/basictable.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/templates/admin/js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

      $('#table-swap-axis').basictable({
        swapAxis: true
      });

      $('#table-force-off').basictable({
        forceResponsive: false
      });

      $('#table-no-resize').basictable({
        noResize: true
      });

      $('#table-two-axis').basictable();

      $('#table-max-height').basictable({
        tableWrapper: true
      });
    });
</script>
<!-- //tables -->	