<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%><!-- 로그인 관련 태그 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/shop.js"></script>

<%-- 장바구니에 상품 없을 때 --%>
<c:if test="${empty cart.item_num}">
	<div class="cart-div">
	<hr class="custom-hr2" noshade="noshade" width="100%">
	<div class="empty-div"></div>
	<span>장바구니가 비었습니다.</span><br>
	<span><img class="cart-img" src="${pageContext.request.contextPath}/assets/images/hj/cart.png"></span><br>
	<a href="${pageContext.request.contextPath}/item/main" class="shop-link">지금 shop으로 이동하기 →</a>
	<div class="empty-div"></div>
	<hr class="custom-hr2" noshade="noshade" width="100%">
	</div>
</c:if>



<%-- 장바구니에 상품 있을 때 --%>
<c:if test="${!empty cart.item_num}">
<div class="item-info">
	<div class="box-shadow">
		<img src="${pageContext.request.contextPath}/assets/upload/${item.filename}" class="items-img">
	</div>
	<div class="box-shadow">
		<ul>
			<li>단독판매</li>
			<li>상품명 : ${item.item_name}</li>
			<li>가격 : ${item.item_price}원</li>
			<li>회원당 최대 3개까지 구매가능합니다.</li>
		</ul>
		<c:forEach var="item" items="${carts}">
			<div class="quantity-container">
			<div class="quantity-name">${item.item_name}</div>
			<div class="v-center">
				<div class="quantity-box">
					<button class="quantity-btn a-center" id="minus_btn">-</button>
					<span class="quantity-number a-center" id="quantity" data-value="1">1</span>
					<button class="quantity-btn a-center" id="plus_btn">+</button>
				</div>
				<div class="price-box">
					<div class="price-div" id="price_total" data-price="${item.total_price}">
						<fmt:formatNumber value="${item.item_price}" type="number" groupingUsed="true" />원
					</div>
				</div>
			</div>
			<input type="hidden" name="item_num" id="item_num" data-num="${item.item_num}">
			</div>
		</c:forEach>
	</div>
</div>
</c:if>