<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${title }</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description"
	content="Mua sách online với giá và dịch vụ tốt nhất tại  Nobita.vn. Giao hàng thu tiền tân nơi, bọc Plastic miễn phí, đổi trả hàng nhanh chóng,..." />
<meta name="keywords"
	content="nobita.vn, nobita, mua sách online, nhà sách trên mạng, nhà sách trực tuyến, sách bán chạy" />
<meta name="generator"
	content="Mua sách online với giá và dịch vụ tốt nhất tại  Nobita.vn. Giao hàng thu tiền tân nơi, bọc Plastic miễn phí, đổi trả hàng nhanh chóng,..." />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="Copyright" content="Design A web.">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/templates/public/nobita.vn/stores/images/word-art-drop-G-01.png" />
<link type="text/css"
	href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/styles.css"
	rel="stylesheet" />
<!-- FONT  -->
<link type="text/css"
	href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/font-awesome.min.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/styles.resolution.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/css/boxy.css"
	type="text/css" />
<style>
	.hidein {
		display: none !important;
	}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/js/jquery-1.8.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/templates/public/ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/js/common.js"></script>
<script type='text/javascript'
	src='${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/js/jquery.boxy.js'></script>
<script type="text/javascript">
	var app = '';
</script>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<c:choose>
	<c:when test="${home eq true }">
		<link
			href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/home.css"
			type="text/css" rel="stylesheet" />
	</c:when>
	<c:otherwise>
		<link
			href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/products.css"
			type="text/css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/users.css"
			type="text/css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/customers.css"
			type="text/css" rel="stylesheet" />
	</c:otherwise>
</c:choose>

<!--[if IE]>
	<link rel="stylesheet" href="layouts/fontpage/css/styles.ie.css" type="text/css" />
    <![endif]-->
<!-- Facebook Pixel Code -->
<script>
	!function(f, b, e, v, n, t, s) {
		if (f.fbq)
			return;
		n = f.fbq = function() {
			n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
					.push(arguments)
		};
		if (!f._fbq)
			f._fbq = n;
		n.push = n;
		n.loaded = !0;
		n.version = '2.0';
		n.queue = [];
		t = b.createElement(e);
		t.async = !0;
		t.src = v;
		s = b.getElementsByTagName(e)[0];
		s.parentNode.insertBefore(t, s)
	}(window, document, 'script',
			'https://connect.facebook.net/en_US/fbevents.js');
	fbq('init', '329084620879246', {
		em : 'insert_email_variable,'
	});
	fbq('track', 'PageView');
</script>
<noscript>
	<img height="1" width="1" style="display: none"
		src="${pageContext.request.contextPath}/templates/public/www.facebook.com/tr-id=329084620879246-ev=PageView-noscript=1.htm-" />
</noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->
<script
	src='${pageContext.request.contextPath}/templates/public/www.google.com/recaptcha/api.js'></script>
</head>

