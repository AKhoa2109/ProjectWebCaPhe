<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<h3 class="mb-4 text-center font-weight-bold">Thêm Mới Người Dùng</h3>

<form action="NguoiDungServlet?action=add" method="post" enctype="multipart/form-data" class="p-4 bg-light shadow rounded">

    <!-- Row 1: Hình ảnh và thông tin người dùng -->
    <div class="form-group row">
        
        <!-- Cột 1: Hình ảnh -->
        <div class="col-md-3">
            <label for="anhND" class="font-weight-bold">Hình Ảnh</label>
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="anhND" name="anhND">
                <label class="custom-file-label" for="anhND">Chọn hình ảnh</label>
            </div>
            <div class="border p-3 text-center mt-3">
                <img src="https://via.placeholder.com/150" 
                     alt="Hình người dùng" 
                     class="img-fluid img-thumbnail rounded"
                     style="width: 150px; height: auto;">
            </div>
        </div>

        <!-- Cột 2: Các trường thông tin người dùng -->
        <div class="col-md-9">
            <!-- Họ và tên -->
            <div class="form-group">
                <label for="tenND" class="font-weight-bold">Họ và Tên</label>
                <input type="text" class="form-control" id="tenND" name="tenND" placeholder="Nhập họ và tên" required />
            </div>
            
            <!-- Giới tính -->
            <div class="form-group">
                <label for="gioiTinh" class="font-weight-bold">Giới Tính</label>
                <select class="form-control" id="gioiTinh" name="gioiTinh">
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                </select>
            </div>

            <!-- Năm sinh -->
            <div class="form-group">
                <label for="namSinh" class="font-weight-bold">Năm Sinh</label>
                <input type="number" class="form-control" id="namSinh" name="namSinh" placeholder="Nhập năm sinh" required />
            </div>
        </div>
    </div>
 

    <!-- Số điện thoại -->
    <div class="form-group">
        <label for="sdt" class="font-weight-bold">Số Điện Thoại</label>
        <input type="text" class="form-control" id="sdt" name="sdt" placeholder="Nhập số điện thoại" required />
    </div>

    <!-- Email -->
    <div class="form-group">
        <label for="email" class="font-weight-bold">Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email" required />
    </div>

    <!-- Địa chỉ -->
    <div class="form-group">
        <label for="diaChi" class="font-weight-bold">Địa Chỉ</label>
        <textarea class="form-control" id="diaChi" name="diaChi" rows="3" placeholder="Nhập địa chỉ" required></textarea>
    </div>
 
    <!-- Vai trò -->
    <div class="form-group">
        <label for="vaiTro" class="font-weight-bold">Vai Trò</label>
        <select class="form-control" id="vaiTro" name="vaiTro">
            <option value="Admin">Admin</option>
            <option value="User">User</option>
        </select>
    </div>

    <!-- Tên đăng nhập -->
    <div class="form-group">
        <label for="tenDangNhap" class="font-weight-bold">Tên Đăng Nhập</label>
        <input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap" placeholder="Nhập tên đăng nhập" required />
    </div>

    <!-- Mật khẩu -->
    <div class="form-group">
        <label for="matKhau" class="font-weight-bold">Mật Khẩu</label>
        <input type="password" class="form-control" id="matKhau" name="matKhau" placeholder="Nhập mật khẩu" required />
    </div>
 
    <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Thêm</button>
        <a href="${pageContext.request.contextPath}/NguoiDungServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
    </div>
</form>

<script>
    document.querySelector('.custom-file-input').addEventListener('change', function(e) {
        var fileInput = e.target;
        var file = fileInput.files[0];
        var fileName = file?.name || 'Chọn file...';
        fileInput.nextElementSibling.innerText = fileName;

        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.querySelector('.border img').src = e.target.result;
            };
            reader.readAsDataURL(file);  
        }
    });
</script>
