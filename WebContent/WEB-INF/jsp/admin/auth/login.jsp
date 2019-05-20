<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<body class="signup-body">
		<div class="agile-signup">	
			
			<div class="content2">
				<div class="grids-heading gallery-heading signup-heading">
					<h2>Login</h2>
				</div>
				<form action="" method="post">
					<input type="text" name="username" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}">
					<input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
					<br>
					<span ><c:if test="${not empty param.error }">Bạn đã nhập sai tài khoản hoặc tên đăng nhập</c:if></span>
					
					<input type="submit" class="register" value="Login">
				</form>
				<div class="signin-text">
					
					<div class="text-left">
						<p><a href="${pageContext.request.contextPath }/auth/reset-password"> Forgot Password? </a></p>
					</div>
					<div class="clearfix"> </div>
				</div>
				
				<a href="${pageContext.request.contextPath }">Back To Home</a>
			</div>
		