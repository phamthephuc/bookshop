<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container"></div>
<div class="clear">&nbsp;</div>


<div id="container">
	<div id="content_left_contener">
		<div class="sortable" id="layoutGroup5">
			<div class="block" id="module_checkoutend">
				<h4>Hình thức thanh toán</h4>
				<div class="blockcontent">
					<form method="post" name="coe" id="coe"
						action="${pageContext.request.contextPath}/hinh-thuc-thanh-toan"
						onsubmit="return ValidateForm(CheckForm);">
						<table cellpadding="2" cellspacing="2" width="100%">
							<tbody>
								<c:forEach items="${listPayments }" var="objPayment">
									<tr>
									<td valign="top" nowrap="nowrap" width="2%"><input
										type="radio" name="id_payment" id="payment3" value="${objPayment.id }"
										checked="checked"></td>
									<td valign="top">${objPayment.name }
										<div style="margin: 10px 0; font-size: 90%" id="menthodinfo3"></div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													$('#forwardStep')
															.bind(
																	'click',
																	function() {
																		var page = $(
																				this)
																				.attr(
																						'rel');
																		alert('Kích vào nút Paypal để tiến hành thanh toán');
																	});
												});
							</script>

						</table>
						<div align="center">
							<input type="submit" id="smform" align="absmiddle"
								class="redbuttom Field250" value="Đặt mua"> <input
								type="hidden" name="C5a2743f0b2c02051d09c5fb8db9ca9d5" value="1">
							<input type="hidden" name="giftfee" id="giftfeevalue"
								value="10000">
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div id="oder_footer">
				<div class="fleft">
					Bạn cần hỗ trợ? Gọi HotLine: <b>097. 4941. 097</b>
				</div>
				<div class="oder_footer_menu">
					<ul>
						<li class="First"><a href="/" title="Trang chủ"
							target="_self">Trang chủ</a></li>
						<li class="nomal"><a
							href="/contents/danh-muc/2/cau-hoi-thuong-gap.html"
							title="Câu hỏi thường gặp" target="_self">Câu hỏi thường gặp</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="sortable" id="layoutGroup6">
		<div class="block" id="module_orderadress">
			<div class="blockcontent">
				<table cellpadding="0" cellspacing="0" width="100%"
					class="orderproducts">
					<tbody>
						<tr>
							<th class="mtitle" width="90%"><span>Địa chỉ giao
									hàng</span></th>
							<th class="mtitle"><a href="${pageContext.request.contextPath}/thong-tin-giao-hang" >Sửa</a></th>
						</tr>
						<tr>
							<td colspan="2">Anh/Chị: ${order.fullname }</td>
						</tr>
						<tr>
							<td colspan="2">${order.address_ship }</td>
						</tr>
						<tr>
							<td colspan="2">Điện thoại: ${order.phone }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="block" id="module_ordercart">
			<div class="blockcontent">
				<table cellpadding="0" cellspacing="0" width="100%"
					class="orderproducts">
					<tbody>
						<tr>
							<th class="mtitle" width="90%"><span>Đơn hàng</span>
								(${listDetailOrder.size() } Sản phẩm)</th>
							<th class="mtitle"><a class="cboxy" title="Đơn hàng"
								href="javascript:void(0)" onclick="return showCart();">Sửa</a></th>
						</tr>
					</tbody>
				</table>
				<div class="ordercartmin">
					<table cellpadding="0" cellspacing="0" width="100%"
						class="orderproducts">
						<tbody>
							<c:forEach items="${listDetailOrder }" var="objCart">
								<tr style="height: 65px;">
									<td valign="top"><a
										href="${pageContext.request.contextPath}/sach-truyen/${objCart.id_pro}/${slugUtil.makeSlug(objCart.name_pro)}.html"
										title="${objCart.name_pro }">${objCart.qty } <i
											class="fa fa-times" aria-hidden="true"></i>
											${objCart.name_pro }
									</a></td>
									<td valign="top" nowrap="nowrap" align="right">${objCart.qty * slugUtil.formatPrice(objCart.price - objCart.price * objCart.sale / 100) }
										₫</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<table cellpadding="0" cellspacing="0" width="100%"
					class="orderproducts">
					<tbody>
						<tr class="subtotal">
							<td>Tạm tính</td>
							<td nowrap="nowrap" align="right" id="subtotalvl">${sumMoney }
								₫</td>
						</tr>
						<tr>
							<td>Phí vận chuyển</td>
							<c:if test="${shipFee == 0 }">
								<td nowrap="nowrap" align="right" id="shipfeevl">Free Ship</td>
							</c:if>
							<c:if test="${shipFee > 0 }">
								<td nowrap="nowrap" align="right" id="shipfeevl">${shipFee } ₫</td>
							</c:if>
						</tr>
						<tr class="total">
							<td>Tổng tiền</td>
								<td nowrap="nowrap" align="right" id="totalcacul">${sumMoney + shipFee}
							₫</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="shipPage" style="visibility: hidden;">shipPage</div>
		</div>
		<div class="clear"></div>
	</div>