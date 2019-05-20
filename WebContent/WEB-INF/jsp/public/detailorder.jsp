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
						href="${pageContext.request.contextPath}/chinh-sua-thong-tin">Thông
							tin tài khoản</a></li>
					<li><a
						href="${pageContext.request.contextPath}/xem-don-hang">Đơn
							hàng của tôi</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sortable" id="layoutGroup4">
		<table style="background-color: #ffffff;" width="900" cellspacing="3"
			cellpadding="0">
			<tbody>
				<tr>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="1"
							bordercolor="#f2f2f2">
							<tbody>
								<tr>
									<th
										style="padding: 5px; width: 50%; text-align: left; font-size: 14px">
										Địa chỉ giao hàng</th>
								</tr>
								<tr style="line-height: 28px;">
									<td style="padding: 10px 5px; width: 100%">
										<div style="font-weight: bold">${order.fullname }</div>
										<div>${order.address_ship }</div>
										<div>SDT: ${order.phone }</div>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table style="background-color: #ffffff;" width="900" cellspacing="3"
			cellpadding="0">
			<tbody>
				<tr>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="1"
							bordercolor="#f2f2f2">
							<tbody>
								<tr>
									<td
										style="padding: 4px 5px; font-size: 13px; font-weight: bold;">
										Sản phẩm</td>
									<td
										style="padding: 4px 5px; font-size: 13px; font-weight: bold; text-align: right">
										Số lượng</td>
									<td
										style="padding: 4px 5px; font-size: 13px; font-weight: bold; text-align: right">
										Giá bán</td>
									<td
										style="padding: 4px 5px; font-size: 13px; font-weight: bold; text-align: right">
										Tạm tính</td>
								</tr>
								<% float total = 0; %>
								<c:forEach items="${listDetailOrder }" var="objDetailOrder">
									<tr class="products">
										<td valign="top" style="padding: 4px 5px;"><strong><a href="${pageContext.request.contextPath}/sach-truyen/${objDetailOrder.id_pro}/${slugUtil.makeSlug(objDetailOrder.name_pro)}.html" title="${objDetailOrder.name_pro }">${objDetailOrder.name_pro }</a></strong></td>
										<td valign="top" style="padding: 4px 5px;" align="right">${objDetailOrder.qty }</td>
										<c:set value="${objDetailOrder.price - objDetailOrder.sale * objDetailOrder.price / 100}" var="promo_price"></c:set>
										<td valign="top" style="padding: 4px 5px;" align="right"><fmt:formatNumber type="number"
										value="${promo_price }" />
											₫</td>	
										<td valign="top" style="padding: 4px 5px;" align="right"><fmt:formatNumber type="number"
										value="${promo_price * objDetailOrder.qty }" />
											₫</td>
										<c:set var="total" value="${total + (promo_price * objDetailOrder.qty ) }"></c:set>	
									</tr>
								</c:forEach>
								<tr>
									<td></td>
									<td style="padding: 4px 0;" align="right" colspan="2">Tạm
										tính:</td>
									<td align="right"><fmt:formatNumber type="number"
										value="${total }" /> ₫</td>
								</tr>
								<tr>
									<td></td>
									<td style="padding: 4px 0" align="right" colspan="2">Phí
										vận chuyển:</td>
									<td align="right"><c:if test="${total >= freeShipPrice}">${shipFee}</c:if> ₫</td>
									
								</tr>
								<tr>
									<td></td>
									<td style="padding: 4px 0" align="right" colspan="2"><strong>Tổng
											tiền:</strong></td>
									<c:if test="${total >= freeShipPrice}">
										<c:set value="${total + shipFee }" var="total"></c:set>
									</c:if>
									<td align="right"><strong><fmt:formatNumber type="number"
										value="${total }" /> ₫</strong></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>


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