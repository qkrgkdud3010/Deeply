<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/letter.js"></script>
<div class="letter-main background-black">
	<div class="letter-div1">
		<img src="${pageContext.request.contextPath}/assets/images/mail.png">
	</div>
	<div class="font-white bold-title align-center top-10 font-2">나의 아티스트와의 소통</div>
	<div class="letter-aname align-center top-10">
		<hr class="width-60 background-darkblue">
		<div class="aname-div bold-title font-2 align-center">아티스트 이름</div>
		<hr class="width-60 background-darkblue">
	</div>
	<div>
		<div class="font-white bold-title align-center width-20 font-2 top-10">MY LETTER</div>
		<div class="width-80 background-darkblue height-0_2 top-2"></div>
	</div>
	<div class="font-white bold-title align-center width-20 font-1 top-3">잔여 발송 가능 편지 2/3</div>
	<div class="space-10vw"></div>
	<div id="letter_form" class="letter-btn-div vertical-center">
		<div class="letter-btn font-white bold-title align-center">보낸편지</div>
		<div class="letter-btn font-white bold-title align-center">아티스트의 답장</div>
	</div>
	<div class="letter-body">
		<form:form modelAttribute="letterVO" action="write" id="write_letter" enctype="multipart/form-data">
		<form:hidden path="user_num" value="${member.user_num}"/>
		<form:hidden path="artist_num" value="${artist.user_num}"/>
		<form:hidden path="replied" value="0"/>
		<div class="letter-form">
			<div class="letter-title">
				<form:input path="letter_title" placeholder="편지 제목 입력"/>
				<form:errors path="letter_title" cssClass="error-color"/>
			</div>
			<div class="letter-content">
				<form:textarea path="letter_content" placeholder="편지 내용 입력"/>
				<form:errors path="letter_content" cssClass="error-color"/>
			</div>
		</div>
		<form:button>전송</form:button>
		</form:form>
	</div>
	<div class="space-10vw"></div>
</div>