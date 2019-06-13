<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
		<div class="main-grid">
			<div class="agile-grids">	
				<!-- input-forms -->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>SỬA SÁCH</h2>
					</div>
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h3 ><a class="label label-info" href="${pageContext.request.contextPath }/admin/books">Quay lại</a></h3>
								</div>
								<div class="form-body">
									<form action="" method="post" enctype="multipart/form-data"> 
										<div class="form-group"> 
											<label for="exampleInputEmail1">Tên sách</label> 
											<input type="text" name="book_name" class="form-control" id="exampleInputEmail1" value="${book.book_name }" placeholder="tên sản phẩm" required="required" minlength="5" maxlength="200"  requiredmsg="Trường này có từ 5 đến 200 ký tự">
											<label for="exampleInputEmail1">Chọn danh mục</label>
											<select class="form-control" id="exampleInputEmail1" name="category_id">
												<c:forEach items="${hashMapCat.keySet() }" var="catParent">
													<c:forEach items="${hashMapCat.get(catParent) }" var="cat">
														<c:choose>
															<c:when test="${cat.cid == book.category_id}">
																<option selected="selected" value="${cat.cid }">${cat.cname } (${catParent.cname})</option>
															</c:when>
															<c:otherwise>
																<option value="${cat.cid }">${cat.cname } (${catParent.cname})</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:forEach>
											</select> 
											<label for="exampleInputEmail1">Chọn tác giả</label>
											<select class="form-control" id="exampleInputEmail1" name="author_id">
												<c:forEach items="${listAuthors }" var="author">
													<option <c:if test="${book.author_id == author.aid }">selected="selected"</c:if> value="${author.aid }">${author.name }</option>
												</c:forEach>
											</select>
											<label for="exampleInputEmail1">Chọn nhà sản xuất</label>
											<select class="form-control" id="exampleInputEmail1" name="publisher_id">
												<c:forEach items="${listPublishers }" var="publisher">
													<option <c:if test="${book.publisher_id == publisher.pid }">selected="selected"</c:if> value="${publisher.pid }">${publisher.name }</option>
												</c:forEach>
											</select>
											<label for="exampleInputEmail1">Giá bán</label> 
											<input type="number" step="1" name="price" value="${slugUtil.formatPrice(book.price) }" class="form-control" id="exampleInputEmail1" placeholder="giá bán" required="required" min="0" requiredmsg="Trường này là số lớn hơn 0">
											<label for="exampleInputEmail1">Giảm giá</label> 
											<input type="number" step="1" name="sale" value="${book.sale }" class="form-control" id="exampleInputEmail1" placeholder="phần trăm giảm giá" required="required" min="0" max="100" requiredmsg="Trường này là số lớn hơn 0 nhỏ hơn 100">
											<label for="exampleInputEmail1">Số trang</label> 
											<input type="number" step="1" name="pages" value="${book.pages }" class="form-control" id="exampleInputEmail1" placeholder="số lượng" required="required" min="0" requiredmsg="Trường này là số lớn hơn 0">
											<label for="exampleInputEmail1">Ngày xuất bản</label>
											<input type="date" name="realease_date" value='${book.realease_date}' class="form-control" required="date" requiredmsg="Trường này cần là định dạng ngày">
											<input type="hidden" name="number_rest" value='${book.number_rest}' class="form-control">
											<input type="hidden" name="number_start" value='${book.number_start}' class="form-control">
											<label for="exampleInputEmail1">Mô tả</label> 
											<textarea id="ckeditor" name="preview" class="form-control"  required="required" minlength="20" maxlength="2000"  requiredmsg="Trường này có từ 20 đến 2000 ký tự">${book.preview}</textarea>
											<label for="exampleInputEmail1">Hình ảnh</label>
											<img alt="" width="100px" src="${pageContext.request.contextPath }/files/${book.picture }">
											<input type="file" name="hinh" class="form-control" id="exampleInputEmail1" placeholder="tên danh mục">
											<label for="exampleInputEmail1">Tình trạng</label> 
											<select name="is_active" class="form-control" id="exampleInputEmail1">
												<option <c:if test="${book.is_active == true }">selected="selected"</c:if> value="1">Cho phép hiển thị</option>
												<option <c:if test="${book.is_active == false }">selected="selected"</c:if> value="0">Ẩn</option>
											</select>
										</div> 
										<button type="submit" class="btn btn-default w3ls-button">Submit</button> 
									</form> 
								</div>
							</div>
						</div>
					</div>
					
				
				</div>
				<!-- //input-forms -->
			</div>
		</div>
		