<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header id="header">
		<div class="container">
			<img
				src="<%=request.getContextPath()%>/views/assets/favicon/logo.png"
				alt="Logo" />
			<nav class="nav-link-feature">
				<ul class="nav-links">
					<li><a href="TrangChuServlet">Trang chủ</a></li>
					<li><a href="#">Giới thiệu</a></li>
					<li><a href="DanhMucSanPham">Danh mục sản phẩm</a></li>
					<li><a href="#">Liên hê</a></li>
				</ul>
			</nav>
			<nav class="nav-feature">
				<ul class="feature">
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-user"></i>
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="TrangChuServlet?action=login">Đăng
									nhập</a></li>
							<li><a class="dropdown-item" href="TrangChuServlet?action=signup">Đăng
									kí</a></li>
						</ul></li>
					<li class="feature-cart"><a href="#" class="cart"><i
							class="fa-solid fa-cart-shopping"></i> <span
							class="position-absolute top-10 translate-middle badge rounded-pill bg-danger">
								1+ <span class="visually-hidden">unread messages</span>
						</span> </a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>