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
					<li><a
						href="${pageContext.request.contextPath}/quan-ly-tai-khoan">Quản lý tài
							khoản</a></li>
					<li class="bold">Thông
							tin tài khoản</li>
					<li><a
						href="${pageContext.request.contextPath}/xem-don-hang">Đơn
							hàng của tôi</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sortable" id="layoutGroup4">
		<div class="block" id="module_customeredit">
			<h2>Thông tin tài khoản</h2>
			<div class="blockcontent">
				<form method="post" name="info" id="info"
					action="${pageContext.request.contextPath}/thay-doi-thong-tin"
					onsubmit="return ValidateForm(CheckForm);">
					<div class="field">
						<div class="textlabel">
							<label for="idemail">Email</label> <span class="Required">*</span>:
						</div>
						<input type="text" autocomplete="off" onfocus="showhelp(1)"
							onblur="cemail(this.value, 1)" onkeyup="cemail(this.value)"
							id="idemail" name="email" value="${objUserLogin.email }">
						<span class="help" id="help1"></span>
					</div>
					<div class="field">
						<div class="textlabel">
							<label for="fullname">Họ và tên</label> <span class="Required">*</span>:
						</div>
						<input autocomplete="off" id="fullname" type="text"
							name="fullname" 
							value="${objUserLogin.fullname }"> <span class="help"
							id="help2"></span>
					</div>
					<div class="field">
						<div class="textlabel">
							<label for="telephone">Điện thoại</label> <span class="Required">*</span>:
						</div>
						<input autocomplete="off" id="telephone" type="text"
							name="phone" value="${objUserLogin.phone }"> <span
							class="help" id="help3"></span>
					</div>
					<div class="field">
						<div class="textlabel">
							<label for="telephone">Địa chỉ</label> <span class="Required">*</span>:
						</div>
						<input autocomplete="off" id="address" type="text" name="address"
							value="${objUserLogin.address }"> <span class="help"
							id="help5"></span>
					</div>
					<div class="field">
						<input autocomplete="off" hidden="hidden" type="text" name="username"
							value="${objUserLogin.username }">
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
			var filterphone = /^[0-9-+]+$/;

			function CheckForm() {
				var err = false
				var em = gde("idemail");
				var fn = gde("fullname");
				var tlp = gde("telephone");

				if (em.value == "") {
					$("#help1").empty();
					$("#help1").append(
							'<span class="error">Vui lòng nhập email</span>');
					err = true;
				} else if (!filter.test(em.value)) {
					$("#help1").empty();
					$("#help1")
							.append(
									'<span class="error">Email bạn nhập không đúng</span>');
					err = true;
				}

				if (fn.value == "") {
					$("#help2").empty();
					$("#help2")
							.append(
									'<span class="error">Vui lòng nhập tên của bạn</span>');
					err = true;
				}

				if (tlp.value == "") {
					$("#help3").empty();
					$("#help3")
							.append(
									'<span class="error">Vui lòng nhập điện thoại</span>');
					err = true;
				} else if (!filterphone.test(tlp.value) || tlp.value.length < 9) {
					$("#help3").empty();
					$("#help3")
							.append(
									'<span class="error">Số điện thoại không đúng</span>');
					err = true;
				}

				if (err) {
					Boxy
							.alert(
									'Dữ liệu nhập vào không đúng, vui lòng kiểm tra lại',
									null, {
										title : 'Lỗi'
									});
					return false;
				} else {
					return true;
				}
			}

			function cemail(email, onblur) {
				if (filter.test(email)) {
					address = '/users/checkemail/index.html';
					address = addQuery(address, 'email=' + email);
					$
							.ajax({
								url : address,
								dataType : "json",
								error : function(e) {
									return;
								},
								success : function(data) {
									if (data.err == 0) {
										$("#help1").empty();
										$("#help1")
												.append(
														'<span class="ok">Email có thể dùng</span>');
									} else {
										$("#help1").empty();
										$("#help1")
												.append(
														'<span class="error">Email này đã có người dùng</span>');
									}
								}
							});
				}
			}
		</script>
	</div>
	<div class="clear"></div>
</div>