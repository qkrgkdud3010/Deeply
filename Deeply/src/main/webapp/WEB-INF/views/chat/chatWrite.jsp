<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 채팅방 형성 시작
채팅방 형성 폼 -->
<div class="page-main">

	<h2>채팅방</h2>
	<form:form modelAttribute="chatVO" action="chWrite" id = "makeChatroom"
	enctype="multipart/form-data">

	<div>
		<label for="chat_name">채팅방 이름</label>
		<form:input path="chat_name" id="chat_name"/>
	</div>
	
	 <div>
	 	<button type="submit" onclick="location.href='chatRoom'">채팅방 형성</button>
	 </div>
	</form:form>
	
	
	


</div>
