<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN" scope="session"/>

<div class="product col-6 col-sm-3 p-1">
	<div class="border p-2">
		<a class="product-image" href="<c:url value='/san-pham/${product._id}'/>"> <img
			src="data:image/png;base64,${product.images[0] }"
			style="width: 100%;">
		</a>
		<div class="product-name text-left">
			<a href="<c:url value='/san-pham/${product._id}'/>">${ product.name }</a>
		</div>
		<div class="rating text-left">
			<c:set var="rating" value="${ product.getRating() }"/>
			<span class="fa fa-star <c:if test="${ rating >= 1 }">checked</c:if> "></span>
			<span class="fa fa-star <c:if test="${ rating >= 2 }">checked</c:if> "></span>
			<span class="fa fa-star <c:if test="${ rating >= 3 }">checked</c:if> "></span>
			<span class="fa fa-star <c:if test="${ rating >= 4 }">checked</c:if> "></span>
			<span class="fa fa-star <c:if test="${ rating >= 5 }">checked</c:if> "></span>
			<span class="num-of-rate">(${ product.comments.size() })</span>
		</div>
		<div class="product-price text-left font-weight-bold">
			<span> <fmt:formatNumber value="${ product.price }" type="currency" /> </span>
			
		</div>
	</div>
</div>