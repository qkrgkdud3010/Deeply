<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="styles.css">
<html>
<body>
<div class="container">
    <h2>나의 구독 아티스트</h2>
    <hr>
    <!-- 마이프로필 첨부하기(이미지,정보) -->
    <jsp:include/>
    	<!--
    	<div class="profile">
            <img src="${duser_detail.photo}" alt="회원프사" class="profile-photo">
            <div class="profile-info">
                <h3>${duser.auth}</h3>
                <div class="info-box">
                    <p><strong>아이디:</strong> ${duser.id}</p>
                    <p><strong>닉네임:</strong> ${duser.nickname}</p>
                    <p><strong>연락처:</strong> ${duser.phone}</p>
                    <p><strong>예치금:</strong> ${duser.balance}원</p>
                    <p><strong>이메일:</strong> ${duser.email}</p>
                    <p><strong>주소:</strong> ${duser.address}</p>
                    <p><strong>소셜연결:</strong> ${duser.social}</p>
                </div>
            </div>
        </div>
    	-->
    <div class="artist-list">
    <c:if test="${empty followList}">
    	<p>구독한 아티스트가 없습니다.</p>
    </c:if>
    <c:if test="${!empty followList}">
	    <c:forEach var="follow" items="${followList}">
	    	<div class="follow-artist-info">
	    		<img src="${auser.photo}" alt="${auser_detail.name}" class="artist_photo">
	    		<p>${auser.name}</p>
	    	</div>
	    </c:forEach>
    </c:if>
    </div>
</div>
</body>
</html>