<body>
	<div id="main_contener">
		<script>
			window.fbAsyncInit = function() {
				FB.init({
					appId : '1976974442557058',
					cookie : true,
					xfbml : true,
					version : 'v2.8'
				});
				FB.AppEvents.logPageView();
			};

			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) {
					return;
				}
				js = d.createElement(s);
				js.id = id;
				js.src = "//connect.facebook.net/en_US/sdk.js";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
			//===========================//
			/* 	window.fbAsyncInit = function() {
					FB.init({
						appId : '428690924198349',
						cookie : true,
						xfbml : true,
						version : 'v2.8'
					});
					FB.AppEvents.logPageView();
				};

				(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id)) {
						return;
					}
					js = d.createElement(s);
					js.id = id;
					js.src = "//connect.facebook.net/en_US/sdk.js";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk')); */
		</script>
		<div id="header">
			<div class="block banner " id="banner_TopHeader">
				<div class="blockcontent"></div>
			</div>
		</div>
		<div id="header">
			<div class="top_header">
				<div id="container">
					<div class="mainlogo">
						<div class="block banner " id="banner_mainlogo">
							<div class="blockcontent">
								<a href="${pageContext.request.contextPath}/" title="Logo chính"
									target="_self"><img
									src="${pageContext.request.contextPath}/templates/public/nobita.vn/stores/images/logo.png"
									border="0" title="Logo chính" width="220" height="44"></a>
							</div>
						</div>
					</div>
					<div class="rightheader">
						<div class="search">
							<div>
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<td class="input" width="100%"><input type="text"
											value="${keyword }" name="keyword1" id="keyword1"
											size="10" class="inputfield" title="Tìm" autocomplete="off"
											onfocus="clearText(this)" onblur="clearText(this)" /></td>
										<td class="search-submit" nowrap="nowrap" width="40"><a id="search" onclick="searchKey()" href="javascript:void(0)">Tìm</a></td>
									</tr>
								</table>
							</div>
							<div class="autocomplete" id="autocomplete"></div>
						</div>
						<div class="shoptool">
							<ul class="right_topbar">
								<li><c:choose>
										<c:when test="${objUserLogin ne null }">
											<c:set value="${objUserLogin.fullname }" var="fullname"></c:set>
											<div class="textlable" title="Tài khoản của bạn">
												${fullname }<i class="fa fa-sort-desc"></i>
											</div>
											<div class="subcontent">
												<c:if test="${objUserLogin.role_id eq 3 }">
													<div class="meminfo">
														<div>
															<a href="${pageContext.request.contextPath}/quan-ly-tai-khoan">Quản
																lý tài khoản</a>
														</div>
														<div>
															<a
																href="${pageContext.request.contextPath}/thay-doi-thong-tin">Thông
																tin tài khoản</a>
														</div>
														<div>
															<a
																href="${pageContext.request.contextPath}/xem-don-hang">Đơn
																hàng của tôi</a>
														</div>
													</div>
												</c:if>
												<div class="buttom">
													<div>
														<a class="btn_login"
															href="${pageContext.request.contextPath}/dang-xuat">Đăng
															xuất</a>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="textlable" title="Tài khoản của bạn">
												Tài khoản của bạn<i class="fa fa-caret-down"
													aria-hidden="true"></i>
											</div>
											<div class="subcontent">
												<div class="buttom">
													<div>
														<a class="btn_login"
															href="${pageContext.request.contextPath}/dang-nhap">Đăng
															nhập</a>
													</div>
													<div align="center" class="loginlink">
														Khách hàng mới? <a
															href="${pageContext.request.contextPath}/dang-ky">Tạo
															tài khoản</a>
													</div>
												</div>

											</div>
										</c:otherwise>
									</c:choose></li>
								<script>
									function checkLoginState() {
										FB
												.getLoginStatus(function(
														response) {
													if (response.status === 'connected') {
														testAPI(response);
													} else {
														FB
																.login(
																		function(
																				response) {
																			if (response.authResponse) {
																				if (response.status) {
																					testAPI(response);
																				}
																			}
																		},
																		{
																			scope : 'public_profile,email'
																		});
													}
												});
									}
									function testAPI(response) {
										var accessToken = response.authResponse.accessToken;

										FB
												.api(
														'/me',
														function(response) {
															url = '${pageContext.request.contextPath}/facelogin';
															url = addQuery(
																	url,
																	'fid='
																			+ response.id);
															url = addQuery(
																	url,
																	'access_token='
																			+ accessToken);

															document.location.href = url;
														});
									}
									window.fbAsyncInit = function() {
										FB.init({
											appId : '1976974442557058',
											cookie : true,
											xfbml : true,
											version : 'v2.1'
										});
									};
								</script>
								<li>
									<div class="textlable" title="Giỏ hàng">
										 <i class="fa fa-shopping-cart" aria-hidden="true"></i> Giỏ
										hàng ( 
										<% if (session.getAttribute("numProduct") == null) { %>
											<span class="shownumber">0</span>
										<% } else { %>
											<span class="shownumber">
											<%=session.getAttribute("numProduct") %>
											</span>
										<% } %>
										) 
									</div>
									<div class="subcontent">
										<h3>Giỏ hàng</h3>
										<div id="cartslist"></div>
										<div class="buttom" id="showcartlink">
											<a class="cartlink" href="javascript:void(0)"
												onclick="return showCart();" title="GIỎ HÀNG CỦA TÔI">
												Xem giỏ hàng<i class="fa fa-play"></i>
											</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>

			<div class="clear"></div>
			<div id="mainmenu">
				<div id="container">
					<div class="mainmenu_contener">
						<div class="mainmenu">
							<span class="while"></span> <span><h2>
									<i class="fa fa-list" aria-hidden="true"></i>Danh mục sản phẩm
								</h2></span>
							<ul class="submenu0" id="submenu0"
								style="border-left: 1px outset;">
								<li class="group"><a href="javascript:" class="havechild"4>Nổi
										bật</a>
									<ul class="submenu1" id="submenu1">
										<li><a
											href="${pageContext.request.contextPath}/sach-ban-chay"
											target="_self">Sách bán chạy</a></li>
										<li><a href="${pageContext.request.contextPath}/sach-moi"
											target="_self">Sách mới</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sach-sap-phat-hanh"
											target="_self">Sắp phát hành</a></li>
									</ul></li>
								<c:forEach items="${hashCatParents.keySet()}" var="objCatParent">
									<li><a
										href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCatParent.cname) }/${objCatParent.cid}"
										class="havechild" 8 target="_self">${objCatParent.cname }</a>
										<ul class="submenu1" id="submenu1">
											<c:forEach items="${hashCatParents.get(objCatParent)}"
												var="objCatChild">
												<li><a
													href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCatChild.cname) }/${objCatChild.cid}"
													target="_self">${objCatChild.cname }</a></li>
											</c:forEach>
										</ul></li>
								</c:forEach>
								<li class="-bold">
									<a href="javascript:" class="havechild"4>Nhà phát hành</a>
									<ul class="submenubig" id="submenu1">
										<c:forEach items="${listPublishers }" var="objPublisher">
											<li class="-bold"><a
												href="${pageContext.request.contextPath}/nha-phat-hanh/${slugUtil.makeSlug(objPublisher.name) }/${objPublisher.pid}">${objPublisher.name }</a></li>
										</c:forEach>
									</ul></li>
								<li class="-bold"><a
									href="${pageContext.request.contextPath}/sach-goi-y"
									class="havechild" 0 target="_self">Sách gợi ý</a>
								</li>
							</ul>
						</div>
						<div class="hotline">
							<div class="block " id="content_SupportOnline">
								<div class="blockcontent">
									<div>
										<strong><span style="color: #000000;"><span
												style="font-size: 14px;">Hotline: <a
													href="https://www.facebook.com/phuc.pham.5268">0984.946.627 (Gặp
														Mr.Phuc)</a></span></span></strong>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="container"></div>
		<div class="clear"></div>
		<script language="javascript" type="text/javascript">
			function checksearch() {
				kw = gde("keyword1");
				if (kw.value == "" || kw.value == "Tìm...") {
					Boxy.alert("Vui lòng nhập từ khóa để tìm kiếm", null, {
						title : 'Thông báo'
					});
					kw.focus();
					return false;
				}
			}
			
			function checkKeyWordNotEmpty(keyword) {
				if (keyword == "" || keyword == "Tìm...") {
					Boxy.alert("Vui lòng nhập từ khóa để tìm kiếm", null, {
						title : 'Thông báo'
					});
					kw.focus();
					return false;
				}
				return true;
			}
			
			function searchKey() {
				kw = gde("keyword1");
				var keyValue = kw.value;
				if (checkKeyWordNotEmpty(keyValue)) {
					url = '${pageContext.request.contextPath}/tim-kiem/' + keyValue;
					document.location.href = url;
				}
			}

			function clearText(field) {
				if (field.defaultValue == field.value)
					field.value = '';
				else if (field.value == '')
					field.value = field.defaultValue;

			}

			$(document).mouseup(
					function(e) {
						var container = $(".search");
						if (!container.is(e.target)
								&& container.has(e.target).length === 0) {
							$("#autocomplete").hide();
						}
					});

			$(document).keydown(function(e) {
				if (e.which == 38 || e.which == 40) {
					var pid = 0;
					var pvalue = 0;
					var active = 0;
					if ($('#autocomplete').length > 0) {
						i = 0;
						$(".vsmall_products").each(function(index) {
							if ($(this).hasClass("headerpactive")) {
								pid = i;
								active = 1;
								$(this).removeClass("headerpactive");
							}
							i++;
						});

						if (e.which == 38) {
							pid--;
						}

						if (e.which == 40 && active == 1) {
							pid++;
						}

						if (pid < 0) {
							$("#productid").val(0);
						}

						if (pid == i) {
							$("#productid").val(0);
						}

						i = 0;
						$(".vsmall_products").each(function(index) {
							if (pid == i) {
								$("#productid").val(this.id);
								$(this).addClass("headerpactive");
							}
							i++;
						});
					}
					e.preventDefault();
				}
			});

			$("#keyword")
					.keyup(
							function(e) {
								if (e.which == 38 || e.which == 40) {
									return true;
								}

								kw = gde("keyword");
								if (kw == '') {
									$("#autocomplete").hide();
									return true;
								}
								address = '${pageContext.request.contextPath}/autocomplete';
								address = addQuery(address, 'keywords='
										+ kw.value);
								$.ajax({
									url : address,
									dataType : "html",
									type : "GET",
									cache : false,
									error : function(e) {
										Boxy.alert('Lỗi ajax', null, {
											title : 'Lỗi'
										});
										return false;
									},
									success : function(data) {
										if (data) {
											$("#autocomplete").empty();
											$("#autocomplete").append(data);
											$('#autocomplete').stop(true, true)
													.slideDown("normal");
										} else {
											$("#autocomplete").hide();
										}
									}
								});
							});

			function getcartnumber() {
				var cartNumber = $('#cartnumber').text() || <%=session.getAttribute("numProduct") %>
				$('.shownumber').empty();
				if (cartNumber) {
					$('.shownumber').append(cartNumber);
				} else {
					$('.shownumber').append(0);
					$('#showcartlink').hide();
					$('#cartslist').empty();
					$('#cartslist').append('<span class="empty">Giỏ hàng chưa có sản phẩm</span>');
				}
			}

			function getcartslist() {
				address = '${pageContext.request.contextPath}/cartslist';
				$
						.ajax({
							url : address,
							dataType : "html",
							type : "GET",
							cache : false,
							error : function(e) {
								Boxy.alert('Lỗi ajax list cart top', null, {
									title : 'Lỗi'
								});
								return false;
							},
							success : function(data) {
								if (data) {
									$("#cartslist").empty();
									$("#cartslist").append(data);
								} else {
									$('#showcartlink').hide();
									$('#cartslist').empty();
									$('#cartslist')
											.append(
													'<span class="empty">Giỏ hàng chưa có sản phẩm</span>');
								}
								return true;
							}
						});
			}
			function getupdatecartslist() {
				address = '${pageContext.request.contextPath}/showupdatecart';
				$
						.ajax({
							url : address,
							dataType : "html",
							type : "GET",
							cache : false,
							error : function(e) {
								Boxy.alert('Lỗi ajax update list cart', null, {
									title : 'Lỗi'
								});
								return false;
							},
							success : function(data) {
								if (data) {
									$("#module_ordercart").empty();
									$("#module_ordercart").append(data);
								} else {
									$('#showcartlink').hide();
									$('#module_ordercart').empty();
									$('#empty').val("1");
									$('#module_ordercart')
											.append(
													'<span class="empty">Giỏ hàng chưa có sản phẩm</span><br \>'
															+ '<span class="empty">Mời bạn đăng nhập để tiếp tục mua hàng.</span><br \>'
															+ '<span class="empty">Nếu chưa có tài khoản, hãy đăng ký ngay nào...</span><br \>');

								}
								return true;
							}
						});
			}
			function delecart(id, pid) {
				address = '${pageContext.request.contextPath}/deletecart';
				address = addQuery(address, 'id=' + id);
				$
						.ajax({
							url : address,
							dataType : "json",
							type : "GET",
							cache : false,
							error : function(e) {
								Boxy.alert('Lỗi ajax xoa', null, {
									title : 'Thông báo'
								});
								return;
							},
							success : function(data) {
								if (data.id > 0) {
									getcartnumber();
								} else {
									getcartnumber();
									$('#showcartlink').hide();
									$('#cartslist').empty();
									$('#cartslist')
											.append(
													'<span class="empty">Giỏ hàng chưa có sản phẩm</span>');
								}
							}
						});
			}
		</script>
		<div id="cart-show-new"
			style="z-index: 1339;position: fixed; top: 50%; left: 50%; width: 30em; height: 18em; margin-top: -17em; margin-left: -26em;  display: none;">
			<table cellspacing="0" cellpadding="0" border="0"
				class="boxy-wrapper fixed" id="cart-list"
				style="position: fixed; z-index: 1339; display: none;">
				<tbody>
					<tr>
						<td class="top-left"></td>
						<td class="top"></td>
						<td class="top-right"></td>
					</tr>
					<tr>
						<td class="left"></td>
						<td class="boxy-inner"><div class="title-bar">
								<h2>GIỎ HÀNG CỦA TÔI</h2>
								<a href="javascript:void(0)" onclick="return closeCart();"
									class="close">close X</a>
							</div>
							<div id="cart_container" class="cart_container boxy-content"
								style="display: block;">
								<div class="block" id="module_productscart">
									<!-- <div id="showempty"></div> -->


									<!-- Start: injected by Adguard -->




									<!-- End: injected by Adguard -->

								</div>
							</div></td>
						<td class="right"></td>
					</tr>
					<tr>
						<td class="bottom-left"></td>
						<td class="bottom"></td>
						<td class="bottom-right"></td>
					</tr>
				</tbody>
			</table>
			<span id="overlay" class="overlay" style="display: none;"></span>
		</div>
		<script type="text/javascript">
			function showCart() {
				address = '${pageContext.request.contextPath}/showBookToCart';
				$.ajax({
					url : address,
					dataType : "html",
					type : "POST",
					cache : false,
					error : function(e) {
						Boxy.alert('Lỗi ajax show', null, {
							title : 'Lỗi'
						});
						return false;
					},
					success : function(data) {
						$("#module_productscart").empty();
						$("#module_productscart").append(data);
						$("#module_productscart").append(
								'<input type="hidden" id="empty"></input>');
						getcartnumber();
						return true;
					}
				});
				document.getElementById("cart-show-new").style.display = 'block';
				document.getElementById("cart-list").style.display = 'block';
				document.getElementById("overlay").style.display = 'block';
				return true;
			}
			function closeCart() {
				var empty = $('#empty').val();
				document.getElementById("cart-list").style.display = 'none';
				document.getElementById("overlay").style.display = 'none';
				if (empty == 1) {
					redirect();
				}
				return true;
			}
			function redirect() {
				window.location.href = "${pageContext.request.contextPath}/";
			}
		</script>