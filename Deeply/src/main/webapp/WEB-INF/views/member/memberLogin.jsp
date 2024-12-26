<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 회원로그인 시작 -->
<div class="page-main">
	<h2>회원로그인</h2>
	<form action="login" id="member_login" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<c:if test="${!empty error && error == 'error'}">
		<div class="align-center error-invalid error-color">아이디 또는 비밀번호 불일치</div>
		</c:if>
		<c:if test="${!empty error && error == 'error_noAuthority'}">
		<div class="align-center error-invalid error-color">정지회원입니다.</div>
		</c:if>
		<ul>
			<li class="floating-label">
				<input type="text" name="id" id="id" placeholder="아이디" class="form-input" autocomplete="off">
				<label for="id">아이디</label>
				<div id="error_id" class="error-color"></div>
			</li>
			<li class="floating-label">
				<input type="password" name="passwd" id="passwd" placeholder="비밀번호" class="form-input">
				<label for="passwd">비밀번호</label>
				<div id="error_passwd" class="error-color"></div>
			</li>
			<li>
				<label for="remember-me"><input type="checkbox" name="remember-me" id="remember-me">로그인상태유지</label>
			</li>
		</ul>			
		<div>
			<input type="submit" value="로그인" class="login-btn">
		</div>
	</form>
	<p class="align-center">
		<input type="button" value="홈으로"
		      onclick="location.href='${pageContext.request.contextPath}/main/main'">
		<input type="button" value="비밀번호찾기"
		      onclick="location.href='sendPassword'">
	</p>
	<div class="align-center">
		<a href="${pageContext.request.contextPath}/oauth2/authorization/naver" id="naver_login"><img width="223" src="${pageContext.request.contextPath}/assets/images_api/naver_login.gif"/></a>
		<br>
		<a href="${pageContext.request.contextPath}/oauth2/authorization/kakao" id="kakao_login"><img width="223" src="${pageContext.request.contextPath}/assets/images_api/kakao_login.jpg"/></a>
	</div>		            
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/member.login.js"></script>
<!-- 회원로그인 끝 -->	

	
	
	



