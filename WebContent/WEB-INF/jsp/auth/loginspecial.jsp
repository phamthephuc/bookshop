<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container"></div>
<div class="clear">&nbsp;</div>
<div id="container">
	<div>
		<div>
			<div class="block" id="module_loginspecial">
				<div class="blockcontent">
					<div class="loginsocial">
					</div>
					<div class="loginform">
						<form method="post" name="fgf" id="fgf"
							action="${pageContext.request.contextPath}/dang-nhap"
							onsubmit="return ValidateForm(CheckForm);">
							<div class="field">
								<div class="textlabel">
									<label for="idusername">Username</label> <span class="Required">*</span>:
								</div>
								<input type="text" autocomplete="off" onfocus="showhelp(1)"
									onkeyup="" onblur="cusername(this.value, 1)" autocomplete="off"
									id="idusername" name="username" value=""> <span
									class="help" id="help1">Nhập tên đăng nhập của bạn</span>
							</div>
							<div id="passshow">
								<div class="field">
									<div class="textlabel">
										<label for="idpassword">Mật khẩu</label> <span
											class="Required">*</span>:
									</div>
									<input autocomplete="off" onfocus="showhelp(2)"
										onblur="fonblur(2)" id="idpassword" type="password"
										name="password"> <span class="help" id="help2">Nhập
										password của bạn</span>
								</div>
								<c:if test="${not empty param.error }">
									<div class="field" style="color: red;">
										<div class="textlabel">&nbsp;</div>
										Bạn đã nhập sai tài khoản hoặc tên đăng nhập
									</div>
								</c:if>	
								<div class="field">
									<div class="textlabel">&nbsp;</div>
									<a href="/users/forgotpasswords/index.html"
										title="Quên mật khẩu?">Quên mật khẩu?</a>
								</div>
							</div>
							<div class="clear"></div>
							<div class="field">
								<div class="textlabel">&nbsp;</div>
								<input type="hidden" name="redirect"
									value="%2Forders%2Fcheckout%2Findex.html"> <input
									type="submit" align="absmiddle" class="loginbuton"
									value="Tiếp tục">
							</div>
						</form>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<script type="text/javascript">
				var filter = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.([a-z]){2,4})$/;
				var filterusername = /^[a-z0-9_-]{3,24}$/;
				function fonblur(id) {
					var pw = gde("idpassword");
					var un = gde("idusername");
					if (id == 2) {
						if (pw.value.length < 6) {
							$("#help2").empty();
							$("#help2")
									.append(
											'<span class="error">Mật khẩu phải dài tối thiểu 6 ký tư</span>');
						} else {
							$("#help2").empty();
							$("#help2")
									.append('<span class="ok">&nbsp;</span>');
						}
					}
				}
				function CheckForm() {
					var err = false
					var ac = gde("account1");
					/* var em = gde("idemail"); */
					/* var emlc = em.value.toLowerCase(); */
					var pw = gde("idpassword");
					var un = gde("idusername");

					/* 	if(em.value == "")
						{
							$("#help1").empty();
							$("#help1").append('<span class="error">Vui lòng nhập email</span>');				
							err = true;
						}
						else if (!filter.test(emlc))
						{
							$("#help1").empty();
							$("#help1").append('<span class="error">Email bạn nhập không đúng</span>');	
							err = true;
						} */

					if (ac.checked && pw.value.length < 6) {
						$("#help2").empty();
						$("#help2")
								.append(
										'<span class="error">Mật khẩu phải dài tối thiểu 6 ký tư</span>');
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
						$("#help1").append('Nhập username của bạn');
					}

					if (id == 2) {
						$("#help2").empty();
						$("#help2").append('Nhập mật khẩu của bạn');
						err = true;
					}
				}
				function cusername(username, onblur) {
					if (filterusername.test(username)) {
						$("#help1").empty();
					} else if (onblur) {
						if (username != "") {
							$("#help1").empty();
							$("#help1")
									.append(
											'<span class="error">Username bạn nhập không đúng dạng, username ít nhất có 3 kí tự</span>');
						} else {
							$("#help1").empty();
							$("#help1")
									.append(
											'<span class="error">Vui lòng nhập username</span>');
						}
					}
				}
				function showpass(value) {
					if (value == 0) {
						$('#passshow').hide();
					} else {
						$('#passshow').show();
					}
				}

				function google_login() {
					var n = (screen.height - 400) / 2;
					var t = (screen.width - 570) / 2;
					window.open("/users/openidspe/1/index.html", "_blank",
							"top=" + n + ", left=" + t
									+ ", width=570, height=400");
				}

				function yahoo_login() {
					var n = (screen.height - 400) / 2;
					var t = (screen.width - 570) / 2;
					window.open("/users/openidspe/2/index.html", "_blank",
							"top=" + n + ", left=" + t
									+ ", width=570, height=400");
				}

				function testAPI(response) {
					var accessToken = response.authResponse.accessToken;
					FB.api('/me', function(response) {
						url = '${pageContext.request.contextPath}/facelogin';
						url = addQuery(url, 'fid=' + response.id);
						url = addQuery(url, 'access_token=' + accessToken);

						document.location.href = url;
					});
				}

				function checkLoginState() {
					FB.getLoginStatus(function(response) {
						if (response.status === 'connected') {
							testAPI(response);
						} else {
							FB.login(function(response) {
								if (response.authResponse) {
									if (response.status) {
										testAPI(response);
									}
								}
							}, {
								scope : 'public_profile,email'
							});
						}
					});
				}
			</script>
		</div>
	</div>
</div>