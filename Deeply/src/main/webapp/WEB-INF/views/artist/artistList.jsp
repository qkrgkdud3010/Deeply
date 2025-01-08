<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 일반회원, 유료회원 구분-->
<!-- 유료회원의 경우 구독 중인 아티스트 따로 표시 
	 <c:if test="유료회원">
	 	<div class="aList-container">
			<div class="aPremium-items">
				
			</div>
		</div>
		<hr>
	 </c:if>
-->
<div class="artist-main background-black">
	
	<div class="a-title font-white bold-title vertical-center">ARTIST</div>
	<div class="aList-container">
		<c:forEach var="group" items="${groups}">
			<div class="aList-items">
				<a href="detail?artist_num=${group.group_num}">${group.group_name}</a>
			</div>
		</c:forEach>
		
	</div>
</div>