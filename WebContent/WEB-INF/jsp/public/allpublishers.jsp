<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="http://nobita.vn" title="Trang chủ">Trang chủ</a></li>
			<li>Phát hành</li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div id="container">
	<div class="sortable" id="layoutGroup1">
		<div class="block" id="module_groupfield">
			<h1>Phát hành</h1>
			<div class="pagesright">
				
				<div class="clear"></div>
			</div>
			<div class="blockcontent">
				<c:forEach items="${alPublisher }" var="objPublisher">
				
					<div class="group_container">
						<div class="image">
							<a href="${pageContext.request.contextPath}/nha-phat-hanh/${slugUtil.makeSlug(objPublisher.name_publisher) }/${objPublisher.id}" title="${objPublisher.name_publisher }"> <img
								src="${pageContext.request.contextPath}/files/${objPublisher.image}" alt="${objPublisher.name_publisher }"
								title="${objPublisher.name_publisher }"></a>
						</div>
						<div class="title">
							<a href="${pageContext.request.contextPath}/nha-phat-hanh/${slugUtil.makeSlug(objPublisher.name_publisher) }/${objPublisher.id}" title="${objPublisher.name_publisher }">${objPublisher.name_publisher }
							(${bookDao.countBookOfPublisher(objPublisher.id)})</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="clear">&nbsp;</div>

			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>
</div>