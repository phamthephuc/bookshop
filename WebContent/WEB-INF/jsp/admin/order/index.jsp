<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- tables -->
				
				<div class="table-heading">
					<h2>Order</h2>
					<c:if test="${not empty msg }">
						<h3 style="text-align: center;" class="label label-success">${msg }</h3>
					</c:if>
				</div>
				
				<div class="agile-tables">
					<div class="w3l-table-info">
					
					    <table id="table">
						<thead>
						  <tr>
							<th>ID</th>
							<th>Full name</th>
							<th>Phone</th>
							<th >Email</th>
							<th >Địa chỉ</th>
							<th >Tổng tiền</th>
							<th >Hình thức thanh toán</th>
							<th >Thông điệp</th>
							<th >Ngày lập đơn</th>
							<th >Tình trạng đơn hàng</th>
							<th >Chức năng</th>
						  </tr>
						</thead>
						<tbody>
						<c:forEach items="${listOrder }" var="order">
						  <tr>
							<td>${order.id_order }</td>
							<td>${order.fullname }</td>
							<td>${order.phone }</td>
							<td>${order.email }</td>
							<td>${order.address_ship }</td>
							<td>${order.amount }</td>
							<td>${order.name_payment }</td>
							<td>${order.message }</td>
							<td>${order.date_create_order }</td>
							<td>${order.name_status }</td>
							<td>
								 <a href="${pageContext.request.contextPath }/admin/order/view/${order.id_order }" title="" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open "></span> Xem</a>
	                             <a href="${pageContext.request.contextPath }/admin/order/del/${order.id_order }" onclick="return confirm('Bạn có chắc muốn xóa order này không?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
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