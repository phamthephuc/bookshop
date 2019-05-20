<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container"></div>
<div class="clear">&nbsp;</div>
<div id="container">
	<div id="content_left_contener">
		<div class="row">
			<div class="col-md-2">
				<a href='javascript:goback()' class="btn btn-danger">Quay lại
					trang trước</a>
			</div>
		</div>
	</div>
</div>
<script>
	function goback() {
		history.back(-1)
	}
</script>