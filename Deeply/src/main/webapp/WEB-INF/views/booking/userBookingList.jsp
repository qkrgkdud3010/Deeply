<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="principal" /></sec:authorize>
<div class="artist-manage-main">
	<div class="align-center bold-title">
		<h2 class="width-80 height-7 font-3 top-5 background-black font-white align-center">예매 관리</h2>
	</div>
	<div class="margin-auto top-5 align-right"><b class="group-name-design">사용자이름</b>님</div>
	
	<div class="listManager-container">
		<div class="listManager-item align-center">
		<table class="width-100"> 
			<tr class="height-3 background-white font-black">
				<th class="width-10">아티스트</th>
				<th class="width-50">이벤트 명</th>
				<th class="width-30">예약 날짜</th>
				<th class="width-5">예약 인원</th>
				<th class="width-5">관리</th>
			</tr>
		<c:forEach var="book" items="${list}">
			<tr class="manage-list-tr font-0_8 height-3 bold-title">
				<td>${book.group_name}</td>
				<td>${book.perf_title}</td>
				<td>${book.booking_date}</td>
				<td>${book.booked_seat}</td>
				<td>삭제</td>
			</tr>
		</c:forEach>
		</table>
		</div> 
		<div class="align-center top-5"></div>
	</div>
</div>