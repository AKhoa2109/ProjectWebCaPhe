<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/fragment/head.html"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/styles/profile.css" />
<title>Thông tin cá nhân</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/views/fragment/header.html" />
	<div class="profile-container">
		<hr />
		<h1>Thông tin cá nhân</h1>
		<hr />
		<div class="profile-container-feature">
			<div class="profile-image">
				<img src="https://cdn-icons-png.flaticon.com/512/6858/6858504.png"
					alt="" /> <input type="file" />
			</div>
			<div class="profile-form">
				<form action="" class="profile-form-control">
					<div class="profile-form-group">
						<div class="profile-form-user">
							<label for="">Họ và tên</label>
							<div class="form-group-user">
								<i class="fa-solid fa-user"></i> <input type="text"
									placeholder="" />
							</div>
						</div>
						<div class="profile-form-user">
							<label for="">Ngày sinh</label>
							<div class="form-group-user">
								<input type="date" />
							</div>
						</div>
					</div>
					<div class="profile-form-group">
						<div class="profile-form-user">
							<label for="">Số điện thoại</label>
							<div class="form-group-user">
								<i class="fa-solid fa-phone"></i> <input type="text" />
							</div>
						</div>
						<div class="profile-form-user">
							<label for="">Giới tính</label>
							<div class="form-group-user">
								<select name="" id="">
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
								<i class="fa-solid fa-envelope"></i> <input type="email" />
							</div>
						</div>
					</div>
					<div class="profile-form-group">
						<div class="profile-form-user">
							<label for="">Địa chỉ</label>
							<div class="form-group-address">
								<div class="form-group-country">
									<label for="">Tỉnh/Thành phố</label> <select name=""
										id="provinces" onchange="getProvinces(event)">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group-country">
									<label for="">Quận/Huyện</label> <select name="" id="districts"
										onchange="getDistricts(event)">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group-country">
									<label for="">Xã/Phường</label> <select name="" id="wards">
										<option value=""></option>
									</select>
								</div>
							</div>
							<div class="form-group-country number-house">
								<label for="">Số nhà,đường</label> <input type="text" />
							</div>
						</div>
					</div>
					<div class="profile-button-control">
						<button>Lưu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="/views/fragment/footer.html" />
</body>
</html>