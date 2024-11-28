<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="profile-image">
				<img src="https://cdn-icons-png.flaticon.com/512/6858/6858504.png"
					alt="" /> <input type="file" class="custom-file-input"
					name="anhND" />
			</div>
			<div class="profile-form">
				<form action="DangKyServlet?action=register"
					class="profile-form-control" method="post"
					enctype="multipart/form-data">
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
									<option value="0">Nam</option>
									<option value="1">Nữ</option>
									<option value="2">Khác</option>
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
									<label for="">Tỉnh/Thành phố</label> <select name="tp" required
										id="provinces" onchange="getProvinces(event)">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group-country">
									<label for="">Quận/Huyện</label> <select name="huyen" required
										id="districts" onchange="getDistricts(event)">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group-country">
									<label for="">Xã/Phường</label> <select name="xa" required
										id="wards">
										<option value=""></option>
									</select>
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
				</form>
			</div>
		</div>
		<!-- Toast để thông bao  -->
		<div id="custom-toast-container"></div>
		<c:if test="${not empty msg}">
			<script>
		    showInformationToast('${msg}');
		     </script>
		</c:if>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/views/fragment/footer.jsp" />
</body>
<script>
    document.querySelector('.custom-file-input').addEventListener('change', function(e) {
        var fileInput = e.target;
        var file = fileInput.files[0];
        var fileName = file?.name || 'Chọn file...';
        
        // Cập nhật giá trị của label ngay sau phần tử có class là '.custom-file-input'
        fileInput.nextElementSibling.innerText = fileName;
        
     	// Cập nhật giá trị của input[type="hidden"]
        var hiddenInput = fileInput.parentElement.querySelector('input[type="hidden"]');
        hiddenInput.value = fileName; 

        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.querySelector('.border img').src = e.target.result;
            };
            reader.readAsDataURL(file); // Đọc file và gán kết quả base64 vào src ảnh
        }
    });
</script>
</html>