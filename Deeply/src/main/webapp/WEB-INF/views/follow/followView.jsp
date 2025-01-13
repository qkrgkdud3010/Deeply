<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/myFollow.js"></script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<div class="main-div">
	<h2>나의 구독 아티스트</h2>
	<hr>
	<jsp:include page="/WEB-INF/views/mypage/myInfo.jsp"/>
	<div class="followList">
		<c:if test="${count == 0}">
			<div class="result-display">팔로우하는 아티스트가 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
			<table class="profile-list" data-header="${_csrf.headerName}" data-token="${_csrf.token}">
				<c:forEach var="followList" items="${followList}">
					<div class="profile-item">
						<img class="profile-image" src="${pageContext.request.contextPath}/assets/profile_upload/mjprofile.jpg" alt="프로필 이미지">
                        <img class="my-photo" src="${pageContext.request.contextPath}/assets/images/hr2/follow.png">
                        <div class="profile-text">
	                        <div class="group-name">${followList.group_name}</div>
                        	<div class="artist-name">${followList.name}</div>
                        </div>
					</div>
				</c:forEach>
			</table>
			<div class="align-center">${page}</div>
		</c:if>
	</div>
</div>