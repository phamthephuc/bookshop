<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}" title="Trang chủ">Trang chủ</a></li>
			<li>Phát hành: ${objPublisher.name }</li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div id="container">
	<c:set value="/tac-gia/${slugUtil.makeSlug(objPublisher.name)}/${objPublisher.pid}" var="link"></c:set>
	<div class="sortable" id="layoutGroup3">

		<%@include file="/WEB-INF/jsp/public/listleftbar.jsp"%>

	</div>
	<div class="sortable" id="layoutGroup4">
		<div class="block" id="module_listfieldproducts">
			<h1>Phát hành:  ${objPublisher.name }</h1>
			<div class="intro" style="display: none">
				<img src="/stores/uploads/r/thai-ha__24637.jpg"
					style="float: left; margin-right: 10px; width: 100px">

				<div class="clear"></div>
			</div>
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
			<div class="blockcontent">
				<c:forEach items="${listBook }" var="objBook">
					<div class="product_contener">
						<div class="products">
							<div class="image">
								<a href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
									title="${objBook.book_name }"><img
									src="${pageContext.request.contextPath}/files/${objBook.picture}"
									alt="${objBook.book_name }" title="${objBook.book_name }" /></a> <span
									class="saleprice">-${objBook.sale }%</span>
							</div>
							<div class="productname">
								<a href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
									title="${objBook.book_name }">${objBook.book_name }</a>
							</div>
							<div class="fields">
								<span><a href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
									title="${objBook.author_name }">${objBook.author_name }</a></span>
							</div>


							<div class="prices"> <fmt:formatNumber type="number" value="${objBook.price - objBook.sale * objBook.price / 100}" /> ₫</div>
							<span class="rootprice">${objBook.price  } ₫</span>
						</div>
					</div>
				</c:forEach>
				
			<div class="clear"></div>
			<%@include file="/WEB-INF/jsp/public/pagenoordering.jsp"%>
			<div class="clear"></div>
			<div class="intro" style="display: none">
				<img src="/stores/uploads/r/thai-ha__24637.jpg"
					style="float: left; margin-right: 10px; width: 100px">

				<div class="clear"></div>
			</div>
			<script type="text/javascript">
				function setOrder(ojb) {
					order = ojb.value;
					url = '${pageContext.request.contextPath}/nha-phat-hanh/${slugUtil.makeSlug(objPublisher.name)}/${objPublisher.pid}/page/${current_page}/ordering/'+ order;
					document.location.href = url;
				}
			</script>
		</div>
	</div>
	<div class="clear"></div>
</div>