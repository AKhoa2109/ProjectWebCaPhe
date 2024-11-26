<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<h3 class="text-center mb-4">Chỉnh sửa Voucher</h3>
<!-- Form chỉnh sửa Voucher -->
<form action="VoucherServlet?action=update" method="post">
    <!-- Giả sử bạn đã có các giá trị voucher trong các biến JSP (ví dụ: voucher.getMaVC()) -->
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="maVC">Mã Voucher</label>
            <input type="text" class="form-control" id="maVC" name="maVC" value="${voucher.maVC}" readonly />
        </div>
        <div class="form-group col-md-6">
            <label for="tenVC">Tên Voucher</label>
            <input type="text" class="form-control" id="tenVC" name="tenVC" value="${voucher.tenVC}" required />
        </div>
    </div>
    <div class="form-group">
        <label for="giaTriVC">Giá trị Voucher</label>
        <input type="number" class="form-control" id="giaTriVC" name="giaTriVC" value="${voucher.giaTriVC}" required />
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="soLuotSuDungToiDa">Số lượt sử dụng tối đa</label>
            <input type="number" class="form-control" id="soLuotSuDungToiDa" name="soLuotSuDungToiDa" value="${voucher.soLuotSuDungToiDa}" required />
        </div>
        <div class="form-group col-md-6">
            <label for="soLuotDaSuDung">Số lượt đã sử dụng</label>
            <input type="number" class="form-control" id="soLuotDaSuDung" name="soLuotDaSuDung" value="${voucher.soLuotDaSuDung}" required />
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="ngayBatDau">Ngày bắt đầu</label>
            <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau" value="${voucher.ngayBatDau}" required />
        </div>
        <div class="form-group col-md-6">
            <label for="ngayKetThuc">Ngày kết thúc</label>
            <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc" value="${voucher.ngayKetThuc}" required />
        </div>
    </div>
    <div class="form-group">
        <label for="trangThai">Trạng thái</label>
        <input type="text" class="form-control" id="trangThai" name="trangThai" value="${voucher.trangThai}" required />
    </div>
    
    <div class="form-group text-center mt-4">
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </div>
</form>