<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/booking.js"></script>


<div class="booking-artist-container font-white bold-title background-black align-center">${group.group_name}</div>
<div class="bold-title left-10 font-2 top-5">공연 일정 등록</div>
<div class="space-10vw"></div>
<div class="event-register-main">
	<%-- <form:form modelAttribute="eventVO" action="register" id="register_event" enctype="multipart/form-data">
	<div class="register-date border-black">
		<div>공연 일정</div>
		<div>
			<form:label path="perf_date">공연일</form:label><form:input path="perf_date"/>
		</div>
	</div>
	<div class="register-detail border-black"></div>
	<div class="register-img border-black"></div>
	<div class="register-booking border-black"></div>
	<div class="align-center">
		<form:button>등록</form:button>
	</div>
	</form:form> --%>
</div>

