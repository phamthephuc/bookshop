<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/"
				title="Trang chủ">Trang chủ</a></li>
			<li>Đơn hàng của tôi</li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<script type="text/javascript">
if(${err eq 0}) alert("LỖI! Vui lòng bạn cập nhập lại");
if(${msg eq 1}) alert("Cập nhập thành công");
		</script>
<div id="container">
	<div class="sortable" id="layoutGroup3">
		<div class="block" id="module_customerMenu">
			<h2>Tài khoản của bạn</h2>
			<div class="blockcontent">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/quan-ly-tai-khoan">Quản lý tài
							khoản</a></li>
					<li><a
						href="${pageContext.request.contextPath}/thay-doi-thong-tin">Thông
							tin tài khoản</a></li>
					<li class="bold">Đơn
							hàng của tôi</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sortable" id="layoutGroup4">
		<div class="block" id="module_customersorders">
			<h3>Đơn hàng của tôi</h3>
			<div class="blockcontent">
				<table cellpadding="0" cellspacing="0" width="100%"
					class="ordertable">
					<tbody>
						<tr>
							<th nowrap="nowrap" width="2%">Đơn hàng</th>
							<th align="left">Ngày mua</th>
							<th align="left">Gởi đến</th>
							<th align="left">Tình trạng đơn hàng</th>
							<th align="left">Chức năng</th>
						</tr>
						<c:forEach items="${listOrderByCustomer }" var="objOrder">
							<tr>
								<td nowrap="nowrap"><a
									href="${pageContext.request.contextPath}/chi-tiet-don-hang/${objOrder.id_order }">${objOrder.id_order }</a>
								</td>
								<td><fmt:formatDate pattern="dd/MM/yyyy hh:mm:ss"
										value="${objOrder.date_create_order }" var="date" />${date }</td>
								<td>${objOrder.fullname }</td>
								<td><span id="statusOrder${objOrder.id_order}">${objOrder.name_status }</span></td>
								<td align="center"><a
									href="${pageContext.request.contextPath}/chi-tiet-don-hang/${objOrder.id_order }"><b>Xem
											đơn hàng</b></a>
									<br>
									<div id="cancelOrder${objOrder.id_order}">
										<c:if test="${objOrder.id_status == 0 }">
											<a style="color: red;" href="javascript:" onclick="return huyDonHang(${objOrder.id_order });"><b>Hủy đơn hàng</b></a>
										</c:if>
									</div>
								</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="clear">&nbsp;</div>

				<div class="clear"></div>
			</div>
		</div>
		<script>
	function openwin(add, name, w, h)
	{
		var l = screen.availWidth / 2 - 450;
		var t = screen.availHeight / 2 - 320;
		var win = window.open(add, name, 'width='+w+',height='+h+',left='+l+',top='+t+',scrollbars=1');
	}
</script>
	</div>
	<div class="clear"></div>
</div>