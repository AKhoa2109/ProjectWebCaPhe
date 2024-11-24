<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<h3 class="mb-3 mt-3 text-center font-weight-bold">Thêm mới loại sản phẩm</h3>

<form action="LoaiSanPhamServlet?action=add" method="post" enctype="multipart/form-data" class="p-4 bg-light shadow rounded">

    <!-- Tên loại sản phẩm -->
    <div class="form-group">
        <label for="tenLoaiSP" class="font-weight-bold">Tên loại sản phẩm</label>
        <input type="text" class="form-control" id="tenLoaiSP" name="tenLoaiSP" required />
    </div>

    <!-- Hình loại sản phẩm -->
    <div class="form-group">
        <label for="hinhLoaiSP" class="font-weight-bold">Hình loại sản phẩm</label>
        <div class="custom-file">
            <input type="file" class="custom-file-input" id="hinhLoaiSP" name="hinhLoaiSP" required />
            <label class="custom-file-label" for="hinhLoaiSP">Chọn hình ảnh</label>
        </div>
        <div class="border p-3 text-center mt-2">
            <img src="#" class="img-fluid rounded" style="max-width: 200px;" id="previewImage" />
        </div>
    </div>

    <div class="form-group d-flex justify-content-center">
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Thêm mới</button>
        <a href="<%=request.getContextPath()%>/LoaiSanPhamServlet" class="btn btn-secondary" style="width:100px">Hủy</a>
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
                document.querySelector('#previewImage').src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });
</script>
