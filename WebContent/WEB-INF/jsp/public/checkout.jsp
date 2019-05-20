<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container"></div>
<div class="clear">&nbsp;</div>
<script type="text/javascript">
if(${err eq 3}) alert("LỖI! Bạn chưa thanh toán, vui lòng kiểm tra lại!");
</script>
<div id="container">
	<div id="content_left_contener">
		<div class="sortable" id="layoutGroup5">
			<div class="block" id="module_addressorder">
				<h4>Địa chỉ giao hàng</h4>
				<div class="blockcontent">
					<div class="notlogin">
						<div class="addresscontain" style="display: none">
							<div class="addressintro">Sử dụng địa chỉ có sẵn bên dưới</div>
							<form method="post" name="rgt" id="rgt"
								action="${pageContext.request.contextPath}/checkend">

								<div class="field">
									<div class="textlabel">&nbsp;</div>
									<input type="submit" class="bluebuttom Field250"
										value="Tiếp tục"> <input type="hidden"
										name="C5a2743f0b2c02051d09c5fb8db9ca9d5" value="1">
								</div>
							</form>
						</div>
						<div class="orther" style="display: none">
							Bạn muốn giao đến địa chỉ khác? <a href="javarscript:"
								onclick="showform()">Thêm địa chỉ giao hàng mới</a>
						</div>
						<div class="addform" id="addform">
							<form method="post" name="rgt" id="rgt"
								action="${pageContext.request.contextPath}/thong-tin-giao-hang"
								onsubmit="return ValidateForm(CheckForm);">
								<div class="field">
									<div class="textlabel">
										<label for="fullname">Họ và tên</label> <span class="Required">*</span>:
									</div>
									<input onfocus="showhelp(4)" onblur="fonblur(4)"
										autocomplete="off" id="fullname" type="text" name="fullname"
										value='${order.fullname}'> <span class="help"
										id="help4"></span>
								</div>
								<div class="field">
									<div class="textlabel">
										<label for="telephone">Email</label> <span
											class="Required">*</span>:
									</div>
									<input onfocus="showhelp(3)" onblur="fonblur(3)"
										autocomplete="off" id="email" type="text" name="email"
										value='${order.email}'> <span class="help"
										id="help3"></span>
								</div>
								<div class="field">
									<div class="textlabel">
										<label for="telephone">Điện thoại</label> <span
											class="Required">*</span>:
									</div>
									<input onfocus="showhelp(5)" onblur="fonblur(5)"
										autocomplete="off" id="telephone" type="text" name="phone"
										value='${order.phone}'> <span class="help"
										id="help5"></span>
								</div>
								<div class="field">
									<div class="textlabel">
										<label for="street">Địa chỉ</label> <span class="Required">*</span>:
									</div>
									<textarea cols="82" style="width: 85%;"
										placeholder="Nhập địa chỉ chính xác của bạn. Số nhà, tòa nhà (nếu có), tên đường…"
										onfocus="showhelp(6)" onblur="fonblur(6)" name="address_ship"
										id="street" rows="5">${order.address_ship }</textarea>
									<span class="help" id="help6"></span>
								</div>
								<div class="field">
									<div class="textlabel">
										<label for="street">Lời nhắn</label> <span class="Required">*</span>:
									</div>
									<textarea cols="82" style="width: 85%;"
										placeholder="Nhập lời nhắn của bạn" name="message"
										id="message" rows="5">${order.message }</textarea>
								</div>
							<!-- <div class="field">
									<div class="textlabel">&nbsp;</div>
									<input type="checkbox" value="1" name="isdefault"
										id="isdefault" checked="checked"> <label
										for="isdefault">Địa chỉ giao hàng mặc định</label>
								</div>
							 -->	
								<div class="field">
									<div class="textlabel">&nbsp;</div>
									<input type="submit" class="bluebuttom Field250"
										value="Tiếp tục"> <input type="hidden" id="countryid"
										name="countryid" value="1"> <input type="hidden"
										name="C5a2743f0b2c02051d09c5fb8db9ca9d5" value="1">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				function fonblur(id) {
					var err = false
					var fn = gde("fullname");
					var tlp = gde("telephone");
					var em = gde("email");
					var str = gde("street");
					var wid = gde("wardid");

					if (id == 3) {
						if (em.value == "") {
							$("#help3").empty();
							$("#help3")
									.append(
											'<span class="error">Vui lòng nhập email của bạn</span>');
						} else {
							$("#help3").empty();
						}
					}
					
					if (id == 4) {
						if (fn.value == "") {
							$("#help4").empty();
							$("#help4")
									.append(
											'<span class="error">Vui lòng nhập tên của bạn</span>');
						} else {
							$("#help4").empty();
						}
					}

					if (id == 5) {
						if (tlp.value == "") {
							$("#help5").empty();
							$("#help5")
									.append(
											'<span class="error">Vui lòng nhập điện thoại</span>');
						} else {
							$("#help5").empty();
						}
					}

					if (id == 6) {
						if (str.value == "") {
							$("#help6").empty();
							$("#help6")
									.append(
											'<span class="error">Vui lòng nhập địa chỉ</span>');
						} else {
							$("#help6").empty();
						}
					}

					return false;
				}

				function CheckForm() {
					var err = false
					var fn = gde("fullname");
					var tlp = gde("telephone");
					var str = gde("street");
					var wid = gde("wardid");
					if (fn.value == "") {
						$("#help4").empty();
						$("#help4")
								.append(
										'<span class="error">Vui lòng nhập tên của bạn</span>');
						err = true;
					}

					if (tlp.value == "") {
						$("#help5").empty();
						$("#help5")
								.append(
										'<span class="error">Vui lòng nhập điện thoại</span>');
						err = true;
					}
					if (str.value == "") {
						$("#help6").empty();
						$("#help6")
								.append(
										'<span class="error">Vui lòng nhập địa chỉ</span>');
						err = true;
					}

					if (err) {
						Boxy
								.alert(
										'Dữ liệu nhập vào không đúng, vui lòng kiểm tra lại',
										null, {
											title : 'Lỗi'
										});
						return false;
					} else {
						return true;
					}
				}

				function showhelp(id) {
					$("#help" + id).empty();
				}

				function showform() {
					if ($('#addform').css('display') == 'none') {
						$("#addform").show();
					} else {
						$("#addform").hide();
					}
				}

				function checkdistrict(sid) {
					$("#help9").empty();
					address = '/orders/districts/index.html';
					address = addQuery(address, 'stateid=' + sid);
					$.ajax({
						url : address,
						dataType : "html",
						type : "GET",
						cache : false,
						error : function(e) {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Lỗi'
							});
							return;
						},
						success : function(data) {
							$("#districts").empty();
							$("#districts").append(data);
							return;
						}
					});
				}

				function checklocation(did) {
					$("#help10").empty();
					address = '/orders/locations/index.html';
					address = addQuery(address, 'did=' + did);
					$.ajax({
						url : address,
						dataType : "html",
						type : "GET",
						cache : false,
						error : function(e) {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Lỗi'
							});
							return;
						},
						success : function(data) {
							$("#wardid").empty();
							$("#wardid").append(data);
							return;
						}
					});
				}
			</script>
			<div class="clear"></div>
			<div id="oder_footer">
				<div class="fleft">
					Bạn cần hỗ trợ? Gọi HotLine: <b>0165.263.8375</b>
				</div>
				<div class="oder_footer_menu">
					<ul>
						<li class="nomal"><a href="" title="Câu hỏi thường gặp"
							target="_self">Câu hỏi thường gặp</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="sortable" id="layoutGroup6">
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
		<script type="text/javascript">
			$(function() {
				$('#codfeeshow').hide();
				$('#giffeeshow').hide();

				$('.cboxy').boxy({
					afterHide : function() {
						location.reload();
					},
					ovlay : true
				});

				if ($('input:radio[name="payment"]').length) {
					getcartvalue();
				}

				$('input:radio[name="payment"]').change(function() {
					getcartvalue();
				});

				$('input:checkbox[name="gift"]').change(function() {
					getcartvalue();
				});

				function getcartvalue() {
					var gifvalue = 0;
					var codvalue = 0;
					var giftfeevalue = gde('giftfeevalue');
					var fp = gde("coe").elements;

					if (gde("gift").checked == true) {
						gifvalue = 1;
					}

					for (i = 0; i < fp.length; i++) {
						if (fp[i].type == "radio" && fp[i].name == 'payment') {
							if (fp[i].checked) {
								codvalue = fp[i].value;
								$('#menthodinfo' + codvalue).show();
							} else {
								$('#menthodinfo' + fp[i].value).hide();
							}
						}
					}

					url = addQuery('/orders/getcartvalue/index.html',
							'gifvalue=' + gifvalue);
					url = addQuery(url, 'giftfee=' + giftfeevalue.value);
					url = addQuery(url, 'codvalue=' + codvalue);

					$.ajax({
						dataType : "json",
						url : url,
						success : function(data, status) {
							codfee = data.codfee;
							if (codfee != '') {
								$('#codfeeshow').show();
								$('#codfee').empty();
								$('#codfee').append(codfee);
							} else {
								$('#codfeeshow').hide();
							}

							giffee = data.giffee;
							if (giffee != '') {
								$('#showgif').show();
								$('#giffeeshow').show();
								$('#giftfee').empty();
								$('#giftfee').append(giffee);
							} else {
								$('#showgif').hide();
								$('#giffeeshow').hide();
							}

							$('#subtotalvl').empty();
							$('#subtotalvl').append(data.subtotal);
							$('#shipfeevl').empty();
							$('#shipfeevl').append(data.shipfee);
							$('#couponvl').empty();
							$('#couponvl').append(data.coupon);
							$('#totalcacul').empty();
							$('#totalcacul').append(data.totalam);
						},
						error : function() {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Lỗi'
							});
						}
					});

				}
			});
		</script>
	</div>
	<div class="clear"></div>
</div>