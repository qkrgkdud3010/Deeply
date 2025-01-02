<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 채팅방 형성 시작 -->
<div class="page-main">

	<h2>채팅방</h2>
	<form:form modelAttribute="chatVO" action="chwirte" id = "makeChatroom"
	enctype="multipart/form-data">
	<ul>
		
			<form:label path ="title">채팅방 제목</form:label>
			<form:input path="title" placeholder="채팅방 제목을 입력하세요"/>
		
		
	</ul> 
	
		<div class="align-center">
			<form:button>방 만들기</form:button>
			<input type="button" value="방 만들기"
			             onclick="location.href='chatroom'">
		</div> 

	</form:form>

</div>
