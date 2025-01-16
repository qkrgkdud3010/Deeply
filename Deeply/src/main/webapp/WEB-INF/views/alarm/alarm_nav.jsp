<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
</sec:authorize>

     <h1>알람</h1>
     
     <form:form modelAttribute="alarmVO" action="userReplyAlarm" id="enterChatroom" enctype="multipart/form-data">
       
   
         <button type="submit">채팅방 들어가기</button>
       
    </form:form>

