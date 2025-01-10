<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/booking.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<div class="booking-artist-container font-white bold-title background-black align-center">${group.group_name}</div>
<div class="bold-title left-10 font-2 top-5">공연 일정 등록</div>
<div class="space-10vw"></div>
<div class="event-register-main">
	<form:form modelAttribute="eventVO" action="register" id="register_event" enctype="multipart/form-data">
	<div class="register-date border-black">
		<div>공연 일정</div>
		<div>
			<form:label path="perf_date">공연일</form:label><form:input path="perf_date"/>
			<form:hidden path="hall_num" id="hall_num"/>
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" id="drop_title" type="button" data-bs-toggle="dropdown" aria-expanded="false">공연 장소</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#" data-value="1">테스트 홀</a></li>
					<li><a class="dropdown-item" href="#" data-value="2">서울 체육관</a></li>
					<li><a class="dropdown-item" href="#" data-value="3">수도권 경기장</a></li>
					<li><a class="dropdown-item" href="#" data-value="4">월드컵 돔</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="register-detail border-black">
		<div>공연 정보</div>
		<div>
			<p><form:label path="perf_title">공연 이름</form:label><form:input path="perf_title"/></p>
			<div>
			<p><form:label path="perf_desc">공연 상세</form:label></p>
			
				<form:textarea path="perf_desc"/>
			</div>
			<div>
			<p><form:label path="upload">공연 이미지</form:label></p>
			<div></div>
			<input type="file" name="upload">
			</div>
		</div>
	</div>
	<div class="register-booking border-black">
		<div>공연 정보</div>
		<div>
			<p><form:label path="book_date">예매 시작일</form:label><form:input path="book_date"/></p>
			<p><form:label path="booking_deadline">예매 종료일</form:label><form:input path="booking_deadline"/></p>
			<p><form:label path="mem_date">선예매 시작일</form:label><form:input path="mem_date"/></p>
			<p><form:label path="ticket_price">티켓 금액</form:label><form:input path="ticket_price"/></p>
			<p class="font-red">VIP좌석 금액은 기본 좌석 금액 기준 1.4배로 측정됩니다</p>
		</div>
	</div>
	<div class="align-center">
		<form:button>등록</form:button>
	</div>
	</form:form>
</div>

