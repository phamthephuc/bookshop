<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="main-grid">
	<div class="agile-grids">
		<!-- input-forms -->
		<div class="grids">
			<div class="progressbar-heading grids-heading">
				<h2>THỐNG KÊ CÁC ĐƠN HÀNG</h2>
			</div>
			<div class="panel panel-widget forms-panel">
				<div class="forms">
					<div class="form-grids widget-shadow" data-example-id="basic-forms">
						<div class="form-title">
							<h3>
								<a class="label label-info"
									href="${pageContext.request.contextPath }/admin">Quay
									lại</a>
							</h3>
						</div>
						<div class="form-body">
							<form action="" method="post">
								<div class="form-group">
								<label for="exampleInputEmail1">Chọn tháng</label> 
									<select name="month" class="form-control" onchange="return thongke();"
										id="month">
										<option value="0" >Tất cả</option>
										<c:forEach begin="1" end="12" var="month">
											
											<option value="${month }" <c:if test="${crMonth == month }">selected="selected"</c:if> >Tháng ${month }</option>
										</c:forEach>
									</select>
								<label for="exampleInputEmail1">Chọn năm</label> 	
									<select name="year" class="form-control" onchange="return thongke();"
										id="year">
										<c:forEach begin="${minYear }" end="${maxYear }" var="year">
											<option <c:if test="${crYear == year }">selected="selected"</c:if> value="${year }">Năm ${year }</option>
										</c:forEach>
									</select>	
										
									
									
									<div class="agile-tables">
										<div class="w3l-table-info" id="ajax4">

											<table id="table">
												<thead>
													<tr>
														<th>ID</th>
														<th>Tổng tiền</th>
														<th>Xem chi tiết</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listOrder }" var="order">
														<tr>
															<td>${order.id_order }</td>
															<td>${order.amount }$</td>
															<td> <a href="${pageContext.request.contextPath }/admin/order/view/${order.id_order }" title="" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open "></span> Xem</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<br>
											<div style="color:green;float: right" >Tổng tiền : ${tongTien }$</div><br>
										</div>
									</div>
								</div>
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
<script>	
	function thongke(){
		var month_tmp = $("#month").val();
		var year_tmp = $("#year").val();
		
		$.ajax({
			url: '${pageContext.request.contextPath}/thong-ke',
			type: 'POST',
			cache: false, 
			data: {
				//Dữ liệu gửi đi
				month:month_tmp,
				year: year_tmp,
			},
			success: function(data){
				$("#ajax4").html(data);
			},
			error: function (){
				// Xử lý nếu có lỗi
				alert("Có lỗi trong quá trình xử lý");
			}
		});
	}
</script>

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