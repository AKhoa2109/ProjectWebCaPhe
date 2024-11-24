<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<h3 class="mb-4 mt-4 text-center font-weight-bold">Thêm mới sản phẩm</h3>

<form action="SanPhamServlet?action=add" method="post" enctype="multipart/form-data" class="p-4 bg-light rounded shadow">
    <!-- Row 1: Hình ảnh sản phẩm và thông tin sản phẩm -->
    <div class="form-group row">
        <!-- Cột 1: Hình ảnh sản phẩm --> 
        <div class="col-md-4">
            <div class="form-group">
                <label for="anhSP" class="font-weight-bold mb-2">Hình ảnh sản phẩm</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="anhSP" name="anhSP" required>
                    <label class="custom-file-label" for="anhSP">Chọn hình ảnh</label>
                </div>
            </div>
            <div class="border p-3 text-center mt-2">
                <img src="https://via.placeholder.com/200x200" alt="Ảnh sản phẩm" 
                     class="img-fluid img-thumbnail" 
                     style="max-width: 200px; height: auto;">
            </div>
        </div>

        <!-- Cột 2: Các trường thông tin sản phẩm -->
        <div class="col-md-8"> 
            <!-- Mã sản phẩm -->
            <div class="form-group">
                <label for="maSP" class="font-weight-bold">Mã sản phẩm</label>
                <input type="text" class="form-control" id="maSP" name="maSP" placeholder="Nhập mã sản phẩm" required>
            </div>

            <!-- Tên sản phẩm -->
            <div class="form-group">
                <label for="tenSP" class="font-weight-bold">Tên sản phẩm</label>
                <input type="text" class="form-control" id="tenSP" name="tenSP" placeholder="Nhập tên sản phẩm" required>
            </div>

            <!-- Giá sản phẩm -->
            <div class="form-group">
                <label for="giaSP" class="font-weight-bold">Giá sản phẩm</label>
                <div class="input-group">
                    <input type="number" class="form-control" id="giaSP" name="giaSP" placeholder="Nhập giá sản phẩm" min="0" step="1000" required>
                    <div class="input-group-append">
                        <span class="input-group-text">VNĐ</span>
                    </div>
                </div>
            </div>
            
            <!-- Loại sản phẩm -->
            <div class="form-group">
                <label for="maLoaiSP" class="font-weight-bold">Loại sản phẩm</label>
                <select class="form-control" id="maLoaiSP" name="maLoaiSP" required>
                    <c:forEach items="${loaiSPList}" var="loaiSP">
                        <option value="${loaiSP.maLoaiSP}">${loaiSP.tenLoaiSP}</option>
                    </c:forEach>
                </select>
            </div> 
        </div>
    </div>

    <!-- Row 2: Mô tả sản phẩm -->
    <div class="form-group row">
        <div class="col-sm-12">
            <label for="moTaSP" class="font-weight-bold">Mô tả sản phẩm</label>
            <textarea class="form-control" id="moTaSP" name="moTaSP" rows="4" placeholder="Mô tả sản phẩm" required></textarea>
        </div>
    </div>

    <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Thêm</button>
        <a href="<%=request.getContextPath()%>/SanPhamServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
    </div>
</form>

<!-- CKEditor -->
<script>
    CKEDITOR.replace('moTaSP');
</script>

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
