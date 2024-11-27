<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
  
  
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %>
     

<!-- <img class="container-fluid" src="https://cdn.pixabay.com/photo/2022/12/12/12/58/dog-7651002_1280.jpg"> -->
<div class="container my-4">
    <!-- Header cards -->
    <div class="row text-white">
	    <div class="col-md-4">
	        <div class="dashboard-card bg-primary d-flex align-items-center">
	            <i class="fas fa-chart-line fa-3x mr-4"></i>
	            <div class="text-left">
	                <h4>Tổng doanh thu</h4>
	                <h2>65,000 VND</h2>
	            </div>
	        </div>
	    </div>
	    <div class="col-md-4">
	        <div class="dashboard-card bg-success d-flex align-items-center">
	            <i class="fas fa-box-open fa-3x mr-4"></i>
	            <div class="text-left">
	                <h4>Đã bán được</h4>
	                <h2>3 Sản phẩm</h2>
	            </div>
	        </div>
	    </div>
	    <div class="col-md-4">
	        <div class="dashboard-card bg-info d-flex align-items-center">
	            <i class="fas fa-users fa-3x mr-4"></i>
	            <div class="text-left">
	                <h4>Tổng khách hàng</h4>
	                <h2>19 Người</h2>
	            </div>
	        </div>
	    </div>
	</div>


    <!-- Charts Section -->
    <div class="row mt-4">
        <div class="col-md-8">
            <div class="chart-container">
                <h5>Số lượng bán được trên từng sản phẩm</h5>
                <canvas id="revenueByProductChart"></canvas>
            </div>
        </div>
        <div class="col-md-4">
            <div class="chart-container">
                <h5>Tỷ lệ % doanh thu theo sản phẩm</h5>
                <canvas id="salesRatioChart"></canvas>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-8">
            <div class="chart-container">
                <h5>Doanh thu theo thời gian</h5>
                <canvas id="productSoldChart"></canvas>
            </div>
        </div>
        <div class="col-md-4">
            <div class="chart-container">
                <h5>Lọc dữ liệu</h5>
                <form>
                    <div class="form-group">
                        <label for="startDate">Từ Ngày</label>
                        <input type="date" id="startDate" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="endDate">Đến Ngày</label>
                        <input type="date" id="endDate" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Tìm Thống Kê</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Dummy data for the charts
    const ctx1 = document.getElementById('revenueByProductChart').getContext('2d');
    const ctx2 = document.getElementById('salesRatioChart').getContext('2d');
    const ctx3 = document.getElementById('productSoldChart').getContext('2d');

    // Revenue by Product Chart (Bar Chart) - Số lượng sản phẩm đã bán
    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: ['Sản phẩm A', 'Sản phẩm B', 'Sản phẩm C'], // Các sản phẩm
            datasets: [{
                label: 'Số lượng đã bán', // Tiêu đề của biểu đồ
                data: [100, 150, 75], // Số lượng sản phẩm bán được
                backgroundColor: ['#007bff', '#28a745', '#dc3545'], // Màu sắc cho mỗi cột
                borderColor: ['#0056b3', '#1c7430', '#b02a2a'], // Màu viền cho mỗi cột
                borderWidth: 1 // Độ dày viền
            }]
        },
        options: {
            responsive: true, // Biểu đồ sẽ phản hồi lại khi thay đổi kích thước
            scales: {
                y: {
                    beginAtZero: true // Bắt đầu trục y từ 0
                }
            }
        }
    });

    // Sales Ratio Pie Chart (Pie Chart) - Doanh thu của từng sản phẩm
    new Chart(ctx2, {
        type: 'pie',
        data: {
            labels: ['Sản phẩm A', 'Sản phẩm B', 'Sản phẩm C'], // Các sản phẩm
            datasets: [{
                data: [20000000, 10000000, 5000000], // Doanh thu từ mỗi sản phẩm
                backgroundColor: ['#007bff', '#28a745', '#dc3545'], // Màu sắc cho mỗi phần
                borderColor: ['#0056b3', '#1c7430', '#b02a2a'], // Màu viền cho mỗi phần
                borderWidth: 1 // Độ dày viền
            }]
        },
        options: {
            responsive: true // Biểu đồ sẽ phản hồi lại khi thay đổi kích thước
        }
    });

    // Product Sold Over Time Chart (Line Chart) - Doanh thu theo thời gian
    new Chart(ctx3, {
        type: 'line',
        data: {
            labels: ['10-11-2021', '11-11-2021', '12-11-2021', '13-11-2021'], // Ngày bán hàng
            datasets: [{
                label: 'Doanh thu (VND)', // Tiêu đề của biểu đồ
                data: [2000000, 1850000, 3000000, 2800000], // Doanh thu theo từng ngày
                backgroundColor: '#17a2b8', // Màu nền cho đường
                borderColor: '#17a2b8', // Màu viền cho đường
                fill: false, // Không tô màu dưới đường
                tension: 0.1 // Độ cong của đường
            }]
        },
        options: {
            responsive: true, // Biểu đồ sẽ phản hồi lại khi thay đổi kích thước
            scales: {
                y: {
                    beginAtZero: true // Bắt đầu trục y từ 0
                }
            }
        }
    });
</script>

 