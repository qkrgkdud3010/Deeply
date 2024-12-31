<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 메인 시작 -->
<div class="main-div">
	<!-- 로그인 컨텐츠 부분 -->

	<div class="login">
		<img class="logo"
			src="${pageContext.request.contextPath}/assets/images/DeeplyLoginLogo.png">
		<form:form action="login" modelAttribute="memberVO">
			<form:input path="id" placeholder="아이디" />

			<form:input path="passwd_hash" type="text" placeholder="비밀번호" />
			<div class="line-with-text">
				<span>or</span>
			</div>
			<table class="login-button">
				<tr>
					<td><img class="inline-img" alt=""
						src="${pageContext.request.contextPath}/assets/images/naver.png">
						<span class="inline-text">네이버로 로그인하기.</span></td>
					<td><img class="inline-img" alt=""
						src="${pageContext.request.contextPath}/assets/images/kakao.png">
						<span class="inline-text">카카오로 로그인하기.</span></td>
				</tr>
				<tr>
					<td>아이디 찾기</td>
					<td>비밀번호 찾기</td>
				</tr>
			</table>
			<form:button>로그인</form:button>
		</form:form>
	</div>


</div>