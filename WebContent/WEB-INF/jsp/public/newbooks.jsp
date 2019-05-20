<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/" title="Trang chủ">Trang chủ</a></li>
			<li>Sách mới</li>
		</ul>
	</div>
</div>
<div id="container">
	<div class="sortable" id="layoutGroup1">
		<div class="block" id="module_listnewproducts">
			<h1>Sách mới</h1>
			<div class="pagesright">
				<div class="clear"></div>
			</div>
			<c:set value="/sach-moi" var="link"></c:set>
			<div class="blockcontent">
				<c:forEach items="${listBook }" var="objBook">
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
			<%@include file="/WEB-INF/jsp/public/pagenoordering2.jsp"%>
			<div class="clear"></div>
			<script type="text/javascript">
				function setOrder(ojb) {
					url = '${pageContext.request.contextPath}/sach-moi/page/${current_page}';
					order = ojb.value;
					url = addQuery(url, 'ordering=' + order);
					document.location.href = url;
				}
			</script>
		</div>
	</div>
</div>