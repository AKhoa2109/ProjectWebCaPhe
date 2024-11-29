<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/views/fragment/head.html"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/styles/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/styles/chitietHD.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <jsp:include page="/views/fragment/header.jsp" />

    <!-- Form cho combobox "Khu vực", gửi dữ liệu tới HoaDonServlet khi thay đổi -->
    <form action="HoaDonServlet" method="POST">
        <div class="bill-container">
            <h1>Xác nhận đơn hàng</h1>
            <div class="content-wrapper">
                <div class="address-container">
                    <div class="section">
                        <h2><i class="fas fa-map-marker-alt"></i> Giao hàng</h2>
                        <div class="input-group">
                            <label>Khu vực</label>
                            <select name="khuVuc" onchange="this.form.submit()">
                                <c:forEach var="kv" items="${dSKhuVuc}">
                                    <option value="${kv.maKV}" <c:if test="${kv.maKV == sessionScope.maKV}">selected</c:if>>${kv.tenKV}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="section">
			           <h2><i class="fas fa-credit-card"></i> Phương thức thanh toán</h2>
			           <div class="payment-method">
			               <select name="maPTTT" onchange="this.form.submit()">
			                   <c:forEach var="pT" items="${dSPTTT}">
			                       <option value="${pT.maPTTT}" <c:if test="${pT.maPTTT == sessionScope.maPTTT}">selected</c:if>>${pT.tenPTTT}</option>
			                   </c:forEach>
			               </select>
			           </div>
			       </div>
                </div>               
            </div>
        </div>       
    </form>

    <!-- Form chính cho việc đặt hàng, gửi dữ liệu tới ThanhToanServlet khi nhấn nút "Đặt hàng" -->
    <form action="ThanhToanServlet" method="POST">
        <div class="bill-container">
            <div class="content-wrapper">
                <div class="address-container">
                    <div class="section">
                        <h2><i class="fas fa-map-marker-alt"></i> Giao hàng</h2>
                        <!-- Các trường thông tin giao hàng khác -->
                        <div class="input-group">
                            <label>Địa chỉ chi tiết</label>
                            <input type="text" placeholder="Nhập địa chỉ chi tiết">
                        </div>
                        <div class="input-group">
                            <label>Tên</label>
                            <input type="text" value="Anh Khoa Dev Tool">
                        </div>
                        <div class="input-group">
                            <label>Số điện thoại</label>
                            <input type="text" value="0326433123">
                        </div>
                    </div>                              
                </div>

                <div class="order-container">
                    <div class="section-title"><i class="fas fa-utensils"></i> Các món đã chọn</div>
                    <c:forEach var="item" items="${cart}">
                        <div class="order-item">
                            <div>
                                <p>${item.soLuong} x ${item.tenSP}</p>
                                <p>Giá 1 Sản Phẩm: <fmt:formatNumber value="${item.giaSP}" type="number" pattern="#,##0" />đ</p>
                                <p class="remove-item"><a href="HoaDonServlet?maSP=${item.maSP}&action=delete">Xóa</a></p>
                            </div>
                            <p><fmt:formatNumber value="${item.giaSP*item.soLuong}" type="number" pattern="#,##0" />đ</p>
                        </div>
                    </c:forEach>
                    
                    <div class="add-item">
                        <a href="<%=request.getContextPath()%>/DanhMucSanPham"><i class="fas fa-plus-circle"></i> Thêm món</a>
                    </div>
                    <div class="section-title"><i class="fas fa-receipt"></i> Tổng cộng</div>
                    <div class="order-summary">
                        <div class="order-total">
                            <p>Thành tiền</p>                           
                            <p><fmt:formatNumber value="${thanhTien}" type="number" pattern="#,##0" />đ</p>
                        </div>
                        <div class="order-total">
                            <p>Phí giao hàng</p>
                            <p><fmt:formatNumber value="${sessionScope.kvPhi}" type="number" pattern="#,##0" />đ</p>
                        </div>
                        <div class="order-total">
                            <p>Bạn có mã giảm giá trong mục Ưu đãi</p>
                            <p>0</p>
                        </div>
                        <hr>
                        <div class="order-total">
					        <p>Tổng tiền</p>
					        <input type="hidden" name="thanhTien" value="${thanhTien + sessionScope.kvPhi}" />
					        <p><fmt:formatNumber value="${thanhTien + sessionScope.kvPhi}" type="number" pattern="#,##0" />đ</p>
					    </div>
                    </div>
                    <div class="place-order">
                        <button><i class="fas fa-shopping-cart"></i> Đặt hàng</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>