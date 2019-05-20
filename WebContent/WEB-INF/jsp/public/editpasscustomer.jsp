<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/" title="Trang chủ">Trang chủ</a></li>
			<li>Thông tin tài khoản</li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<script type="text/javascript">
if(${err eq 0}) alert("LỖI! Vui lòng bạn cập nhập lại");
if(${msg eq 1}) alert("Cập nhập thành công");
		</script>
<div id="container">
	<div class="sortable" id="layoutGroup3">
		<div class="block" id="module_customerMenu">
			<h2>Tài khoản của bạn</h2>
			<div class="blockcontent">
				<ul>
					<li <c:if test="${bold eq 1 }">class="bold"</c:if>><a
						href="${pageContext.request.contextPath}/customer">Quản lý tài
							khoản</a></li>
					<li <c:if test="${bold eq 2 }">class="bold"</c:if>><a
						href="${pageContext.request.contextPath}/customer/edit">Thông
							tin tài khoản</a></li>
					<li <c:if test="${bold eq 3 }">class="bold"</c:if>><a
						href="${pageContext.request.contextPath}/customer/orders">Đơn
							hàng của tôi</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sortable" id="layoutGroup4">
		<div class="block" id="module_customereditpass">
			<h2>Thông tin tài khoản</h2>
			<div class="blockcontent">
				<form method="post" name="info" id="info" action="${pageContext.request.contextPath}/thay-doi-mat-khau"
					onsubmit="return ValidateForm(CheckForm);">
					<div class="field">
						<div class="textlabel">
							<label for="oldpassword">Mật khẩu cũ</label> <span
								class="Required">*</span>:
						</div>
						<input autocomplete="off" type="password" id="oldpassword"
							name="oldpassword" value=""> <span class="help"
							id="help1"><span class="error">Mật khẩu cũ bạn nhập
								không đúng</span></span>
					</div>
					<div class="field">
						<div class="textlabel">
							<label for="password">Mật khẩu mới</label> <span class="Required">*</span>:
						</div>
						<input autocomplete="off" type="password" id="password"
							name="password" value=""> <span class="help" id="help2"><span
							class="error">Mật khẩu phải dài tối thiểu 6 ký tư</span></span>
					</div>
					<div class="field">
						<div class="textlabel">
							<label for="cpassword">Xác nhận mật khẩu</label> <span
								class="Required">*</span>:
						</div>
						<input autocomplete="off" type="password" id="cpassword"
							name="cpassword" value=""> <span class="help" id="help3"></span>
					</div>
					<div class="field">
						<div class="textlabel">&nbsp;</div>
						<input type="submit" align="absmiddle" class="yellowbuttom"
							value="Lưu"> <input type="hidden" name="redirect"
							value="">
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
	var filter = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.([a-z]){2,4})$/;	
	
	function CheckForm()
	{
		var err = false
		var opw = gde("oldpassword");
		var pw = gde("password");
		var cpw = gde("cpassword");	
		
		$("#help1").empty();
		$("#help2").empty();
		$("#help3").empty();
			
		if(opw.value == "")
		{
			$("#help1").append('<span class="error">Mật khẩu cũ bạn nhập không đúng</span>');
			err = true;
		}	
		
		if(pw.value == "")
		{
			$("#help2").append('<span class="error">Mật khẩu phải dài tối thiểu 6 ký tư</span>');
			err = true;
		}

		if(cpw.value != pw.value)
		{
			$("#help3").append('<span class="error">Mật khẩu không khớp</span>');
			err = true;
		}
		
		if(err)
		{
			Boxy.alert('Dữ liệu nhập vào không đúng, vui lòng kiểm tra lại', null, {title: 'Lỗi'});
			return false;
		}
		else
		{
			return true;
		}
	}	
</script>
	</div>
	<div class="clear"></div>
</div>