<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- tables -->
				
				<div class="table-heading">
					<h2>Sản Phẩm</h2>
					<c:if test="${not empty msg }">
						<h3 style="text-align: center;" class="label label-success">${msg }</h3>
					</c:if>
				</div>
				
				<div class="agile-tables">
					<div class="w3l-table-info">
					
					  <h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/pro/add">Thêm sản phẩm</a></h3>
					    <table id="table">
						<thead>
						  <tr>
							<th>ID</th>
							<th>Tên sản phẩm</th>
							<th>danh mục</th>
							<th>danh mục cha</th>
							<th>Số lượng còn</th>
							<th>Giá gốc</th>
							<th >Hình 1</th>
							<th>Hình 2</th>
							<th>Hình 3</th>
							<th>Giá khi giảm</th>
							<th>Loại dây</th>
							<th >Chức năng</th>
						  </tr>
						</thead>
						<tbody>
						<c:forEach items="${listProduct }" var="pro">
						  <tr>
							<td>${pro.id_pro }</td>
							<td>${pro.name_pro }</td>
							<td>${pro.cname }</td>
							<td>${pro.cname_parent }</td>
							<td>${pro.number_rest }</td>
							<td>${pro.price }</td>
							<td ><img width="100px" src="${pageContext.request.contextPath}/files/${pro.pic1 }"></td>
							<td ><img width="100px"  src="${pageContext.request.contextPath}/files/${pro.pic2 }"></td>
							<td ><img width="100px" src="${pageContext.request.contextPath}/files/${pro.pic3 }"></td>
							<td>${pro.price - pro.price * pro.sale / 100 }</td>
							<td>${pro.name_type}</td>
							<td>
								 <a href="${pageContext.request.contextPath }/admin/pro/edit/${pro.id_pro }" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                             <a href="${pageContext.request.contextPath }/admin/pro/del/${pro.id_pro }" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
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