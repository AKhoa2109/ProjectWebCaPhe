<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/views/fragment/head.html"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/styles/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/styles/chitietSP.css" />
<title>Chi tiết sản phẩm</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/views/fragment/header.jsp" />

	<div class="product-detail-container">
		<nav aria-label="breadcrumb">
			<ul class="breadcrumb">
				<li><a href="TrangChuServlet">Home</a></li>
				<li><a href="#">Products</a></li>
			</ul>
		</nav>
		<div class="product-container">
			<!-- Hình ảnh sản phẩm -->
			<div class="product-image main-image" id="mainImage">
				<img
					src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
					alt="Sữa phô mai tươi" />
				<div class="thumbnail-container">
					<img
						src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${product.anhSP}"
						alt="Thumbnail" class="thumbnail active"
						onclick="changeImage(this)" />
				</div>
			</div>

			<!-- Chi tiết sản phẩm -->
			<div class="product-details">
				<h1>${product.tenSP}</h1>
				<div class="product-price">${product.getPriceFormat()}</div>
				<p class="product-description">${product.moTaSP}</p>
				
				<!-- Thêm sản phẩm vào giỏ hàng -->
				<form action ="ChiTietSanPhamServlet" method="post">
					<!-- Thiếu mã người dùng -->
					<input type="hidden" name="maSP" value="${product.maSP}" />
					
					<!-- Thêm id và type -->
    				<input type="hidden" name="id" value="${param.id}" />
    				<input type="hidden" name="type" value="${param.type}" />
					
					<div class="quantity">
						<label for="soLuong">Số lượng:</label>
						<input type="number" id="soLuong" name="soLuong" value="1" min="1" />
					</div>
					
					<!-- Nút thêm vào giỏ hàng -->
					<button type="submit" class="add-to-cart">Thêm vào giỏ hàng</button>
				</form>			
			</div>
		</div>

		<!-- Sản phẩm liên quan -->
		<div class="related-products">
			<h2>Sản phẩm liên quan</h2>
			<div class="related-products-container">
				<c:forEach var="list" items="${listProduct}">
					<div class="related-product-item">
						<a href="ChiTietSanPhamServlet?id=${list.maSP}&type=${list.maLoaiSP}">
							<img
							src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${list.anhSP}"
							alt="${list.tenSP}" />
							<h3>${list.tenSP}</h3>
							<div class="price">${list.getPriceFormat()}</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
      // Đổi hình ảnh chính khi bấm vào hình nhỏ
      function changeImage(thumbnail) {
        // Thay đổi ảnh chính
        document.getElementById("mainImage").src = thumbnail.src;

        // Xóa lớp "active" khỏi tất cả hình nhỏ
        const thumbnails = document.querySelectorAll(".thumbnail");
        thumbnails.forEach((thumb) => thumb.classList.remove("active"));

        // Thêm lớp "active" vào hình được chọn
        thumbnail.classList.add("active");
      }
    </script>
</body>
</html>