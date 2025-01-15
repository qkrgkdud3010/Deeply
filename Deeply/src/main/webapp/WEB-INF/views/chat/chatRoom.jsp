<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>


<input type="hidden" id="chat_num" value="${chat_num}">


<div class="page-main">

  <h2>형성된 채팅방</h2>
  
	<c:if test="${chat_kind==1}">
	<div>
		아티스트의 채팅방
		${chat_condition}
	 	<button type="submit" onclick="location.href='chWrite'">채팅방 닫기</button>
	 </div>
	</c:if> 
	
	<c:if test="${chat_kind==0}">
	<div>
		유저의 채팅방
		${chat_condition}
	 	<button type="submit" onclick="${pageContext.request.contextPath}/main/main">채팅방 나가기</button>
	 </div>
	</c:if>

  
</div>


