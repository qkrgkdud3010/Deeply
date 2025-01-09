<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<div class="container">
	<h2>나의 구독 아티스트</h2>
	<hr>
	<div class="followList">
		<c:if test="${count == 0}">
			<div class="result-display">팔로우하는 아티스트가 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
			<table class="striped-table">
				<tr>
					<th>그룹</th>
					<th>이름</th>
				</tr>
				<c:forEach var="followList" items="${followList}">
					<tr>
                        <td class="align-center">${followList.group_name}</td>
                        <td class="align-center">${followList.name}</td>
                        <td>
                            <input type="hidden" id="auser_num" value="${followList.follow_num}">
                            <img class="output_follow" data-num="${followList.follow_num}"
                                 data-header="${_csrf.headerName}" data-token="${_csrf.token}"
                                 src="${pageContext.request.contextPath}/assets/images/hr2/follow.png"
                                 width="40">
                            <img src="${pageContext.request.contextPath}/" width="40" height="40" class="my-photo">
                        </td>
                    </tr>
				</c:forEach>
			</table>
			<div class="align-center">${page}</div>
		</c:if>
	</div>
</div>