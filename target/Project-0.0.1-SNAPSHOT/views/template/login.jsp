<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/views/fragment/head.html"%>
<title>Đăng nhập</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/views/fragment/header.jsp" />

	<div class="login-container">
		<div class="login-form">
			<h2>Đăng nhập</h2>
			<form method="post">
				<input type="email" placeholder="Email" required /> <input
					type="password" placeholder="Mật khẩu" required />
			</form>
			<div class="login-forget-pass">
				<a class="forget-pass" href="">Quên mật khẩu</a>
			</div>
			<div class="login-action">
				<button type="submit">Đăng nhập</button>
			</div>
			<div class="sign-up">
				<label>Nếu chưa có tài khoản? <a href="signup.html">Đăng
						kí</a></label>
				<center>
					<label for="">Hoặc đặng nhập với</label>
				</center>
			</div>
			<div class="social-login">
				<a class="google-login"
					href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/Project/GoogleLoginServlet&response_type=code&client_id=955034230388-n9bs7ftul2g2n230qp4hko3j7dug4b0k.apps.googleusercontent.com&approval_prompt=force">
					<i class="fa-brands fa-google"></i>Google
				</a>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="/views/fragment/footer.jsp" />
</body>

</html>