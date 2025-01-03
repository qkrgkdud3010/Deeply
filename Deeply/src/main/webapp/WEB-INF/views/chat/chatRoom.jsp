<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	let result = '${result}';
	if(result == 'success'){
		alert('글 등록이 완료되었습니다.');
	}
</script>
<div class="page-main">
	<h2>채팅방</h2>
	
	<form:form modelAttribute="chatVO" action="${pageContext.request.contextPath}/chWrite" id="chatRoom" method="post" enctype="multipart/form-data">
	    <form:label path="chat_name">채팅방 이름:</form:label>
	    <form:input path="chat_name" id="chat_name" />	    
	    <button type="submit">채팅방 생성</button>
	</form:form>
</div>