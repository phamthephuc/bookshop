<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="main-grid">
	<div class="agile-grids">
		<!-- input-forms -->
		<div class="grids">
			<div class="progressbar-heading grids-heading">
				<h2>XEM THÔNG TIN ĐƠN HÀNG</h2>
			</div>
			<div class="panel panel-widget forms-panel">
				<div class="forms">
					<div class="form-grids widget-shadow" data-example-id="basic-forms">
						<div class="form-title">
							<h3>
								<a class="label label-info"
									href="${pageContext.request.contextPath }/admin/orders">Quay
									lại</a>
							</h3>
						</div>
						<div class="form-body">
							<form action="" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Fullname</label> <input
										disabled="disabled" type="text" name="" class="form-control"
										id="exampleInputEmail1" placeholder=""
										value="${order.fullname }"> <label
										for="exampleInputEmail1">Số điện thoại</label> <input
										disabled="disabled" type="text" name="" class="form-control"
										id="exampleInputEmail1" placeholder="" value="${order.phone }">
									<label for="exampleInputEmail1">Email</label> <input
										disabled="disabled" type="text" name="" class="form-control"
										id="exampleInputEmail1" placeholder="" value="${order.email }">
									<label for="exampleInputEmail1">Địa chỉ</label> <input
										disabled="disabled" type="text" name="" class="form-control"
										id="exampleInputEmail1" placeholder=""
										value="${order.address_ship }"> <label
										for="exampleInputEmail1">Date Order</label> <input
										disabled="disabled" type="text" name="" class="form-control"
										id="exampleInputEmail1" placeholder=""
										value="${order.date_create_order }"> <label
										for="exampleInputEmail1">Hình thức thanh toán</label> <input
										disabled="disabled" type="text" name="" class="form-control"
										id="exampleInputEmail1" placeholder=""
										value="${order.name_payment }"> <label
										for="exampleInputEmail1">Tình trạng đơn hàng</label>
									<c:choose>
										<c:when
											test="${order.id_status == 2 || order.id_status == 4 }">
											<input disabled="disabled" type="text" name=""
												class="form-control" id="exampleInputEmail1" placeholder=""
												value="${order.name_status }">
										</c:when>
										<c:otherwise>
											<select name="id_status" class="form-control"
												id="exampleInputEmail1">
												<c:forEach items="${listStatus }" var="status">
													<option
														<c:if test="${status.id_status == order.id_status }">selected="selected"</c:if>
														value="${status.id_status }">${status.name_status }</option>
												</c:forEach>
											</select>
										</c:otherwise>
									</c:choose>
									<div class="agile-tables">
										<div class="w3l-table-info">

											<table id="table">
												<thead>
													<tr>
														<th>ID</th>
														<th>Tên sản phẩm</th>
														<th>Số lượng</th>
														<th>Giá gốc</th>
														<th>Giá đã giảm</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listDetailOrder }" var="detailOrder">
														<tr>
															<td>${detailOrder.id_detailOrder }</td>
															<td>${detailOrder.name_pro }</td>
															<td>${detailOrder.qty }</td>
															<td>${detailOrder.price }</td>
															<td>${detailOrder.price - detailOrder.price/100*detailOrder.sale }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<br>
											<div style="color:green;float: right" >Tổng tiền : ${order.amount }</div><br>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-default w3ls-button">Lưu</button>
							</form>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- //input-forms -->
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