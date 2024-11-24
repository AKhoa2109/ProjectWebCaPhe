<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<h3 class="mb-3 mt-3 text-center font-weight-bold">Chỉnh sửa khu vực vận chuyển</h3>

<form action="KhuVucServlet?action=update" method="post"> 
    
    <div class="form-group">
        <label for="maKV" class="font-weight-bold">Mã khu vực</label>  
    	<input type="text" class="form-control" id="maKV" name="maKV" value="${khuVuc.maKV}" readonly>
    </div> 

    <div class="form-group">
        <label for="tenKV">Tên khu vực</label>
        <input type="text" class="form-control" id="tenKV" name="tenKV" value="${khuVuc.tenKV}">
    </div>

    <div class="form-group">
        <label for="phiVanChuyen">Phí vận chuyển</label>
        <div class="input-group">
	        <input type="number" class="form-control" id="phiVanChuyen" name="phiVanChuyen" value="${khuVuc.phiVanChuyen}" min=0 step=1000>
	        <div class="input-group-append">
	            <span class="input-group-text">VNĐ</span>
	        </div>
	     </div>
    </div>

    <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/KhuVucServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
	</div>
</form>