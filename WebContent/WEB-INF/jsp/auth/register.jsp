<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<c:if test="${err7 eq 7 }">
	<script type="text/javascript">alert("Đăng ký không thành công, mời bạn thử lại");</script>
</c:if>
<c:if test="${err7 eq 6 }">
	<script type="text/javascript">alert("Đăng ký không thành công, mời bạn thử lại");</script>
</c:if>
<c:if test="${msg eq 1 }">
	<script type="text/javascript">
			alert("Đăng ký thành công, mời bạn đăng nhập!");
		 	window.location.href='${pageContext.request.contextPath}/login';
	</script>
</c:if>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/" title="Trang chủ">Trang chủ</a></li>
			<li>Đăng ký</li>
		</ul>
	</div>
</div>
<div id="container">
	<div class="sortable" id="layoutGroup1">
		<div class="block" id="module_Register">
			<h1>
				Đăng ký <span>hoặc</span> <a href="${pageContext.request.contextPath}/dang-nhap"
					title="Đăng nhập">Đăng nhập</a>
			</h1>
			<div class="blockcontent">
				<div class="registerform">
					<form method="post" name="rgt" id="rgt" action="${pageContext.request.contextPath}/dang-ky" onsubmit="return ValidateForm(CheckForm);">
						<h3>Thông tin đăng nhập</h3>
						<div class="field">
							<div class="textlabel">
								<label for="idusername">Username</label> <span class="Required">*</span>:
							</div>
							<input type="text" autocomplete="off" onfocus="showhelp(7)"
								onkeyup="" onblur="cusername(this.value, 7)"
									autocomplete="off"
								id="idusername" name="username" value=""> <span class="help" id="help7">Nhập tên đăng nhập của bạn</span>
						</div>
						<div class="field">
							<div class="textlabel">
								<label for="idemail">Email</label> <span class="Required">*</span>:
							</div>
							<input type="text" autocomplete="off" onfocus="showhelp(1)"
								onblur="cemail(this.value, 1)" onkeyup="cemail(this.value)"
								id="idemail" name="email" value=""> <span class="help" id="help1">Nhập email của bạn</span>
						</div>
						<div class="field">
							<div class="textlabel">
								<label for="idpassword">Mật khẩu</label> <span class="Required">*</span>:
							</div>
							<input autocomplete="off" onfocus="showhelp(2)"
								onblur="fonblur(2)" id="idpassword" type="password"
								name="password"> <span class="help" id="help2">Nhập password của bạn</span>
						</div>
						<div class="field">
							<div class="textlabel">
								<label for="repassword">Xác nhận mật khẩu</label> <span
									class="Required">*</span>:
							</div>
							<input autocomplete="off" onfocus="showhelp(3)"
								onblur="fonblur(3)" id="repassword" type="password"
								name="repassword"> <span class="help" id="help3">Nhập lại password của bạn</span>
						</div>
						<div class="clear"></div>
						<h3>Thông tin cá nhân</h3>
						<div class="field">
							<div class="textlabel">
								<label for="fullname">Họ và tên</label> <span class="Required">*</span>:
							</div>
							<input onfocus="showhelp(4)" onblur="fonblur(4)"
								autocomplete="off" id="fullname" type="text" name="fullname"
								class="Field197" value=""> <span class="help" id="help4"></span>
						</div>
						<div class="field">
							<div class="textlabel">
								<label for="telephone">Điện thoại</label> <span class="Required">*</span>:
							</div>
							<input onfocus="showhelp(5)" onblur="fonblur(5)"
								autocomplete="off" id="telephone" type="text" name="phone"
								value=""><span class="help" id="help5"></span>
						</div>
						<div class="field">
							<div class="textlabel">
								<label for="telephone">Địa chỉ</label> <span class="Required">*</span>:
							</div>
							<input onfocus="showhelp(4)" onblur="fonblur(4)"
								autocomplete="off" id="address" type="text" name="address"
								value=""><span class="help" id="help5"></span>
						</div>
						<div class="clear">&nbsp;</div>
						<div class="clear">&nbsp;&nbsp;</div>
						<div class="field" style="padding-left: 200px">
							<input type="submit" align="absmiddle"
								class="loginbuton Field200" value="Đăng ký"> <input
								type="hidden" name="redirect" value=""> <input
								type="hidden" name="C89bebf2de67ef5b5f19651230e7e2303" value="1">
						</div>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var filter = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.([a-z]){2,4})$/;
			var filterphone = /^[0-9-+]+$/;
			var filterusername = /^[a-z0-9_-]{3,24}$/;
			function fonblur(id) {
				var err = false
				var em = gde("idemail");
				var pw = gde("idpassword");
				var rpw = gde("repassword");
				var fn = gde("fullname");
				var tlp = gde("telephone");
				var un = gde("idusername");

				if (id == 2) {
					if (pw.value.length < 6) {
						$("#help2").empty();
						$("#help2")
								.append(
										'<span class="error">Mật khẩu phải dài tối thiểu 6 ký tư</span>');
					} else {
						$("#help2").empty();
						$("#help2").append('<span class="ok">&nbsp;</span>');
					}
				}

				if (id == 3) {
					if (pw.value != rpw.value) {
						$("#help3").empty();
						$("#help3")
								.append(
										'<span class="error">Xác nhận mật khẩu không đúng</span>');
					} else if (rpw.value == '') {

					} else {
						$("#help3").empty();
						$("#help3").append('<span class="ok">&nbsp;</span>');
					}
				}

				if (id == 4) {
					if (fn.value == "") {
						$("#help4").empty();
						$("#help4")
								.append(
										'<span class="error">Vui lòng nhập tên của bạn</span>');
					} else {
						$("#help4").empty();
						$("#help4").append('<span class="ok">&nbsp;</span>');
					}
				}

				if (id == 5) {
					if (tlp.value == "") {
						$("#help5").empty();
						$("#help5")
								.append(
										'<span class="error">Vui lòng nhập điện thoại</span>');
						err = true;
					} else if (!filterphone.test(tlp.value)
							|| tlp.value.length < 10) {
						$("#help5").empty();
						$("#help5")
								.append(
										'<span class="error">Số điện thoại không đúng</span>');
						err = true;
					} else {
						$("#help5").empty();
						$("#help5").append('<span class="ok">&nbsp;</span>');
					}
				}
				/*if (id == 7) { 
					if (un.value == "") {
						$("#help7").empty();
						$("#help7")
								.append(
										'<span class="error">Vui lòng nhập tên đăng nhập của bạn</span>');
					}else if(!filterusername.test(un.value)){
						$("#help7").empty();
						$("#help7")
								.append(
										'<span class="error">Username không đúng dạng</span>');
						err = true;
					} else {
						$("#help7").empty();
						$("#help7").append('<span class="ok">&nbsp;</span>');
					}
				} */

				return false;
			}

			function CheckForm() {
				var err = false
				var em = gde("idemail");
				var pw = gde("idpassword");
				var rpw = gde("repassword");
				var fn = gde("fullname");
				var tlp = gde("telephone");
				var un = gde("idusername");
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

				if (pw.value.length < 6) {
					$("#help3").empty();
					$("#help2").empty();
					$("#help2")
							.append(
									'<span class="error">Mật khẩu phải dài tối thiểu 6 ký tư</span>');
					err = true;
				} else if (pw.value != rpw.value) {
					$("#help3").empty();
					$("#help3")
							.append(
									'<span class="error">Xác nhận mật khẩu không đúng</span>');
					err = true;
				}

				if (fn.value == "") {
					$("#help4").empty();
					$("#help4")
							.append(
									'<span class="error">Vui lòng nhập tên của bạn</span>');
					err = true;
				}

				if (tlp.value == "") {
					$("#help5").empty();
					$("#help5")
							.append(
									'<span class="error">Vui lòng nhập điện thoại</span>');
					err = true;
				} else if (!filterphone.test(tlp.value) || tlp.value.length < 9) {
					$("#help5").empty();
					$("#help5")
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

			function showhelp(id) {
				if (id == 1) {
					$("#help1").empty();
					$("#help1").append('Nhập email của bạn');
				}

				if (id == 2) {
					$("#help2").empty();
					$("#help2").append('Mật khẩu phải có ít nhất 6 ký tự');
					err = true;
				}

				if (id == 3) {
					$("#help3").empty();
					$("#help3").append('Xác nhận lại mật khẩu');
					err = true;
				}

				if (id > 3) {
					$("#help" + id).empty();
				}
			}

			function cemail(email, onblur) {
				if (filter.test(email)) {
					address = '<%=request.getContextPath() %>/checkemail';
					//address = addQuery(address, 'email=' + email);
					$
							.ajax({
								url : address,
								//dataType : "json",
								type: 'POST',
								cache : false,
								data : {
									aemail : email
								},
								error : function(e) {
									//alert(address);
									return;
								},
								success : function(data) {
									//alert(data);
									//alert(data.err);
									var msg = data;
									if (msg == 0) {
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
				} else if (onblur) {
					if (email != "") {
						$("#help1").empty();
						$("#help1")
								.append(
										'<span class="error">Email bạn nhập không đúng</span>');
					} else {
						$("#help1").empty();
						$("#help1")
								.append(
										'<span class="error">Vui lòng nhập email</span>');
					}
				}
			}
			function cusername(username, onblur) {
				if (filterusername.test(username)) {
					address = '<%=request.getContextPath() %>/checkusername';
					//address = addQuery(address, 'email=' + email);
					$
							.ajax({
								url : address,
								//dataType : "json",
								type: 'POST',
								cache : false,
								data : {
									ausername : username
								},
								error : function(e) {
									//alert(address);
									return;
								},
								success : function(data) {
									//alert(data);
									//alert(data.err);
									var msg = data;
									if (msg == 0) {
										$("#help7").empty();
										$("#help7")
												.append(
														'<span class="ok">Username có thể dùng</span>');
									} else {
										$("#help7").empty();
										$("#help7")
												.append(
														'<span class="error">Username này đã có người dùng</span>');
									} 
								}
							});
				} else if (onblur) {
					if (username != "") {
						$("#help7").empty();
						$("#help7")
								.append(
										'<span class="error">Username bạn nhập không đúng</span>');
					} else {
						$("#help7").empty();
						$("#help7")
								.append(
										'<span class="error">Vui lòng nhập username</span>');
					}
				}
			}
		</script>
	</div>
	<div class="clear"></div>
</div>