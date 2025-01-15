<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!-- 채팅방 형성 시작
채팅방 형성 폼 -->
<div class="page-main">
 
	<h2>채팅방</h2>
	${param.artist_num}
	
	<c:if test="${ch_kind==1}"> 
	 
	<div>
	<form:form modelAttribute="chatVO" action="chWrite" id = "makeChatroom"
	enctype="multipart/form-data">

	<div>
		<label for="chat_name">채팅방 이름</label>
		<form:input path="chat_name" id="chat_name"/>
	</div>
	
	 <div>
	 	<button type="submit" >채팅방 형성</button>
	 </div>
	</form:form>
	</div>
	
	</c:if>

	<c:if test="${ch_kind==0}">
	<div>
    <form:form modelAttribute="chatVO" action="${pageContext.request.contextPath}/chat/chatting" id="enterChatroom" method="post" enctype="multipart/form-data">
       
        <form:hidden path="auser_num" value="${param.artist_num}" />
         <button type="submit">채팅방 들어가기</button>
       
    </form:form>
	</div>	
	</c:if>
	
	
</div>





