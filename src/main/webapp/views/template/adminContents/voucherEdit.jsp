<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<script type="text/javascript" src="${pageContext.request.contextPath}/views/assets/js/validate/voucherValidate.js"></script>
    
        
<h3 class="text-center mb-3 mt-3">Chỉnh sửa Voucher</h3> 

<form action="VoucherServlet?action=update" method="post" name="formVoucher" onsubmit="return validateForm()">
    <!-- Giả sử bạn đã có các giá trị voucher trong các biến JSP (ví dụ: voucher.getMaVC()) -->
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="maVC">Mã Voucher</label>
            <input type="text" class="form-control" id="maVC" name="maVC" value="${voucher.maVC}" readonly />
        </div>
        <div class="form-group col-md-6">
            <label for="tenVC">Tên Voucher</label>
            <input type="text" class="form-control" id="tenVC" name="tenVC" value="${voucher.tenVC}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="giaTriVC">Giá trị Voucher</label>
        <input type="number" class="form-control" id="giaTriVC" name="giaTriVC" value="${voucher.giaTriVC}"/>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="soLuotSuDungToiDa">Số lượt sử dụng tối đa</label>
            <input type="number" class="form-control" id="soLuotSuDungToiDa" name="soLuotSuDungToiDa" value="${voucher.soLuotSuDungToiDa}"/>
        </div>
        <div class="form-group col-md-6">
            <label for="soLuotDaSuDung">Số lượt đã sử dụng</label>
            <input type="number" class="form-control" id="soLuotDaSuDung" name="soLuotDaSuDung" value="${voucher.soLuotDaSuDung}"/>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="ngayBatDau">Ngày bắt đầu</label>
            <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau" value="${voucher.ngayBatDau}"/>
        </div>
        <div class="form-group col-md-6">
            <label for="ngayKetThuc">Ngày kết thúc</label>
            <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc" value="${voucher.ngayKetThuc}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="trangThai">Trạng thái</label>
        <input type="text" class="form-control" id="trangThai" name="trangThai" value="${voucher.trangThai}"/>
    </div> 
    
    <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Cập nhật</button>
        <a href="<%=request.getContextPath()%>/VoucherServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
	</div>
</form>