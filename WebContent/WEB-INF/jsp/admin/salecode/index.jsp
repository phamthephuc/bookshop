<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- tables -->
				
				<div class="table-heading">
					<h2>Salecode</h2>
					<c:if test="${not empty msg }">
						<h3 style="text-align: center;" class="label label-success">${msg }</h3>
					</c:if>
				</div>
				
				<div class="agile-tables">
					<div class="w3l-table-info">
					
					  <h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/salecode/add">Thêm SaleCode</a></h3>
					    <table id="table">
						<thead>
						  <tr>
							<th>ID</th>
							<th>Mã code</th>
							<th>Discount</th>
							<th >Số lượng còn</th>
							<th >Chức năng</th>
						  </tr>
						</thead>
						<tbody>
						<c:forEach items="${listSaleCode }" var="salecode">
						  <tr>
							<td>${salecode.id_code }</td>
							<td>${salecode.code}</td>
							<td>${salecode.discount }%</td>
							<td>${salecode.number_rest}</td>
							<td>
								 <a href="${pageContext.request.contextPath }/admin/salecode/edit/${salecode.id_code }" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                             <a href="${pageContext.request.contextPath }/admin/salecode/del/${salecode.id_code }" onclick="return confirm('Bạn có chắc muốn xóa code này không?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
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