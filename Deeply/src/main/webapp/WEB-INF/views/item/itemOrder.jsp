<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%><!-- 로그인 관련 태그 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<div><span class="text-title">상품정보</span>
<hr class="custom-hr" noshade="noshade" width="100%">
상품정보를 리스트 형태로 반환
</div>

<div class="order-info"><span>총 상품 금액 {} + 배송비 {} <br> 총 결제 금액 {}</span></div>

<div><span class="text-title">배송지 정보</span>
<hr class="custom-hr" noshade="noshade" width="100%">
배송지 정보는 받아와서 처리 할 예정
<hr class="custom-hr" noshade="noshade" width="100%">
</div>