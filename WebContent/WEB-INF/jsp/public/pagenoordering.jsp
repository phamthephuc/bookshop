<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Pagination -->
<%
	int current_page = (Integer) request.getAttribute("current_page");
	int sumPages = (Integer) request.getAttribute("sumPages");
	String previousPage = "", nextPage = "", prelink = "", nextlink = "";
	if (current_page == 1) {
		previousPage = "class='disabled'";
		nextlink = "/page/" + (current_page + 1);
	} else if (current_page == sumPages) {
		nextPage = "class='disabled'";
		prelink = "/page/" + (current_page - 1);

	} else {
		prelink = "/page/" + (current_page - 1);
		nextlink = "/page/" + (current_page + 1);
	}

	if (sumPages > 1) {
%>

<ul class="pagenav">
	<%
		if (current_page != 1) {
	%>
	<li><a href="${pageContext.request.contextPath }${link}/page/1/ordering/${ordering }">First</a></li>
	<li <%=previousPage%>><a
		href="${pageContext.request.contextPath }${link}<%=prelink%>/ordering/${ordering }"
		rel="previous">«</a></li>
	<%
		}
			if (sumPages == 2) {
	%>
	<li <%out.print((current_page == 1) ? "class='active'" : "");%>><a
		href="${pageContext.request.contextPath }${link}/page/1/ordering/${ordering }">1</a></li>
	<li <%out.print((current_page == 2) ? "class='active'" : "");%>><a
		href="${pageContext.request.contextPath }${link}/page/2/ordering/${ordering }">2</a></li>
	<%
		}
			String activepage1 = "";
			if (sumPages >= 3) {
				if (current_page == 1 || current_page == 2) {
					for (int i = 1; i <= 3; i++) {
						if (current_page == i) {
							activepage1 = "class='active'";
						} else {
							activepage1 = "";
						}
	%>
	<li <%out.print(activepage1);%>><a
		href="${pageContext.request.contextPath }${link}/page/<%=i%>/ordering/${ordering }"><span><%=i%></span></a></li>
	<%
		}
				} else if (current_page == sumPages - 1 || current_page == sumPages) {
					String activepage2 = "";
					for (int i = sumPages - 2; i <= sumPages; i++) {
						if (current_page == i) {
							activepage2 = "class='active'";
						} else {
							activepage2 = "";
						}
	%>
	<li <%out.print(activepage2);%>><a
		href="${pageContext.request.contextPath }${link}/page/<%=i%>/ordering/${ordering }"><span><%=i%></span></a></li>
	<%
		}
				} else {
					String activepage = "";
					for (int i = current_page - 2; i <= current_page + 2; i++) {
						if (current_page == i) {
							activepage = "class='active'";
						} else {
							activepage = "";
						}
						if (i > 0 && i < sumPages) {
	%>
	<li <%out.print(activepage);%>><a
		href="${pageContext.request.contextPath }${link}/page/<%=i%>/ordering/${ordering }"><span><%=i%></span></a></li>
	<%
		}
					}
				}
			}
	%>
	<%
		if (current_page != sumPages) {
	%>
	<li <%=nextPage%>><a
		href="<%=request.getContextPath()%>${link}<%=nextlink%>/ordering/${ordering }" rel="next">»</a></li>
	<li><a
		href="<%=request.getContextPath()%>${link}/page/<%=sumPages%>/ordering/${ordering }">Last</a></li>
	<%
		}
	%>
	<%-- <li class="disabled"><a href="#" aria-label="Previous"><span
								aria-hidden="true">«</span></a></li>
						<!-- <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li> -->
						<c:forEach var="i" begin="1" end="${sumPages }">
							<li <c:if test="${current_page eq i}">class="active"</c:if>><a
								href="${pageContext.request.contextPath }/admin/land/${i}">${i}</a></li>
						</c:forEach>
						<li><a href="#" aria-label="Next"><span
								aria-hidden="true">»</span></a></li> --%>
</ul>
<!-- /.pagination -->
<%
	}
%>