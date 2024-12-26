<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인 시작 -->
<div class="main-div">
<!-- 로그인 컨텐츠 부분 -->

	<div class="login">
		<img alt="" src="${pageContext.request.contextPath}/assets/images/DeeplyLoginLogo.png">
		<form action="">
			<input type="text" placeholder="아이디">
			<input type="text" placeholder="비밀번호">
		
		<div class="line-with-text">
 			 <span>or</span>
		</div>
		<table class="login-button">
			<tr>
				<td class="vertical-align: middle;"><img class="inline-img" alt="" src="${pageContext.request.contextPath}/assets/images/naver.png"> <span class="inline-text">네이버로 로그인하기.</span></td>
				<td><img class="inline-img" alt="" src="${pageContext.request.contextPath}/assets/images/kakao.png"> <span class="inline-text">카카오로 로그인하기.</span></td>
			</tr>
			<tr>
				<td>아이디 찾기</td>
				<td>비밀번호 찾기</td>
			</tr>
		</table>
		<button>로그인</button>
		</form>
	</div>


</div>