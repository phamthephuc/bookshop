<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body class="signup-body">
		<div class="agile-signup">	
		
			<div class="content2">
				<div class="grids-heading gallery-heading signup-heading">
					<h2>Forgot Password</h2>
				</div>
				<form action="" method="post">
					<input type="text" name="username" placeholder="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}">
					<input type="email" name="email" placeholder="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
					<input type="submit" class="register" value="Reset Password">
				</form>
				<a href="${pageContext.request.contextPath }/auth/login">Back To Login</a>
			</div>
			