<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
			
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
