<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/views/fragment/head.html"%>
<!-- toast.css và toast.js -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/styles/toast.css" />
<script src="<%=request.getContextPath()%>/views/assets/js/toast.js"></script>

<script src="<%=request.getContextPath()%>/views/assets/js/script.js"></script>
<title>Đăng kí</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/views/fragment/header.jsp" />

	<div class="profile-container">
		<h1>Đăng kí</h1>
		<hr />
		<div class="profile-container-feature">
			<div class="profile-form">
				<form action="DangKyServlet?action=register"
					class="profile-form-control" method="post"
					enctype="multipart/form-data" onclick="setTextValues()">
					<div class="profile-image">
						<img src="https://via.placeholder.com/150" alt="" /> 
						<input type="file" class="custom-file-input" id="anhND" name="anhND" />
					</div>
					<div class="profile-group-control">
						<div class="profile-form-group-account">
							<label for="">Thông tin tài khoản</label>
							<hr />
							<div class="profile-form-group">


								<div class="profile-form-user">
									<label for="">Tên đăng nhập</label>
									<div class="form-group-user">
										<i class="fa-solid fa-user"></i> <input type="text"
											placeholder="" name="tenDangNhap" required />
									</div>
								</div>
								<div class="profile-form-user">
									<label for="">Mật khẩu</label>
									<div class="form-group-user">
										<input type="password" placeholder="" name="matKhau" required />
									</div>
								</div>
								<div class="profile-form-user">
									<div class="profile-form-user">
										<label for="">Nhập lại mật khẩu</label>
										<div class="form-group-user">
											<input type="password" placeholder="" name="matKhauRetry"
												required />
										</div>
									</div>
								</div>
							</div>
						</div>
						<label for="">Thông tin cá nhân</label>
						<hr />
						<div class="profile-form-group">
							<div class="profile-form-user">
								<label for="">Họ và tên</label>
								<div class="form-group-user">
									<i class="fa-solid fa-user"></i> <input type="text"
										placeholder="" name="hoTen" required />
								</div>
							</div>
							<div class="profile-form-user">
								<label for="">Ngày sinh</label>
								<div class="form-group-user">
									<input type="date" name="ngay" required />
								</div>
							</div>
						</div>
						<div class="profile-form-group">
							<div class="profile-form-user">
								<label for="">Số điện thoại</label>
								<div class="form-group-user">
									<i class="fa-solid fa-phone"></i> <input type="text" name="sdt"
										required />
								</div>
							</div>
							<div class="profile-form-user">
								<label for="">Giới tính</label>
								<div class="form-group-user">
									<select name="gioiTinh" required id="">
										<option value="Nam">Nam</option>
										<option value="Nữ">Nữ</option>
										<option value="Khác">Khác</option>
									</select>
								</div>
							</div>
						</div>
						<div class="profile-form-group">
							<div class="profile-form-user">
								<label for="">Email</label>
								<div class="form-group-user">
									<i class="fa-solid fa-envelope"></i> <input type="email"
										name="email" required />
								</div>
							</div>
						</div>
						<div class="profile-form-group">
							<div class="profile-form-user">
								<label for="">Địa chỉ</label>
								<hr />
								<div class="form-group-address">
									<div class="form-group-country">
										<label for="">Tỉnh/Thành phố</label> <select name="tp"
											required id="provinces" onchange="getProvinces(event)">
											<option value=""></option>
										</select> <input type="hidden" name="provinceName" id="provinceName">
									</div>
									<div class="form-group-country">
										<label for="">Quận/Huyện</label> <select name="huyen" required
											id="districts" onchange="getDistricts(event)">
											<option value=""></option>
										</select> <input type="hidden" name="districtName" id="districtName">
									</div>
									<div class="form-group-country">
										<label for="">Xã/Phường</label> <select name="xa" required
											id="wards">
											<option value=""></option>
										</select> <input type="hidden" name="wardName" id="wardName">
									</div>
								</div>
								<div class="form-group-country number-house">
									<label for="">Số nhà,đường</label> <input type="text"
										name="soNha" required />
								</div>
							</div>
						</div>
						<div class="profile-button-control">
							<button type="submit">Lưu</button>
						</div>
					</div>

				</form>
			</div>
		</div>
		<!-- Toast để thông bao  -->
		<div id="custom-toast-container"></div>
		<c:if test="${not empty msg}">
			<script>
			showSuccessToast('${msg}');
		     </script>
		</c:if>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/views/fragment/footer.jsp" />
</body>
<script>
	function setTextValues() {
		document.getElementById("provinceName").value = document.getElementById("provinces").options[document.getElementById("provinces").selectedIndex].text;
		document.getElementById("districtName").value = document.getElementById("districts").options[document.getElementById("districts").selectedIndex].text;
		document.getElementById("wardName").value = document.getElementById("wards").options[document.getElementById("wards").selectedIndex].text;
	}
    document.querySelector('.custom-file-input').addEventListener('change', function(e) {
        var fileInput = e.target;
        var file = fileInput.files[0];
        var fileName = file?.name || 'Chọn file...';

        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.querySelector('.profile-image img').src = e.target.result;
            };
            reader.readAsDataURL(file);  
        }
    });
</script>
</html>