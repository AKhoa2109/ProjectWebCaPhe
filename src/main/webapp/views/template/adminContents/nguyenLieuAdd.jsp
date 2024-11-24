<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<h3 class="mb-4 text-center font-weight-bold">Thêm mới Nguyên Liệu</h3>

<form action="NguyenLieuServlet?action=add" method="post" class="p-4 bg-light shadow rounded">    

    <!-- Tên nguyên liệu -->
    <div class="form-group">
        <label for="tenNL" class="font-weight-bold">Tên Nguyên Liệu</label>
        <input type="text" class="form-control" id="tenNL" name="tenNL"/>
    </div>

    <!-- Số lượng tồn kho -->
    <div class="form-group">
        <label for="soLuongTonKho" class="font-weight-bold">Số Lượng Tồn Kho</label>
        <input type="number" class="form-control" id="soLuongTonKho" name="soLuongTonKho" min="0"/>
    </div>

    <!-- Đơn vị -->
    <div class="form-group">
        <label for="maDV" class="font-weight-bold">Đơn Vị</label>
        <select class="form-control" id="maDV" name="maDV" required>
            <c:forEach items="${donViList}" var="dv">
                <option value="${dv.maDV}">${dv.tenDV}</option>
            </c:forEach>
        </select>
    </div> 
    
    <div class="form-group d-flex justify-content-center"> 
        <button type="submit" class="btn btn-primary mr-2" style="width:100px">Thêm</button>
        <a href="<%=request.getContextPath()%>/NguyenLieuServlet" class="btn btn-secondary" style="width:100px">Hủy</a> 
    </div>
</form>
