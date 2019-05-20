<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/" title="Trang chủ">Trang chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCatParent.cname)}/${objCatParent.cid}"
				title="${objCatParent.cname}">${objCatParent.cname}</a></li>
			<li><a
				href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objBook.category_name) }/${objBook.category_id}"
				title="${objBook.category_name }">${objBook.category_name }</a></li>
			<li>${objBook.book_name }</li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div id="container">
	<div class="sortable" id="layoutGroup1">
		<div class="product_view_contener">
			<div class="showleft">
				<div class="product_info">
					<h1>${objBook.book_name }</h1>
					<div class="groups">
						<div class="viewfields">
							<span>Tác giả: <a
								href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
								title="${objBook.author_name }">${objBook.author_name }</a></span> <span>Phát
								hành: <a
								href="${pageContext.request.contextPath}/nha-phat-hanh/${slugUtil.makeSlug(objBook.publisher_name)}/${objBook.publisher_id}"
								title="${objBook.publisher_name }">${objBook.publisher_name }</a>
							</span>
						</div>
						<div class="booktype_contener">
							<div class="booktype_left">Hình thức:</div>
							<div class="booktype  first">
								<a href="" title="Bìa Mềm">Bìa Mềm</a>
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>

					<div class="prices_contener">
						<div class="prices">
							<div class="saleprice">
								<span id="saleprice"><fmt:formatNumber type="number"
										value="${objBook.price - objBook.sale * objBook.price / 100}" /> ₫</span>
							</div>
							<div class="vrootprice" id="rootprice">
								Giá bìa: <span><fmt:formatNumber type="number"
										value="${objBook.price}" /> ₫</span>
							</div>
							<div class="yousave" id="yousave">
								Tiết kiệm: <span><fmt:formatNumber type="number"
										value="${objBook.sale * objBook.price / 100}" /> ₫ </span>
							</div>
						</div>
						<div class="goshop">
							<a href="javascript:void(0)" onclick="return addCart();">Mua
								ngay</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>


					<div class="clear"></div>
					<div class="intro">
						<div class="block " id="content_ViewProducts">
							<div class="blockcontent">
								<p>
									<i class="fa fa-check"></i><span style="font-size: 14px;">Bọc
										Plastic miễn ph&iacute;&nbsp;</span>
								</p>
								<p>
									<i class="fa fa-check"></i><span style="font-size: 14px;">Giao
										h&agrave;ng miễn ph&iacute; trong nội th&agrave;nh TP. HCM với
										đơn h&agrave;ng&nbsp; <span style="color: #33cc33;"><strong>&ge;
												150.000 đ</strong></span>
									</span>
								</p>
								<p>
									<i class="fa fa-check"></i><span style="font-size: 14px;">Giao
										h&agrave;ng miễn ph&iacute; to&agrave;n quốc với đơn
										h&agrave;ng <span style="color: #33cc33;"><strong>&ge;
												250.000 đ</strong></span>
									</span>
								</p>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					
				</div>
			</div>
			<div class="image_contenner">
				<div class="mainimage">
					<img
						src="${pageContext.request.contextPath}/files/${objBook.picture}"
						alt="${objBook.book_name }" id="mainimage" width="250" />

				</div>
				<div class="subthums" id="gallery_01"></div>
			</div>
			<div class="clear"></div>
			<input type="hidden" name="formatid" id="formatid" value="" /> <input
				type="hidden" name="sizeid" id="sizeid" value="" /> <input
				type="hidden" name="colorid" id="colorid" value="" />
		</div>

		<div class="block" id="module_ProductDetail">
			<h3>Giới thiệu sách</h3>
			<div class="intro" id="contentid">
				<p style="text-align: justify;">
					<span style="color: #ff0000;"><span style="font-size: 16px;"><strong>${objBook.book_name }</strong></span></span>
				</p>
				<p style="text-align: justify;">${objBook.preview }</p>


			</div>
			<div class="viewmore" id="viewmore">
				<span>Xem thêm nội dung <i class="fa fa-sort-desc"></i></span>
			</div>
		</div>
		<script>
			var contentid = $('#contentid');
			var hieght = contentid.height();
			$('#viewmore').hide();
			if (hieght > 400) {
				contentid.addClass('collapse');
				$('#viewmore').show();
			}

			$('.viewmore')
					.click(
							function() {
								if (contentid.hasClass('collapse')) {
									contentid.removeClass('collapse');
									$('#viewmore span').empty();
									$('#viewmore span')
											.append(
													'Thu gọn <i class="fa fa-sort-asc"></i>');
								} else {
									contentid.addClass('collapse');
									$('#viewmore span').empty();
									$('#viewmore span')
											.append(
													'Xem thêm nội dung <i class="fa fa-sort-desc"></i>');
								}
							});
		</script>
		<div class="block" id="module_ProductFieds">
			<a name="fieldlist"></a>
			<h3>Thông tin chi tiết</h3>
			<table class="fields" cellpadding="0" cellspacing="0" width="100%">
				<tr class="field_view_contenner row0">
					<td class="title">Tác giả</td>
					<td class="values"><a
						href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
						title="${objBook.author_name }">${objBook.author_name }</a></td>
				</tr>
				<tr class="field_view_contenner row1">
					<td class="title">Phát hành</td>
					<td class="values"><a
						href="${pageContext.request.contextPath}/nha-phat-hanh/${slugUtil.makeSlug(objBook.publisher_name)}/${objBook.publisher_id}"
						title="${objBook.publisher_name }">${objBook.publisher_name }</a></td>
				</tr>
				<tr class="field_view_contenner row1">
					<td class="title">Số trang</td>
					<td class="values">${objBook.pages }</td>
				</tr>
				<tr class="field_view_contenner row1">
					<td class="title">Ngày phát hành</td>
					<td class="values"><fmt:formatDate pattern="dd/MM/yyyy"
							value="${objBook.realease_date }" var="date" />${date }</td>
				</tr>
				<tr class="field_view_contenner row0">
					<td class="title">Danh mục</td>
					<td class="values"><a
						href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objBook.category_name) }/${objBook.category_id}"
						title="Tiểu thuyết tình cảm - Lãng mạn">${objBook.category_name }</a></td>
				</tr>
			</table>
			<div class="goshop cfields">
				<a href="javascript:" onclick="addCart();">Mua ngay</a>
			</div>
			<!-- <script type="text/javascript">
			function ajaxtest() {
				address = '${pageContext.request.contextPath}/testajax';
				$
						.ajax({
							url : address,
							dataType : "json",
							type : "GET",
							cache : false,
							error : function(e) {
								Boxy.alert('Lỗi ajax', null, {
									title : 'Thông báo'
								});
								return;
							},
							success : function(data) {
								$('#test').append(data.bid);
							}
						});
			}
			</script> -->
		</div>
		<c:if test="${listBookSameAuthor.size() >0 }">
			<div class="block" id="module_sameAuthor">
				<h3>Sách cùng tác giả</h3>
				<div class="blockcontent">
					<c:forEach items="${listBookSameAuthor }" var="objBook">
						<div class="product_contener">
							<div class="products">
								<div class="image">
									<a
										href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
										title="${objBook.book_name }"><img
										src="${pageContext.request.contextPath}/files/${objBook.picture}"
										alt="${objBook.book_name }" title="${objBook.book_name }" /></a>
									<span class="saleprice">-${objBook.sale }%</span>
								</div>
								<div class="productname">
									<a
										href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
										title="${objBook.book_name }">${objBook.book_name }</a>
								</div>
								<div class="fields">
									<span><a
										href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
										title="${objBook.author_name }">${objBook.author_name }</a></span>
								</div>


								<div class="prices">
									<fmt:formatNumber type="number" value="${objBook.price - objBook.price * objBook.sale / 100}" />
									₫
								</div>
								<span class="rootprice">${objBook.price  } ₫</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		<c:if test="${listBookSameCat.size() >0 }">
			<div class="block" id="module_sameAuthor">
				<h3>Sách cùng danh mục</h3>
				<div class="blockcontent">
					<c:forEach items="${listBookSameCat }" var="objBook">
						<div class="product_contener">
							<div class="products">
								<div class="image">
									<a
										href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
										title="${objBook.book_name }"><img
										src="${pageContext.request.contextPath}/files/${objBook.picture}"
										alt="${objBook.book_name }" title="${objBook.book_name }" /></a>
									<span class="saleprice">-${objBook.sale }%</span>
								</div>
								<div class="productname">
									<a
										href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
										title="${objBook.book_name }">${objBook.book_name }</a>
								</div>
								<div class="fields">
									<span><a
										href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
										title="${objBook.author_name }">${objBook.author_name }</a></span>
								</div>


								<div class="prices">
									<fmt:formatNumber type="number" value="${objBook.price - objBook.price * objBook.sale / 100}" />
									₫
								</div>
								<span class="rootprice">${objBook.price  } ₫</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		<div class="block" id="module_Comments">
			
			<script type="text/javascript">
				function rate(rid) {
					var w = rid * 30;
					gde('rate').style.width = w + 'px';
					gde('comrating').value = rid;
				}

				function check_comment_form() {
					var comrating = gde("comrating");
					var title = gde("title");
					var commenttext = gde("commenttext");

					if (comrating.value == 0) {
						Boxy.alert('Vui lòng cho đánh giá sản phẩm', null, {
							title : 'Thông báo'
						});
						return false;
					}

					if (title.value == "") {
						Boxy.alert('Vui lòng nhập tiêu đề', null, {
							title : 'Thông báo'
						});
						return false;
					}

					if (commenttext.value.length < 100) {
						Boxy
								.alert(
										'Nội dung nhận xét tối thiểu là 100 từ, tối đa là 2000 từ',
										null, {
											title : 'Thông báo'
										});
						return false;
					}
				}

				function postreply(commentid) {
					var textarea = gde("textarea" + commentid);

					if (textarea.value == "") {
						return false;
					}

					var formdata = $("#frcm" + commentid).serialize();
					address = '/products/postreply/index.html';
					$.ajax({
						type : "POST",
						dataType : "html",
						url : address,
						data : formdata,
						cache : false,
						error : function(e) {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Thông báo'
							});
						},
						success : function(data) {
							if (data != '') {
								$("#commentryply" + commentid).prepend(data);
								textarea.value = "";
							} else {
								Boxy.alert('Lỗi ajax', null, {
									title : 'Thông báo'
								});
							}
						}
					});
				}

				function getmorereply(commentid, from) {
					address = addQuery('/products/morereply/index.html',
							'parentid=' + commentid);
					address = addQuery(address, 'from=' + from);
					$.ajax({
						type : "GET",
						dataType : "html",
						url : address,
						cache : false,
						error : function(e) {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Thông báo'
							});
						},
						success : function(data) {
							if (data != '') {
								$("#getreply" + commentid).remove();
								$("#commentryply" + commentid).append(data);
							}
						}
					});
				}

				function helpful(url, commentid, type) {
					$.ajax({
						type : "GET",
						dataType : "html",
						url : url,
						cache : false,
						error : function(e) {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Thông báo'
							});
						},
						success : function(data) {
							if (data != '') {
								if (type == 1) {
									$("#helpfulyes" + commentid).empty();
									$("#helpfulyes" + commentid).append(data);
								} else {
									$("#helpfulno" + commentid).empty();
									$("#helpfulno" + commentid).append(data);
								}
							}
						}
					});
				}

				function morecom(from) {
					address = addQuery('/products/comments/2296/index.html',
							'from=' + from);
					$.ajax({
						type : "GET",
						dataType : "html",
						url : address,
						cache : false,
						error : function(e) {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Thông báo'
							});
						},
						success : function(data) {
							if (data != '') {
								$("#morecom").remove();
								$("#comment_contener").append(data);
							}
						}
					});
				}

				function ShowTab(T) {
					i = 0;
					while (gde("tab" + i) != null) {
						gde("div" + i).style.display = "none";
						gde("tab" + i).className = "";
						i++;
					}

					gde("div" + T).style.display = "";
					gde("tab" + T).className = "active";

				}

				$(document).ready(function() {
					$('.elastic').elastic();
					ShowTab(1);
				});
			</script>
		</div>
	</div>
</div>
<div class="clear"></div>

<!-- <table cellspacing="0" cellpadding="0" border="0"
	class="boxy-wrapper fixed" id="cart-list"
	style="z-index: 1339; visibility: visible; left: 50%; top: 50%; opacity: 1; display: none;">
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
					<a href="javascript:void(0)" onclick="return closeCart()"
						class="close">close X</a>
				</div>
				<div id="cart_container" class="cart_container boxy-content"
					style="display: block;">
					<div class="block" id="module_productscart">
						<div id="showempty"></div>



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
<span id="overlay" class="overlay" style="display: none;"></span> -->

