<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<div class="page-main">
	<div class="join-membership">
		<h2>나의 예치금</h2>
		${fan.user_bal}
		<hr>
		<div>
			<c:if test="${fan.group_name == fan.name}">
				<h2 class="membership-title">
					아티스트 <span class="blue-artiname">${fan.name}</span>님의 멤버십
				</h2>
			</c:if>
			<c:if test="${fan.group_name != fan.name}">
				<h2 class="membership-title">
					아티스트 <span class="blue-artiname">${fan.group_name} ${fan.name}</span>님의 멤버십
				</h2>
			</c:if>
			<h2> 일반회원 </h2> <img src=""> <h2> 유료회원</h2>
			<h2>월 <span class="black-membership">6,500</span>원</h2>
			<input type="button" class="blue-membership-btn" value="멤버십 가입" src="${pageContext.request.contextPath}">
			<input type="button" class="grey-membership-btn" value="멤버십 해지" src="">
		</div>
	</div>
</div>