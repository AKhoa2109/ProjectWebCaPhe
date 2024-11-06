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
	<jsp:include page="/views/fragment/header.html" />
	
	<div class="login-container">
		<div class="login-form">
			<h2>Đăng nhập</h2>
			<form>
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
				<label>Nếu chưa có tài khoản? <a
					href="signup.html">Đăng kí</a></label>
				<center>
					<label for="">Hoặc đặng nhập với</label>
				</center>
			</div>
			<div class="social-login">
				<button class="facebook-login">
					<i class="fa-brands fa-facebook-f"></i>Facebook
				</button>
				<button class="google-login">
					<i class="fa-brands fa-google"></i>Google
				</button>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="/views/fragment/footer.html" />
</body>

</html>