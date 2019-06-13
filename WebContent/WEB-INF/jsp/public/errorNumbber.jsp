<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container"></div>
<div class="clear">&nbsp;</div>


<div id="container">
	<div id="content_left_contener">
		<div class="sortable" id="layoutGroup5">
			<div class="block" id="module_checkoutend">
				<h4>XIN LỖI VÌ SỰ BẤT TIỆN</h4>
				<div class="blockcontent">
						<table cellpadding="2" cellspacing="2" width="100%">
							<tbody>
								<c:forEach items="${listAlert }" var="objAlert">
									<tr>
									<td valign="top" style="color: red" nowrap="nowrap">${objAlert }</td>
								</tr>
								</c:forEach>
							</tbody>
							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													$('#forwardStep')
															.bind(
																	'click',
																	function() {
																		var page = $(
																				this)
																				.attr(
																						'rel');
																		alert('Kích vào nút Paypal để tiến hành thanh toán');
																	});
												});
							</script>

						</table>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div id="oder_footer">
				<div class="fleft">
					Bạn cần hỗ trợ? Gọi HotLine: <b>098. 4946. 627</b>
				</div>
				<div class="oder_footer_menu">
					<ul>
						<li class="First"><a href="/" title="Trang chủ"
							target="_self">Trang chủ</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
</div>