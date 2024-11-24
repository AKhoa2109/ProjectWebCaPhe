<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

 <script type="text/javascript" src="${pageContext.request.contextPath}/views/assets/js/validate/voucherValidate.js"></script>
 
 
 <h3 class="text-center mb-3 mt-3">Thêm mới Voucher</h3>
 <form action="${pageContext.request.contextPath}/VoucherServlet?action=insert" method="post" name="formVoucher" onsubmit="return validateForm()"> 
     
     <div class="form-group">
         <label for="tenVC">Tên Voucher</label>
         <input type="text" class="form-control" id="tenVC" name="tenVC"/>
     </div> 
     <div class="form-group">
         <label for="giaTriVC">Giá trị Voucher</label>
         <input type="number" class="form-control" id="giaTriVC" name="giaTriVC" value="0"/>
     </div>
     <div class="form-row">
         <div class="form-group col-md-6">
             <label for="soLuotSuDungToiDa">Số lượt sử dụng tối đa</label>
             <input type="number" class="form-control" id="soLuotSuDungToiDa" name="soLuotSuDungToiDa" value="0"/>
         </div>
         <div class="form-group col-md-6">
             <label for="soLuotDaSuDung">Số lượt đã sử dụng</label>
             <input type="number" class="form-control" id="soLuotDaSuDung" name="soLuotDaSuDung" value="0"/>
         </div>
     </div>
     <div class="form-row">
         <div class="form-group col-md-6">
             <label for="ngayBatDau">Ngày bắt đầu</label>
             <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau"/>
         </div>
         <div class="form-group col-md-6">
             <label for="ngayKetThuc">Ngày kết thúc</label>
             <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc"/>
         </div>
     </div> 
     
     <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Lưu</button>
        <a href="<%=request.getContextPath()%>/VoucherServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
	</div>
 </form>
 
 
