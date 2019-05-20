<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- footer -->
		<div class="footer">
			<p>Â© 2016 Colored . All Rights Reserved . Design by <a href="http://w3layouts.com/">W3layouts</a></p>
		</div>
		<!-- //footer -->
	</section>
	<script>
		$(window).load(function() {
		$.fn.lightspeedBox();
		});

	</script>
	
	
			<script type="text/javascript">
		$(document).ready(function() {
		    var elements = $("input, select,textarea");
		    for (var i = 0; i < elements.length; i++) {
		        elements[i].oninvalid = function(e) {
		            e.target.setCustomValidity("");
		            if (!e.target.validity.valid) {
		                 e.target.setCustomValidity(e.target.getAttribute("requiredmsg"));
		            }
		        };
		        elements[i].oninput = function(e) {
		            e.target.setCustomValidity("");
		        };
		    }
		})
		</script>
		
	<script type="text/javascript" src="${pageContext.request.contextPath }/libraries/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/libraries/ckfinder/ckfinder.js"></script>
	<script type="text/javascript">
		var editor = CKEDITOR.replace( 'areaText');
		CKFinder.setupCKEditor(editor,"libraries/ckfinder/");
	</script>
	<script src="${pageContext.request.contextPath }/templates/admin/js/bootstrap.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/lsb.css">
	<script src="${pageContext.request.contextPath }/templates/admin/js/proton.js"></script>
</body>
</html>