<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
			<!-- footer -->
			<div class="copyright">
				<p>Â© 2016 Colored . All Rights Reserved . Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
			<!-- //footer -->
			
		</div>
	<script src="${pageContext.request.contextPath }/templates/admin/js/proton.js"></script>
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
</body>
</html>
