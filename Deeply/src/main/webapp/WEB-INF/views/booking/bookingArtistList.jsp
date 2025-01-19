<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="principal" /></sec:authorize>
<div class="artist-manage-main">
	<div class="align-center bold-title">
		<h2 class="width-80 height-7 font-3 top-5 background-black font-white align-center">이벤트 관리</h2>
	</div>
	<c:if test="${group_name == principal.artistVO.name}">
		<div class="margin-auto top-5 align-right"><b class="group-name-design">${group_name}</b>님</div>
	</c:if>
	<c:if test="${group_name != principal.artistVO.name}">
		<div class="margin-auto top-5 align-right"><b class="group-name-design">${group_name}</b> <b>${principal.artistVO.name}</b>님</div>
	</c:if>
	
	<div class="listManager-container">
		<div class="listManager-item align-center">
		<table class="width-100"> 
			<tr class="height-3 background-white font-black">
				<th class="width-50">이벤트 명</th>
				<th class="width-30">이벤트 기간</th>
				<th class="width-10">상태</th>
				<th class="width-10" colspan="2">관리</th>
			</tr>
		<c:forEach var="event" items="${list}">
			<tr class="manage-list-tr font-0_8 height-3 bold-title">
				<td>${event.perf_title}</td>
				<td>
					<c:if test="${empty event.end_date}">
						${event.perf_date}
					</c:if>
					<c:if test="${!empty event.end_date}">
						${event.perf_date} ~ ${event.end_date}
					</c:if>
				</td>
				<td>${event.status_name}</td>
				<td class="cursor-pointer"><a href="${pageContext.request.contextPath}/booking">수정</a></td>
				<td class="cursor-pointer"><a href="${pageContext.request.contextPath}/booking/delete?perf_num=${event.perf_num}&group_num=${event.artist_num}">삭제</a></td>
			</tr>
		</c:forEach>
		</table>
		</div> 
		<div class="align-center top-5">${page}</div>
	</div>
</div>