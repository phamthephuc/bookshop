<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- tables -->		
				<div class="table-heading">
					<c:if test="${listBooks.size() == 0 }">
						<h2 style="color: red">KHÔNG TÌM THẤY KẾT QUẢ</h2>
					</c:if>
				</div>
				
				<c:if test="${listBooks.size() > 0 }">
				<div class="agile-tables">
					<div class="w3l-table-info">
					    <table id="table">
						<thead>
						  <tr>
							<th>Tên Sách</th>
							<th>Danh mục</th>
							<th>Tên tác giả</th>
							<th>Tên nhà xuất bản</th>
							<th>Giá gốc</th>
							<th>Giá sau khi giảm</th>
							<th>Ngày xuất bản</th>
							<th>Hình ảnh</th>
							<th>Số sách còn lại</th>
							<th>Số trang</th>
							<th>Tình trạng</th>
							<th>Chức năng</th>
						  </tr>
						</thead>
						<tbody>
						<c:forEach items="${listBooks }" var="book">
						  <tr>
							<td>${book.book_name }</td>
							<td>${book.category_name }</td>
							<td>${book.author_name}</td>
							<td>${book.publisher_name }</td>
							<td><fmt:formatNumber type="number" value='${book.price }'/>đ</td>
							<td><fmt:formatNumber type="number" value='${book.price - book.price * book.sale / 100 }'/>đ</td>
							<fmt:formatDate value="${book.realease_date}" var="dateFormat" pattern="dd/MM/yyyy"/>
							<td>${dateFormat}</td>
							<td ><img width="100px" src="${pageContext.request.contextPath}/files/${book.picture }"></td>
							<td>${book.number_rest}</td>
							<td>${book.pages}</td>
							<td>${book.is_active}</td>
							<td>
								 <a href="${pageContext.request.contextPath }/admin/book/edit/${book.bid }" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span></a>
	                             <a href="${pageContext.request.contextPath }/admin/book/del/${book.bid }" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?')" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a>
	                             <a href="${pageContext.request.contextPath }/admin/book/addNum/${book.bid }" title="" class="btn btn-info"><span class="glyphicon glyphicon-plus-sign"></span></a>
							</td>
						  </tr>
						</c:forEach>
						  </tbody>
					  </table>
					</div>
			
				  <!-- Pagination -->
                           <%--  <nav class="text-center" aria-label="...">
                                <ul class="pagination">
                                    <c:if test="${page > 1 }">
		                            <li>
		                                <a href="${pageContext.request.contextPath }/admin/books/${page - 1}">
		                                    << </a>
		                            </li>
		                        </c:if>
		                        	<c:if test="${sumPage > 1 }">
		                            <c:forEach begin="1" end="${sumPage }" var="i">
		                            	<c:if test="${page == i }">
		                            		<li><a style="background-color: yellow;" href="${pageContext.request.contextPath }/admin/books/${i}">${i }</a></li>
		                            	</c:if>
		                            	<c:if test="${page != i }">
		                            		<li><a href="${pageContext.request.contextPath }/admin/books/${i}">${i }</a></li>
		                            	</c:if>
		                                    	
		                            </c:forEach>
		                            </c:if>
								<c:if test="${page < sumPage }">
		                            <li>
		                                <a href="${pageContext.request.contextPath }/admin/books/${page + 1}">
		                                    >> </a>
		                            </li>
		                        </c:if>
                                </ul>
                            </nav> --%>
                  <!-- /.pagination -->

				</div>
				</c:if>
				<!-- //tables -->
				
				<!-- tables -->
				
				<!-- //tables -->
			</div>
		</div>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/admin/css/table-style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/templates/admin/css/basictable.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/templates/admin/js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

      $('#table-swap-axis').basictable({
        swapAxis: true
      });

      $('#table-force-off').basictable({
        forceResponsive: false
      });

      $('#table-no-resize').basictable({
        noResize: true
      });

      $('#table-two-axis').basictable();

      $('#table-max-height').basictable({
        tableWrapper: true
      });
    });
</script>
<!-- //tables -->	