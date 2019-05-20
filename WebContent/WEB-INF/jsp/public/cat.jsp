<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<c:set value="/danh-muc/${slugUtil.makeSlug(objCat.cname) }/${objCat.cid}" var="link" ></c:set>
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/"
				title="Trang chủ">Trang chủ</a></li>
			<c:if test="${objCatParent ne null }">
				<li><a
					href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCatParent.cname) }/${objCatParent.cid}"
					title="Trang chủ">${objCatParent.cname }</a></li>
			</c:if>
			<li>${objCat.cname }</li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div id="container">
	<div class="sortable" id="layoutGroup3">
		<div class="block" id="module_categories">
			<h2>Danh mục</h2>
			<div class="blockcontent">
				<ul>
					<c:forEach items="${listCategoriesData }" var="objCatChild">
						<li><a
							href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCatChild.cname) }/${objCatChild.cid}"
							target="_self">${objCatChild.cname }</a></li>
					</c:forEach>
				</ul>
				<div class="clear"></div>
			</div>
		</div>
		<%@include file="/WEB-INF/jsp/public/listleftbar.jsp"%>

	</div>
	<div class="sortable" id="layoutGroup4">
		<div class="block" id="module_listproducts">
			<h1>${objCat.cname }</h1>
			<div class="intro"></div>
			<div class="clear"></div>
			<div class="pagesright">
				<div class="sorts">
					Xem theo: &nbsp;&nbsp;&nbsp; <select onchange="setOrder(this);"
						id="order" name="item_order">
						<option <c:if test="${ordering eq null || ordering eq 1 }">selected = 'selected'</c:if> value="1">Mới trước cũ sau</option>
						<option <c:if test="${ordering eq 2 }">selected = 'selected'</c:if>  value="2">Cũ trước mới sau</option>
						<option <c:if test="${ordering eq 3 }">selected = 'selected'</c:if> value="3">Giá cao đến thấp</option>
						<option <c:if test="${ordering eq 4 }">selected = 'selected'</c:if> value="4">Giá thấp đến cao</option>
						<option <c:if test="${ordering eq 5 }">selected = 'selected'</c:if> value="5">Bán chạy</option>
						<option <c:if test="${ordering eq 6 }">selected = 'selected'</c:if> value="6">Ngày xuất bản</option>
					</select>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div class="blockcontent">
				<c:forEach items="${listBookOfCat }" var="objBook">
					<div class="product_contener">
						<div class="products">
							<div class="image">
								<a
									href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
									title="${objBook.book_name }"><img
									src="${pageContext.request.contextPath}/files/${objBook.picture}"
									alt="${objBook.book_name }" title="${objBook.book_name }" /></a> <span
									class="saleprice">-${objBook.sale }%</span>
							</div>
							<div class="productname">
								<a
									href="${pageContext.request.contextPath}/sach-truyen/${slugUtil.makeSlug(objBook.book_name)}-${objBook.bid}.html"
									title="${objBook.book_name }">${objBook.book_name }</a>
							</div>
							<div class="fields">
								<span><a
									href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
									title="${objBook.author_name }">${objBook.author_name }</a></span>
							</div>


							<div class="prices">
								<fmt:formatNumber type="number"
									value="${objBook.price * (100 - objBook.sale) /100}" />
								₫
							</div>
							<span class="rootprice">${objBook.price  } ₫</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="clear">&nbsp;</div>
			<%@include file="/WEB-INF/jsp/public/pagepublic.jsp"%>
			<div class="clear"></div>
			<script type="text/javascript">
				function setOrder(ojb) {
					order = ojb.value;
					url = '${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCat.cname)}/${objCat.cid}/page/${current_page}/ordering/'+ order;
					document.location.href = url;
				}
			</script>
			<div class="clear"></div>
		</div>
		<style>
.subfootbanner {
	position: relative;
	height: 100px;
}

.subfootbanner div {
	text-align: center
}
</style>
		<div class="subfootbanner">
			<div class="img">
				<a href="../../banners/view/97/emme-tui-xach-xuat-khau.html"
					target="_blank"><img height="100"
					src="${pageContext.request.contextPath}/templates/public/nobita.vn/stores/banners/banner-2.jpg"
					title="Emme Tui Xach Xuat Khau"></a>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				var n = $('.subfootbanner div.img').length;
				if (n > 1) {
					$('.subfootbanner div.img:gt(0)').hide();
					setInterval(function() {
						$('.subfootbanner div.img:first-child').fadeOut().next(
								'div.img').fadeIn().end().appendTo(
								'.subfootbanner');
					}, 3000);
				}
			});
		</script>
	</div>
</div>
<div class="clear"></div>