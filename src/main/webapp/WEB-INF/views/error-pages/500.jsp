<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500</title>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<link rel="shortcut icon" href='<c:url value="/resources/images/favicon.ico" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/images/favicon.ico" />' type="image/x-icon">
<link rel="stylesheet"
	href='<c:url value="/resources/bootstrap-4.5.0-dist/css/bootstrap.min.css"></c:url>'>
<link rel="stylesheet" href="${ context }/resources/css/main.css">
<script src="${ context }/resources/js/jquery.min.js"></script>
<script src="${ context }/resources/js/popper.min.js"></script>
<script src="${ context }/resources/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${ context }/resources/fontawesome-free-5.15.3-web/css/all.css">
</head>
<body>
	<%@include file="/WEB-INF/views/navigationBar.jsp"%>
		
	<div class="text-center p-5" style="height: 300px;">
	<h3 class="mb-5" style="">500</h3>
		<h4 class="mb-5">Có lỗi đã xảy ra, có thể do kết nối mạng không ổn định!</h4>
		<a href="${ context }" class="btn btn-outline-danger ml-auto mr-auto">Quay lại trang chủ</a>
	</div>
	
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>