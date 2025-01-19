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
		<c:if test="${empty cart}">
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
		<c:if test="${!empty cart}">
			<div class="item-info4">
			<div class="box-shadow4">
				<c:forEach var="cart_item" items="${cart}">
					<div>
						<img src="${pageContext.request.contextPath}/assets/upload/${cart_item.filename}" class="cart-img">
					</div>
					
					<div class="quantity-container2">
						<div class="quantity-name">${cart_item.item_name}</div>
							<div class="v-center">
								<div class="quantity-box">
									<button class="quantity-btn a-center cminus_btn">-</button>
									<span class="quantity-number a-center quantity" id="quantity" data-value="${cart_item.order_quantity}">${cart_item.order_quantity}</span>
									<button class="quantity-btn a-center cplus_btn">+</button>
								</div>
								<div class="price-box">
									<div class="price-div price_total" data-price="${cart_item.item_price}">
										<fmt:formatNumber value="${cart_item.item_price * cart_item.order_quantity}" type="number" groupingUsed="true" />원
									</div>
								</div>
							</div>
								<a href="${pageContext.request.contextPath}/item/order?item_num=${cart_item.item_num}&quantity=${cart_item.order_quantity}"><div class="purchase-btn">구매하기</div></a>
								<a href="${pageContext.request.contextPath}/item/delete_cart?cart_num=${cart_item.cart_num}"><img class="cart-delete-img" src="${pageContext.request.contextPath}/assets/images/hj/trash.svg"></a>
								<input type="hidden" name="item_num" id="item_num" class="cart-item-num" data-num="${cart_item.item_num}">
								<input type="hidden" id="this_cart_num_${cart_item.cart_num}" data-value="${cart_item.cart_num}">
								
					</div>
					<hr class="custom-hr" noshade="noshade" width="100%">
				</c:forEach>
			</div>
				<div class="order-info2">
					<span> 총 상품 금액 <fmt:formatNumber
							value="${totalAmount}" type="number" groupingUsed="true" />원 + 배송비 
							<c:if test="${ctotalAmount < 50000}"> + 3,000원</c:if>
							<c:if test="${totalAmount >= 50000}">0원</c:if>
					</span> 
						<br>
					<c:if test="${totalAmount < 50000}">
						<span> 총 결제 금액 : </span>
							<span class="order-info3"><fmt:formatNumber 
								value="${totalAmount + 3000}" type="number" groupingUsed="true" />원</span>
					</c:if>
					<c:if test="${totalAmount >= 50000}">
						<span> 총 결제 금액 : <fmt:formatNumber
								value="${totalAmount}" type="number" groupingUsed="true" />원
						</span>
					</c:if>
				</div>
			
				<div class="purchase-all-btn">구매하기</div>
			</div>
		</c:if>