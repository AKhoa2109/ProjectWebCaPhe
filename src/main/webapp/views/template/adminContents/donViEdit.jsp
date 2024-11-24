<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h3 class="mb-3 mt-3 text-center font-weight-bold">Chỉnh sửa đơn vị</h3>

<form action="DonViServlet?action=update" method="post">  
    <div class="form-group">
        <label for="maDV" class="font-weight-bold">Mã đơn vị</label>  
    	<input type="text" class="form-control" id="maDV" name="maDV" value="${donVi.maDV}" readonly>
    </div>

    <div class="form-group">
        <label for="tenDV">Tên đơn vị</label>
        <input type="text" class="form-control" id="tenDV" name="tenDV" value="${donVi.tenDV}">
    </div> 
    
    <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Cập nhật</button>
        <a href="<%=request.getContextPath()%>/DonViServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
	</div>
</form>