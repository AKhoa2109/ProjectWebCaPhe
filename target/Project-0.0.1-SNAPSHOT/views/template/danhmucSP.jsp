<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/styles/danhmucSP.css" />
<title>Danh mục sản phẩm</title>
<script>
	
</script>
</head>
<body>
	<div class="category-product-container">
		<!-- Sidebar Menu -->
		<aside class="category-sidebar">
			<ul>
				<li><a href="DanhMucSanPham?id=0">Tất Cả</a></li>
				<c:forEach var="list" items="${listLoaiSP}">
					<li><a href="DanhMucSanPham?id=${list.maLoaiSP}">${list.tenLoaiSP}</a></li>
				</c:forEach>
			</ul>
		</aside>

		<!-- Product Display Section -->

		<section class="products">
			<div class="product-card-grid">
				<c:forEach var="product" items="${listSanPham}">
					<div class="product-card">
						<a
							href="ChiTietSanPhamServlet?id=${product.maSP}&type=${product.maLoaiSP}">
							<img
							src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
							alt="${product.tenSP}" />
							<h2>${product.tenSP}</h2>
							<p>${product.getPriceFormat()}</p>
						</a>
					</div>
				</c:forEach>
			</div>

			<div id="coffee">
				<c:if test="${not empty LSP01}">
					<h2>${LSP01[0].tenLoaiSP}</h2>
				</c:if>
				<div class="product-card-grid">
					<c:forEach var="product" items="${LSP01}">
						<div class="product-card">
							<a
								href="ChiTietSanPhamServlet?id=${product.maSP}&type=${product.maLoaiSP}">
								<img
								src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
								alt="${product.tenSP}" />
								<h2>${product.tenSP}</h2>
								<p>${product.getPriceFormat()}</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>

			<div id="cake">
				<c:if test="${not empty LSP01}">
					<h2>${LSP06[0].tenLoaiSP}</h2>
				</c:if>
				<div class="product-card-grid">
					<c:forEach var="product" items="${LSP06}">
						<div class="product-card">
							<a
								href="ChiTietSanPhamServlet?id=${product.maSP}&type=${product.maLoaiSP}">
								<img
								src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
								alt="${product.tenSP}" />
								<h2>${product.tenSP}</h2>
								<p>${product.getPriceFormat()}</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="sinhto">
				<c:if test="${not empty LSP01}">
					<h2>${LSP03[0].tenLoaiSP}</h2>
				</c:if>
				<div class="product-card-grid">

					<c:forEach var="product" items="${LSP03}">
						<div class="product-card">
							<a
								href="ChiTietSanPhamServlet?id=${product.maSP}&type=${product.maLoaiSP}">
								<img
								src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
								alt="${product.tenSP}" />
								<h2>${product.tenSP}</h2>
								<p>${product.getPriceFormat()}</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="kem">
				<c:if test="${not empty LSP01}">
					<h2>${LSP04[0].tenLoaiSP}</h2>
				</c:if>
				<div class="product-card-grid">
					<c:forEach var="product" items="${LSP04}">
						<div class="product-card">
							<a
								href="ChiTietSanPhamServlet?id=${product.maSP}&type=${product.maLoaiSP}">
								<img
								src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
								alt="${product.tenSP}" />
								<h2>${product.tenSP}</h2>
								<p>${product.getPriceFormat()}</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="tra">
				<c:if test="${not empty LSP01}">
					<h2>${LSP02[0].tenLoaiSP}</h2>
				</c:if>
				<div class="product-card-grid">

					<c:forEach var="product" items="${LSP02}">
						<div class="product-card">
							<a
								href="ChiTietSanPhamServlet?id=${product.maSP}&type=${product.maLoaiSP}">
								<img
								src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
								alt="${product.tenSP}" />
								<h2>${product.tenSP}</h2>
								<p>${product.getPriceFormat()}</p>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>
</body>
</html>