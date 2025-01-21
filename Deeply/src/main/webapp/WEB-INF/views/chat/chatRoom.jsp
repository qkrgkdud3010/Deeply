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
<!-- socket 및 stomp cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hr1.css">


<!--  
<div class="page-main">

  <h2>형성된 채팅방</h2>
  
    <div class="well">
       <input type="text" id="msg" value="1212" class="form-control" />
       <button id="btnSend" class="btn btn-primary">Send Message</button>
    </div>
  
	<c:if test="${chat_kind==1}">
	<div>
		아티스트의 채팅방
		${chat_condition}
	 	<button type="submit" onclick="location.href='chWrite'">채팅방 닫기</button>
	 </div>
	</c:if> 
	
-->

  <!-- 유저 이름 설정 -->
<!-- Login Section -->
      <!-- 로그인 컨테이너 -->
   
 
 <div class="chatroom-detail">
        <h2>채팅방 상세</h2>
        
        <p><strong>채팅방 이름:</strong> ${chatName}</p>
        <p><strong>말풍선 내용:</strong> ${ballonName}</p>

        <!-- 아티스트 사진 미리보기 -->
        <c:if test="${not empty artistPhoto}">
            <p><strong>아티스트 사진:</strong></p>
            <img src="${artistPhoto}" alt="Artist Photo" style="max-width: 300px; max-height: 300px;" />
        </c:if>

    </div>
 
 
    <div class="room-container">
        <h2>Available Rooms</h2>
        <div id="roomList"></div>
        <button id="btnJoinRoom">Join Room</button>
    </div>

    <!-- 채팅 컨테이너 -->
    <div id="chatContainer">
        <div id="message-list"></div>
        <form id="messageForm">
            <input type="text" id="msg" placeholder="Type your message here" />
            <button id="btnSend">Send</button>
        </form>
    </div>


<script src="${pageContext.request.contextPath}/assets/js/chat.js"></script>

            <!-- Messages will appear here
        </div>
    </div>
    <div class="input-container">
        <input type="text" id="msg" placeholder="Type a message...">
        <button id="btnSend">Send</button>
    </div>
 
<div id="chat-container"></div>
    <h2>코코넛</h2>
    <div id="message-list"></div>
    <div id="input-container">
        <input type="text" id="msg" placeholder="Enter your message..." />
        <button id="btnSend">보내기</button>
    </div>

	<c:if test="${chat_kind==0}">
	<div>
		유저의 채팅방
		${chat_condition}

	 	<button type="submit" onclick="${pageContext.request.contextPath}/main/main">채팅방 나가기</button>
	 </div>
	</c:if>-->