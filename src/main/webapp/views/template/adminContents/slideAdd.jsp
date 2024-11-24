<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<h3 class="text-center mb-4 font-weight-bold">Thêm mới Slide</h3>

<form action="SlideServlet?action=add" method="post" name="formSlideAdd" enctype="multipart/form-data" class="p-4 bg-light shadow rounded">
    
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="maSlide" class="font-weight-bold">Mã Slide</label>
            <input type="text" class="form-control" id="maSlide" name="maSlide" placeholder="Nhập mã slide" required />
        </div>
        <div class="form-group col-md-6">
            <label for="tenSlide" class="font-weight-bold">Tên Slide</label>
            <input type="text" class="form-control" id="tenSlide" name="tenSlide" placeholder="Nhập tên slide" required />
        </div>
    </div>

    <div class="form-group">
        <label for="picture" class="font-weight-bold">Hình Slide</label>
        <div class="custom-file">
            <input type="file" class="custom-file-input" id="picture" name="picture" required>
            <label class="custom-file-label" for="picture">Chọn ảnh</label>
        </div>

        <div class="border p-3 text-center mt-3 bg-white">
            <img src="https://via.placeholder.com/725x220" alt="Placeholder Image"
                 class="img-fluid img-thumbnail shadow-sm rounded"
                 style="width: 100%; max-width: 725px; height: auto; max-height: 220px;">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="viTri" class="font-weight-bold">Vị trí</label>
            <input type="number" class="form-control" id="viTri" name="viTri" placeholder="Nhập vị trí" required />
        </div>
        <div class="form-group col-md-6">
            <label for="trangThai" class="font-weight-bold">Trạng thái</label>
            <select class="form-control" id="trangThai" name="trangThai" required>
                <option value="Hiển thị">Hiển thị</option>
                <option value="Ẩn">Ẩn</option>
            </select>
        </div>
    </div>
    
    <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Thêm</button>
        <a href="<%=request.getContextPath()%>/SlideServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
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
            reader.readAsDataURL(file); // Đọc file và gán kết quả base64 vào src ảnh
        }
    });
</script>
