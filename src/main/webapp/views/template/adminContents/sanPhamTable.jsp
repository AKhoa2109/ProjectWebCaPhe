<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %>
  
 
<h3 class="mb-3 mt-3 text-center font-weight-bold">Quản lý sản phẩm</h3> 


<div class="d-flex align-items-center justify-content-between">
    <p>
        <a href="views/template/admin.jsp?page=voucherAdd" class="btn btn-primary rounded">
            <i class="fas fa-plus-circle"></i> Thêm mới
        </a>
    </p>

    <form class="input-group" method="get" style="width: auto;">  
	    <input type="hidden" name="action" value="search" />
	    <div class="position-relative">
	        <i class="fa fa-search position-absolute" style="top: 50%; left: 10px; transform: translateY(-50%);" ></i>  
	        <input type="text" class="form-control rounded" style="padding-left:40px" placeholder="Tìm tên sản phẩm" name="txtTimTenSanPham"/>
	    </div>
	    <input class="btn btn-primary ml-2 rounded" type="submit" value="Tìm kiếm"> 
	</form>
</div>  

<table class="table table-bordered table-hover table-striped">
	<thead>
		<!--  //public SanPham(String maSP, String tenSP, float giaSP, String anhSP, String maLoaiSP, String moTaSP, String tenLoaiSP) -->
	    <tr style="background-color: #edf3f9; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);">
	        <th>Mã số</th>
	        <th>Hình ảnh</th>
	        <th>Tên sản phẩm</th>
	        <th>Giá</th>
	        <th>Loại</th>
	        <th>Mô tả</th> 
         	<th>Chức năng</th> 
	    </tr>
	</thead>
	
	<tbody> 
		 
	    <c:forEach items="${sanPhamList}" var="sp">
	        <tr>
	            <td>${sp.maSP}</td> 
	            <td><img src="<%=request.getContextPath()%>/views/assets/images/HinhSanPham/${sp.anhSP}" class="img-fluid rounded" style="width:150px; height: auto;"></td>  
	            <td>${sp.tenSP}</td>  
	            <td>${sp.giaSP}</td>  
	            <td>${sp.tenLoaiSP}</td>  
	            <td>${sp.moTaSP}</td>   
	              
			    <td>
				    <div class="btn-group d-flex justify-content-center"> 
				        <a href="${pageContext.request.contextPath}/SanPhamServlet?action=edit&maSP=${sp.maSP}" class="text-info mr-3" style="font-size: 20px;">
				            <i class="fas fa-edit"></i>
				        </a> 
				        <a href="${pageContext.request.contextPath}/SanPhamServlet?action=delete&maSP=${sp.maSP}" class="text-danger mr-3" onclick="return confirm('Bạn có chắc muốn xóa?');" style="font-size: 20px;">
				            <i class="fas fa-trash-alt"></i>
				        </a>
				    </div>
				</td> 
	        </tr>
	    </c:forEach>
	</tbody> 
</table>