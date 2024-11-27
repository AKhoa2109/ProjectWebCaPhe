<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"  %>

<!DOCTYPE html>
<html>
<head> 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/styles/toast.css"/> <!-- toast.css và toast.js -->
	<script src="<%=request.getContextPath()%>/views/assets/js/toast.js"></script> 
</head>
<body>
	<!-- Toast để thông bao  --> 
	<div id="custom-toast-container"></div> 
    <c:if test="${not empty msg}">  
        <script>
            showInformationToast('${msg}');
        </script>
    </c:if>
</body>
</html>