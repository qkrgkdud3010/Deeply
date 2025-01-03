<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 채팅방 형성 시작
채팅방 형성 폼 -->
<div class="page-main">

	<h2>채팅방</h2>
	<form:form modelAttribute="chatVO" action="chWirte" id = "makeChatroom"
	enctype="multipart/form-data">
	<ul>
		<li>
			<form:label path ="chat_name">채팅방 이름</form:label>
			<form:input path="chat_name" placeholder="채팅방 제목을 입력하세요"/>
		</li>
		
		<li>
		<form action="chWrite" method="post"></form>
		</li>
  

	</ul> 	
		<div class="align-center">
			<input type="button" value="방 만들기"
			             onclick="location.href='chatRoom'">
		</div> 

	</form:form>

</div>
