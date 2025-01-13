<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 채팅방 형성 시작
채팅방 형성 폼 -->
<div class="page-main">

	<h2>채팅방</h2>
	<form:form modelAttribute="chatVO" action="chatting" id = "enterChatroom"
	enctype="multipart/form-data">


	 <div>
	 	<button type="submit" onclick="location.href='chatRoom'">채팅방으로 입장</button>
	 </div>
	</form:form>

</div>
