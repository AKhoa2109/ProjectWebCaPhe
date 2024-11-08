<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/fragment/head.html"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- Thêm liên kết đến tệp CSS của Bootstrap từ CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >  
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/styles/toast.css"/>
	<script src="<%=request.getContextPath()%>/views/assets/js/toast.js"></script> 
	
	<style> 	
		#drawer {
		  width: 250px;  /*dù là col col (width bằng nhau), nhưng do css ghi đè nên "width của content = width của screen - width của drawer"" */
		  height: 100vh;   
		  background-color: #f8f9fa;
		  position: fixed;
		  left: 0; /* Ban đầu drawer sẽ hiện ra */
		  transition: left 0.3s ease;
		}
		 
		#drawer.hide {
		  left: -250px;  
		}
		
		
		#content {
		  margin-left: 250px; /* Đảm bảo nội dung chính không bị che khuất bởi drawer */
		  transition: margin-left 0.3s ease;
		}
		
		#content.shifted {
		  margin-left: 0; /* Khi drawer hiện, đẩy nội dung chính sang trái */
		  }
		  
	</style>
</head>
<body> 
	<!-- Header -->
	<jsp:include page="/views/fragment/header.html" />
	
	
	<!-- Toast để thông bao  -->
	<div id="custom-toast-container" style="margin-top:100px;"></div>
 
	
	<!-- Content -->
	<div class="container-fluid" style = "margin-top:81px;">
		<div class="row">
			<!-- Drawer (Menu bên trái) -->
			<div id="drawer" class="col">
				<ul class="list-group">
					<li class="list-group-item"><a href="#">Voucher</a></li>
					<li class="list-group-item"><a href="#">Sản phẩm</a></li>
					<li class="list-group-item"><a href="#">Loại sản phẩm</a></li>
				</ul>
			</div> 
			
			
			<!-- Content (Nội dung chính) -->
			<div id="content" class="col">   
			
				<button class="btn mt-1 mb-3" id="toggleDrawerBtn">
					<i class="fa-solid fa-bars" style="font-size: 24px;"></i>
				</button>
				
				<p>Thông báo: ${msg}</p> 
				
			  	<%-- <div onclick="showInformationToast('${msg}');" class="custom-btn custom-btn--success">Show Information toast</div>  --%>
 					
				<!-- Hiển thị thông báo toast -->
                <c:if test="${not empty msg}">
                    <script>
                        showInformationToast('${msg}');
                    </script>
                </c:if>
				   
				<div id="content-page">
					<c:if test="${!(empty param.page)}"> 
					
						<jsp:include page="adminContents/${param.page}.jsp"></jsp:include>    
						 
					</c:if>  
				</div> 
				
			</div>
			
		</div>
	</div>

	  
	  
	 <!-- Thêm các tệp JavaScript của Bootstrap từ CDN -->
 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

	<!-- JavaScript để xử lý mở/đóng drawer -->
	<script>
		// Lấy reference đến các phần tử
		const toggleDrawerBtn = document.getElementById("toggleDrawerBtn");
		const drawer = document.getElementById("drawer");
		const content = document.getElementById("content");
	
		// Lắng nghe sự kiện click vào nút để mở/đóng drawer
		toggleDrawerBtn.addEventListener("click", function() {
		    // Thêm hoặc bỏ class 'hide' để điều khiển việc ẩn/hiện của drawer
		    drawer.classList.toggle("hide");
		    content.classList.toggle("shifted"); // Đẩy nội dung chính sang trái khi drawer ẩn
		}); 
	</script>
	 
	
</body>
</html>
