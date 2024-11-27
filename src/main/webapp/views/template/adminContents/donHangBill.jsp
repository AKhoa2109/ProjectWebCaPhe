<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %> 

<div class="container" style="margin-top: 20px">
	<!-- Đoạn cần in -->
	<div id="invoiceContentIn">	
	    <!-- Header -->
	    <div class="row invoice-header">
	        <div class="col-md-12"> 
	        	<div class="d-flex justify-content-between">
	        		<img src="<%=request.getContextPath()%>/views/assets/favicon/logo2.png" 
				         alt="Coffee Logo" 
				         class="img-fluid rounded-circle"/>
		            <img src="<%=request.getContextPath()%>/views/assets/images/qrcode_Cam_ket_an_toan.png" 
					         alt="Mã QR chứa thông tin cửa hàng" 
					         class="img-fluid"/>
	        	</div>
	        	
	            <h3>The Coffee House</h3>
	            <p>Địa chỉ: 01 Đ. Võ Văn Ngân, Linh Chiểu, Thủ Đức, Hồ Chí Minh</p>
	            <p>SĐT: 0972 228 083</p>
	        </div>
	    </div>
	
	    <!-- Invoice Info -->
	    <div class="row invoice-info">
	        <div class="col-md-6">
	            <p><strong>Mã hóa đơn:</strong> ${donHang.maDH}</p>
				<p><strong>Ngày mua:</strong> ${donHang.ngayMua}</p>
				<p><strong>Khu vực:</strong> ${donHang.tenKV}</p> 
	            <p><strong>Phương thức thanh toán:</strong> ${tenPTTT}</p>
	            <p><strong>Tình trạng:</strong> Đã thanh toán</p>
	        </div> 
	        <div class="col-md-6">
			    <p><strong>Tên khách hàng:</strong> ${nguoiDung.tenND}</p>
			    <p><strong>Giới tính:</strong> ${nguoiDung.gioiTinh}</p>
			    <p><strong>Năm sinh:</strong> ${nguoiDung.namSinh}</p>
			    <p><strong>Số điện thoại:</strong> ${nguoiDung.sdt}</p>
			    <p><strong>Email:</strong> ${nguoiDung.email}</p>
			</div>
	    </div>
	
	    <!-- Invoice Table -->
	    <table class="table table-bordered invoice-table">
		    <thead>
		        <tr>
		            <th>STT</th>
		            <th>Mã SP</th>
		            <th>Tên SP</th>
		            <th>Giá</th>
		            <th>Số lượng</th>
		            <th>Tổng tiền</th>
		        </tr>
		    </thead>
		    <tbody> 
		        <c:forEach var="cthd" items="${chiTietHoaDonList}" varStatus="status">
		            <tr>
		                <td>${status.index + 1}</td> <!-- STT tự động -->
		                <td>${cthd.maSP}</td> 
		                <td>${cthd.tenSP}</td>  
		                <td><fmt:formatNumber value="${cthd.gia}"/></td>  
		                <td>${cthd.soLuong}</td> 
		                <td><fmt:formatNumber value="${cthd.tongTien}"/></td>  
		            </tr>
		        </c:forEach>
		    </tbody>
		    <tfoot>
	       		<tr>
				    <td colspan="5" class="text-right">Cộng tiền sản phẩm</td>
				    <td><fmt:formatNumber value="${tongTienSanPham}" pattern="#,###" /></td>  
				</tr>
				<tr>
				    <td colspan="5" class="text-right">Phí vận chuyển</td>
				    <td><fmt:formatNumber value="${phiVanChuyen}" pattern="#,###" /></td>
				</tr>
				<tr>
				    <td colspan="5" class="text-right">Giảm</td>
				    <td><fmt:formatNumber value="${giam}" pattern="#,###" /></td>
				</tr>
				<tr>
				    <td colspan="5" class="text-right">Thành tiền</td>
				    <td><fmt:formatNumber value="${thanhTien}" pattern="#,###" /></td>
				</tr>
		    </tfoot>
		</table>
	</div>

  	<!-- Print and action buttons -->
	<div class="form-group d-flex justify-content-center mt-4">
	    <a href="javascript:printInvoice();" class="btn btn-success mx-2" style="width:120px;">In hóa đơn</a> 
	    <a href="<%=request.getContextPath()%>/NguoiDungServlet?action=edit&maND=${nguoiDung.maND}" class="btn btn-warning mx-2" style="width:220px;">Sửa thông tin khách hàng</a> 
	    <a href="<%=request.getContextPath()%>/DonHangServlet" class="btn btn-secondary mx-2" style="width:100px;">Hủy</a> 
	</div>
</div>

<script>
    function printInvoice() {
        var printContents = document.getElementById('invoiceContent').innerHTML;
        var originalContents = document.body.innerHTML;
        
        // Tạm thời thay thế nội dung body bằng chỉ phần in
        document.body.innerHTML = printContents;
        
        // In trang
        window.print();
        
        // Phục hồi lại nội dung ban đầu sau khi in xong
        document.body.innerHTML = originalContents;
    }
</script>
