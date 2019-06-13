<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div id="mainbanner">
		<div class="mainbaner">
			<link rel="stylesheet"
				href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/jquery.bxslider.css"
				type="text/css" />
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/js/jquery.bxslider.js"></script>
			<div id="slider-wrapper">
				<ul class="bxslider">
					<c:forEach items="${listSlides }" var="objSlide">
						<%-- <c:set var="objBook" value="${bookDao.getItem(objSlide.book_id) }"></c:set> --%>
						<li><a
							href="#"
							target="_self"><img height="397"
								src="${pageContext.request.contextPath}/files/${objSlide.picture}"></a></li>
					</c:forEach>
				</ul>
			</div>
			<script type="text/javascript">
				$(window).load(function() {
					$('.bxslider').bxSlider({
						auto : true,
						infiniteLoop : true
					});
				});
			</script>
		</div>
	</div>
	<div class="sortable" id="layoutGroup1">
		<div class="block" id="module_newproducts">
			<h2>
				<a class="title" href="${pageContext.request.contextPath}/sach-moi" title="Sách mới">Sách mới<span
					class="b-main__category-arrow"></span></a> <a class="more"
					href="${pageContext.request.contextPath}/sach-moi" title="Xem tất cả">Xem tất cả</a>
			</h2>
			<div class="blockcontent">
				<div
					style="position: relative; padding: 0 20px; overflow: hidden; height: 340px;">
					<div id="ajaxncontainer">
					<% int index = 0;
						String id = "";
					%>
						<c:forEach items="${listBookNewest }"
							var="objBook">
							<% index = index + 1; 
								id = "new" + index;
							%>
							<div class="product_contener" id=<%=id %>>
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
										<span><a href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
											title="${objBook.author_name }">${objBook.author_name }</a></span>
									</div>


									<div class="prices">
										<fmt:formatNumber type="number" value="${objBook.price * (100 - objBook.sale) /100}" />
										₫
									</div>
									<span class="rootprice">${objBook.price  } ₫</span>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="clear"></div>
					<div class="list_btn">
						<a onclick="showproduct(-1);" id="prevn" class="prev"
							href="javascript:"><i class="fa fa-chevron-left"></i></a> <a
							onclick="showproduct(1);" id="nextn" class="next"
							href="javascript:"><i class="fa fa-chevron-right"></i></a>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<script>
				var pagen = 1;
				var numn = $("#ajaxncontainer").children(".product_contener").length;
				var countn = Math.ceil(numn / 5.0);
				$("#prevn").addClass("hidein");
				if (countn <= 1)
					$("#nextn").addClass("ndisable");
				function showproduct(step) {
					if ((pagen == 1 && step == -1)
							|| (pagen == countn && step == 1))
						return;

					pagen = pagen + step;
					if (pagen < 1) {
						pagen = 1;
					}

					if (pagen == 1) {
						$("#prevn").addClass("hidein");
					} else {
						$("#prevn").removeClass("hidein");
					}

					if (pagen == countn || pagen > countn) {
						$("#nextn").addClass("hidein");
					} else {
						$("#nextn").removeClass("hidein");
					}
					
					if(step == 1) {
						var tmp = pagen - 1;
						var max = (tmp * 5 > numn) ? numn : (tmp * 5);
						for (var i = (tmp - 1) * 5 + 1; i <= max; i++) {
							var id = "#new" + i;
							$(id).addClass('hidein');
							/* $(id).delay(100 * i).fadeIn(100); */
							
						}
					} else {
						var max = (pagen * 5 > numn) ? numn : (pagen * 5);
						for (var i = (pagen - 1) * 5 + 1; i <= max; i++) {
							var id = "#new" + i;
							$(id).removeClass('hidein');
							/* $(id).delay(100 * i).fadeIn(100); */
							
						}
					}

					/* address = '${pageContext.request.contextPath}/show-slide-newest';
					address = addQuery(address, 'page=' + pagen);
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
							$("#ajaxncontainer").empty();
							$("#ajaxncontainer").append(data);
							i = 0;
							if (step == 1) {
								$(".hide").each(function(index) {
									$(this).delay(100 * i).fadeIn(100);
									i++;
								});
							} else {
								$($(".hide").get().reverse()).each(
										function(index) {
											$(this).delay(100 * i).fadeIn(100);
											i++;
										});
							}
							return true;
						}
					}); */
				}
			</script>
		</div>

		<%-- <div class="block" id="module_publishing">
			<h2>
				<a class="title" href="${pageContext.request.contextPath}/sach-sap-phat-hanh"
					title="Sắp phát hành">Sắp phát hành<span
					class="b-main__category-arrow"></span></a><a class="more"
					href="${pageContext.request.contextPath}/sach-sap-phat-hanh" title="Xem tất cả">Xem tất cả</a>
			</h2>
			<div class="blockcontent">
				<% index = 0; %>
				<div
					style="position: relative; padding: 0 20px; overflow: hidden; height: 340px">
					<div id="ajaxcontainer">
						<c:forEach items="${listBookComingSoon }"
							var="objBook">
							<%
								index++;
								id = "publisher" + index;
							%>
							<div class="product_contener" id=<%=id %>>
								<div class="products">
									<div class="image">
										<a
											href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
											title="${objBook.book_name }"><img
											src="${pageContext.request.contextPath}/files/${objBook.picture}"
											alt="${objBook.book_name }" title="${objBook.book_name }" /></a>
										<span class="saleprice">-${objBook.sale } %</span>
									</div>
									<div class="productname">
										<a
											href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
											title="${objBook.book_name }">${objBook.book_name }</a>
									</div>
									<div class="fields">
										<span><a href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
											title="${objBook.author_name }">${objBook.author_name }</a></span>
									</div>


									<div class="prices">
										<fmt:formatNumber type="number" value="${objBook.price * (100 - objBook.sale) /100}" />
										₫
									</div>
									<span class="rootprice">${objBook.price  } ₫</span>
								</div>
							</div>
						</c:forEach>
					
				</div>
				<div class="clear"></div>
				<div class="list_btn">
					<a onclick="publishing(-1);" id="pprev" class="prev"
						href="javascript:"><i class="fa fa-chevron-left"></i></a> <a
						onclick="publishing(1);" id="pnext" class="next"
						href="javascript:"><i class="fa fa-chevron-right"></i></a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<script>
			var page = 1;
			var num = $("#ajaxcontainer").children(".product_contener").length;
			var count = Math.ceil(num / 5.0);
			$("#pprev").addClass("hidein");
			if (count <= 1)
				$("#pnext").addClass("hidein");
			function publishing(step) {
				if ((page == 1 && step == -1)
						|| (page == count && step == 1))
					return;

				page = page + step;
				if (page < 1) {
					page = 1;
				}

				if (page == 1) {
					$("#pprev").addClass("hidein");
				} else {
					$("#pprev").removeClass("hidein");
				}

				if (page == count || page > count) {
					$("#pnext").addClass("hidein");
				} else {
					$("#pnext").removeClass("hidein");
				}
				
				if(step == 1) {
					var tmp = page - 1;
					var max = (tmp * 5 > num) ? num : (tmp * 5);
					for (var i = (tmp - 1) * 5 + 1; i <= max; i++) {
						var id = "#publisher" + i;
						$(id).addClass('hidein');
						/* $(id).delay(100 * i).fadeIn(100); */
						
					}
				} else {
					var max = (page * 5 > num) ? num : (page * 5);
					for (var i = (page - 1) * 5 + 1; i <= max; i++) {
						var id = "#publisher" + i;
						$(id).removeClass('hidein');
						/* $(id).delay(100 * i).fadeIn(100); */
						
					}
				}

				
			}
		</script>
	</div> --%>
	<div class="block" id="module_bestseller">
		<h2>
			<a class="title" href="${pageContext.request.contextPath}/sach-ban-chay" title="Sách bán chạy">Sách
				bán chạy<span class="b-main__category-arrow"></span>
			</a> <a class="more" href="${pageContext.request.contextPath}/sach-ban-chay" title="Xem tất cả">Xem
				tất cả</a>
		</h2>
		<div class="blockcontent">
			<div
				style="position: relative; padding: 0 20px; overflow: hidden; height: 340px">
				<% index = 0; %>
				<div id="bajaxcontainer">
					<c:forEach items="${listBookBestSale }"
							var="objBook">
							<%
								index++;
								id = "bestsale" + index;
							%>
							<div class="product_contener" id=<%=id %>>
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
											href="${pageContext.request.contextPath}/sach-truyen/${slugUtil.makeSlug(objBook.book_name)}-${objBook.bid}.html"
											title="${objBook.book_name }">${objBook.book_name }</a>
									</div>
									<div class="fields">
										<span><a href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
											title="${objBook.author_name }">${objBook.author_name }</a></span>
									</div>


									<div class="prices">
										<fmt:formatNumber type="number" value="${objBook.price * (100 - objBook.sale) /100}" />
										₫
									</div>
									<span class="rootprice"><fmt:formatNumber type="number" value="${objBook.price}" /> ₫</span>
								</div>
							</div>
						</c:forEach>
					
				</div>
				<div class="clear"></div>
				<div class="list_btn">
					<a onclick="bestproduct(-1);" class="prev" id="bprev"
						href="javascript:"><i class="fa fa-chevron-left"></i></a> <a
						onclick="bestproduct(1);" class="next" id="bnext"
						href="javascript:"><i class="fa fa-chevron-right"></i></a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<script>
			var pageb = 1;
			var numb = $("#bajaxcontainer").children(".product_contener").length;
			var countb = Math.ceil(numb / 5.0);
			$("#bprev").addClass("hidein");
			if (countb <= 1)
				$("#bnext").addClass("hidein");
			function bestproduct(step) {
				if ((pageb == 1 && step == -1)
						|| (pageb == countb && step == 1))
					return;

				pageb = pageb + step;
				if (pageb < 1) {
					pageb = 1;
				}

				if (pageb == 1) {
					$("#bprev").addClass("hidein");
				} else {
					$("#bprev").removeClass("hidein");
				}

				if (pageb == countb || pageb > countb) {
					$("#bnext").addClass("hidein");
				} else {
					$("#bnext").removeClass("hidein");
				}
				if(step == 1) {
					var tmp = pageb - 1;
					var max = (tmp * 5 > numb) ? numb : (tmp * 5);
					for (var i = (tmp - 1) * 5 + 1; i <= max; i++) {
						var id = "#bestsale" + i;
						$(id).addClass('hidein');
						/* $(id).delay(100 * i).fadeIn(100); */
						
					}
				} else {
					var max = (pageb * 5 > num) ? num : (pageb * 5);
					for (var i = (pageb - 1) * 5 + 1; i <= max; i++) {
						var id = "#bestsale" + i;
						$(id).removeClass('hidein');
						/* $(id).delay(100 * i).fadeIn(100); */
						
					}
				}

			}
		</script>
	</div>
	<div class="block" id="module_topcategories">
		<h2>
			<a class="title" href="javascript:void(0)"
				title="Danh mục">Danh mục<span class="b-main__category-arrow"></span></a>
		</h2>
		<div class="blockcontent">
			<div
				style="position: relative; padding: 0; overflow: hidden; margin-left: -4%">
				<c:forEach items="${hashBookCatParents.keySet() }" var="objCat">
				<c:set var="objBook" value="${hashBookCatParents.get(objCat) }"></c:set>
				<div class="category_contener">
					<div class="categories">
						<div class="image">
							<a href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCat.cname) }/${objCat.cid}" title=""><img
								src="${pageContext.request.contextPath}/files/${objBook.picture}"
								alt="" title="" /></a>
						</div>
						<div class="catname">
							<a href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCat.cname) }/${objCat.cid}" title="">${objCat.cname }</a>
						</div>
					</div>
				</div>
				</c:forEach>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="block " id="content_seohome">
		<div class="blockcontent">
			<h1>
				<span style="font-size: 16px;"><span
					style="font-family: arial, helvetica, sans-serif;">Mua
						S&aacute;ch Online Tại Green Books</span></span>
			</h1>
			<p>
				<span style="font-family: arial, helvetica, sans-serif;"><span
					style="font-size: 12px;">Ra đời từ năm 2015, đến nay <strong>Green Books</strong>
						đ&atilde; trở th&agrave;nh địa chỉ <a href="#"><strong>mua
								s&aacute;ch online</strong></a> quen thuộc của h&agrave;ng ng&agrave;n độc
						giả tr&ecirc;n cả nước. Với đầu s&aacute;ch phong ph&uacute;,
						thuộc c&aacute;c thể loại: <c:forEach items="${alCatParent }" var="objCat">
						<strong><a
							href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCat.name_cat) }/${objCat.id}">${objCat.name_cat }</a>,</a></strong></c:forEach>... được cập nhật li&ecirc;n tục từ
						c&aacute;c nh&agrave; xuất bản uy t&iacute;n trong nước.&nbsp;
				</span></span>
			</p>
			<p>
				<span style="font-family: arial, helvetica, sans-serif;"><span
					style="font-size: 12px;">Khi mua s&aacute;ch online tại
						GreenBook.vn, Qu&yacute; kh&aacute;ch được <strong>Bọc
							plastic miễn ph&iacute; đến 99%</strong> (trừ s&aacute;ch b&igrave;a cứng,
						s&aacute;ch dạng hộp - dạng đặc biệt, s&aacute;ch khổ qu&aacute;
						to, ...)
				</span></span>
			</p>
			<p>
				<span style="font-family: arial, helvetica, sans-serif;"><span
					style="font-size: 12px;">Ngo&agrave;i ra, với h&igrave;nh
						thức <strong>Giao h&agrave;ng thu tiền tận nơi</strong> v&agrave;
						<strong>Đổi h&agrave;ng trong v&ograve;ng 7 ng&agrave;y</strong>
						nếu s&aacute;ch c&oacute; bất kỳ lỗi n&agrave;o trong qu&aacute;
						tr&igrave;nh in ấn sẽ gi&uacute;p Qu&yacute; kh&aacute;ch
						y&ecirc;n t&acirc;m hơn khi mua sắm tại Green Books
				</span></span>
			</p>
			<div>&nbsp;</div>
			<p style="text-align: center;">&nbsp;</p>
		</div>
	</div>
</div>
</div>
<div class="clear"></div>