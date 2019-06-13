<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/" title="Trang chủ">Trang chủ</a></li>
			<li>Sách bán chạy</li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div id="container">
	<div class="sortable" id="layoutGroup3">
		<div class="block" id="module_bestcategories">
			<h2>Danh mục bán chạy</h2>
			<div class="blockcontent">
				<ul>
					<c:forEach items="${listCatParent}" var="objCatParent">
									<li><a
										href="${pageContext.request.contextPath}/danh-muc/${slugUtil.makeSlug(objCatParent.cname) }/${objCatParent.cid}"
										class="havechild" target="_self">${objCatParent.cname }</a>
										</li>
								</c:forEach>
				</ul>
				<div class="clear"></div>
				<div
					style="border-top: 1px solid #ccc; padding: 5px 0; margin-top: 5px; display: none;">
					<i class="fa fa-angle-right"></i> <a href="" title="Sách bán chạy"><strong>Xem
							tất cả</strong></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>

	</div>
	<div class="sortable" id="layoutGroup4">
		<div class="block" id="module_listbestseller">
			<h1>Top ${numAll} sách bán chạy</h1>
			<div class="tools">
				<div class="pages-bestseller">
					<ul class="pagetop">
						<c:forEach begin="1" end="${numGroup }" var="index">
							<c:if test="${index == numGroup}">
								<c:set var="endOfGroup" value="-${numAll }"></c:set>
								<c:if test="${numAll == (maxBookInGroup * (index - 1) + 1 )}">
									<c:set var="endOfGroup" value=""></c:set>
								</c:if>
							</c:if>
							<c:if test="${index != numGroup}">
								<c:set var="endOfGroup" value="-${maxBookInGroup * index}"></c:set>
							</c:if>
							<c:if test="${index == group }">
								<li class="active"><span>${maxBookInGroup * (index - 1) + 1 }${endOfGroup}</span></li>
							</c:if>
							<c:if test="${index != group }">
								<li><a href="${pageContext.request.contextPath}/sach-ban-chay/group/${index}">${maxBookInGroup * (index - 1) + 1 }${endOfGroup}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div class="blockcontent">
				<c:set value="${maxBookInGroup * (group - 1) + 1}" var="firstOfGroup"></c:set>
				<c:forEach items="${listBook }" var="objBook">
					<div class="product_top_contener">
						<div class="showleft">
							<div class="productinfo">
								<div class="productname">
									<a
										href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
										title="${objBook.book_name }">${objBook.book_name }</a>
								</div>

								<div class="fields">
									<span><a href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objBook.author_name)}/${objBook.author_id}"
										title="${objBook.author_name }">${objBook.author_name }</a></span>
								</div>
								<div class="productprice">
									<span class="prices"><fmt:formatNumber
												type="number" value="${objBook.price - objBook.price * objBook.sale / 100}" /> ₫
									</span>&nbsp;&nbsp;&nbsp; 
									<span class="rootprice"><fmt:formatNumber type="number" value="${objBook.price}" /> ₫</span>
								</div>
								<div class="intro">${stringUtil.subString(objBook.preview) }
								</div>
								
							</div>
						</div>
						<div class="image">
							<c:choose>
								<c:when test="${firstOfGroup <= 3}">
									<div class="number">${firstOfGroup}</div>
								</c:when>
								<c:otherwise><div class="number2">${firstOfGroup}</div></c:otherwise>
							</c:choose>
							
							<c:set value="${firstOfGroup + 1}" var="firstOfGroup"></c:set>
							<a href="${pageContext.request.contextPath}/sach-truyen/${objBook.bid}/${slugUtil.makeSlug(objBook.book_name)}.html"
								title="${objBook.book_name}"><img width="120"
								height="168"
								src="${pageContext.request.contextPath}/files/${objBook.picture}"
								alt="${objBook.book_name}" title="${objBook.book_name}"></a> <span
								class="saleprice">-${objBook.sale}%</span>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>

			</div>
			<div class="clear">&nbsp;</div>
			<div class="tools">
				<div class="pages-bestseller">
					<ul class="pagetop">
						<c:forEach begin="1" end="${numGroup }" var="index">
							<c:if test="${index == numGroup}">
								<c:set var="endOfGroup" value="-${numAll }"></c:set>
								<c:if test="${numAll == (maxBookInGroup * (index - 1) + 1 )}">
									<c:set var="endOfGroup" value=""></c:set>
								</c:if>
							</c:if>
							<c:if test="${index != numGroup}">
								<c:set var="endOfGroup" value="-${maxBookInGroup * index}"></c:set>
							</c:if>
							<c:if test="${index == group }">
								<li class="active"><span>${maxBookInGroup * (index - 1) + 1 }${endOfGroup}</span></li>
							</c:if>
							<c:if test="${index != group }">
								<li><a href="${pageContext.request.contextPath}/sach-ban-chay/group/${index}">${maxBookInGroup * (index - 1) + 1 }${endOfGroup}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<script>
			$(function() {
				$('.betlink').boxy({
					ovlay : true,
					unloadOnHide : true
				});
			});
		</script>
	</div>
</div>