<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="principal" /></sec:authorize>
<div class="">
	
	<div class="align-center font-2 top-3">공연 예매 내역</div>
	<div class="width-100 background-black height-1 top-3"></div>
	<div class="align-center top-3">
		<button>예매 내역</button>
		<button>취소 내역</button>
	</div>
	<div class="width-100 background-black height-1 top-3"></div>
	<div class="artist-manage-main">
		<c:forEach var="book" items="${list}">
			 <div class="top-3 font-1">${book.booking_date}</div>
			 <div class="top-3 font-1">받으시는 분 ${book.deliver_name}</div>
			 <div class="vertical-align">
			 	<div class="width-70">
			 		<div>${book.perf_title}</div>
			 		<div>${book.total_price}원 ${book.booked_seat}매</div> 
			 	</div>
			 	<div class="width-30"></div>
			 </div>
		</c:forEach>
	</div>
</div>