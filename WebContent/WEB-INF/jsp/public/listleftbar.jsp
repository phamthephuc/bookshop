<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="block" id="module_listfields">
	<div class="fields_contener">
		<h2>Tác giả</h2>
		<div class="blockcontent">
			<div class="showboxfield">
				<ul>
					<c:forEach items="${listAuthors }" var="objAuthor">
						<a
							href="${pageContext.request.contextPath}/tac-gia/${slugUtil.makeSlug(objAuthor.name)}/${objAuthor.aid}"
							title="${objAuthor.name }">
							<li class="checkbox"><i class="fa fa-square-o"></i>${objAuthor.name }<span
								class="count"></span> <span class="delete"></span></li>
						</a>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="fields_contener">
		<h2>Thương hiệu</h2>
		<div class="blockcontent">
			<div class="showboxfield">
				<ul>
					<c:forEach items="${listPublishers }" var="objPublisher">
						<a href="${pageContext.request.contextPath}/nha-phat-hanh/${slugUtil.makeSlug(objPublisher.name)}/${objPublisher.pid}" title="${objPublisher.name }">
							<li class="checkbox"><i class="fa fa-square-o"></i>${objPublisher.name }<span class="count"></span> <span class="delete"></span></li>
						</a>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>