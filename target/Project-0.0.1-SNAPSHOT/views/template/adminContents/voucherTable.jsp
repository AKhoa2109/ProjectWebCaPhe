<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
  
  
 
<h4 class="mb-3">Quản lý voucher</h4> 


<div class="d-flex align-items-center justify-content-between">
	<p><a href="views/template/admin.jsp?page=voucherAdd" class="btn btn-primary rounded">Thêm mới</a></p>

  
	<form class="input-group" method="get" style="width: 320px;">
	 	<input type="hidden" name="action" value="search" />
	 	
	    <input type="text" class="form-control rounded" placeholder="Tìm tên voucher" name="txtTimTenVoucher"/> 
        <input class="btn btn-primary ml-2 rounded" type="submit" value="Tìm kiếm"> 
	</form>
	  
</div>  


<table class="table table-bordered table-custom">
	<tr>
		<th>Mã số</th>
		<th>Tên voucher</th>
		<th>Giá trị</th>
		<th>Số lượt sử dụng tối đa</th>
		<th>Số lượt đã sử dụng</th>
		<th>Ngày bắt đầu</th>
		<th>Ngày kết thúc</th>
		<th>Tình trạng</th>
		<th></th>
	</tr>

	<!-- Lặp qua danh sách voucher -->
	<c:forEach items="${vouchers}" var="v">
		<tr>
			<td>${v.maVC}</td> <!-- Mã voucher -->
			<td>${v.tenVC}</td> <!-- Tên voucher -->
			<td>${v.giaTriVC}</td> <!-- Giá trị voucher -->
			<td>${v.soLuotSuDungToiDa}</td> <!-- Số lượt sử dụng tối đa -->
			<td>${v.soLuotDaSuDung}</td> <!-- Số lượt đã sử dụng -->
			<td><f:formatDate value="${v.ngayBatDau}" pattern="dd/MM/yyyy"/>${v.ngayBatDau}</td> <!-- Ngày bắt đầu -->
			<td><f:formatDate value="${v.ngayKetThuc}" pattern="dd/MM/yyyy"/>${v.ngayKetThuc	}</td> <!-- Ngày kết thúc -->
			<td>${v.trangThai}</td> <!-- Tình trạng voucher -->
			<td>
				<div class="btn-group">
					<!-- Các nút hành động cho mỗi voucher -->
					<a href="${pageContext.request.contextPath}/VoucherServlet?action=edit&maVC=${v.maVC}" class="btn btn-info mr-2">Sửa</a>
					<a href="${pageContext.request.contextPath}/VoucherServlet?action=delete&maVC=${v.maVC}" class="btn btn-danger mr-2" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
				</div>
			</td>
		</tr>
	</c:forEach>
</table>

