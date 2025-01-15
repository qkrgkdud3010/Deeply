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


 <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        #chat-container {
            width: 400px;
            margin: 0 auto;
        }
		#message-list {
		    border: 1px solid #ccc;
		    height: 300px;
		    width: 100%;
		    overflow-y: auto;
		    padding: 10px;
		    background-color: #f9f9f9;
		}       
		 #input-container{
            display: flex;
            gap: 10px;
        }
        #msg {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        #btnSend {
            padding: 10px 20px;
            border: none;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }
        #btnSend:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div id="chat-container">
    <h2>코코넛</h2>
    <div id="message-list"></div>
    <div id="input-container">
        <input type="text" id="msg" placeholder="Enter your message..." />
        <button id="btnSend">보내기</button>
    </div>
</div>
<script>
$(document).ready(function () {
    connectStomp();

    $('#btnSend').on('click', function (evt) {
        evt.preventDefault();
        let msg = $('input#msg').val();

        if (!msg.trim()) {
            alert("Please enter a message.");
            return;
        }

        // Display the sent message
        $('#message-list').append('<div><b>Me:</b>' + msg + '</div>');
        console.log("Message sent:", msg);
        $('input#msg').val(''); // Clear input field
    });
});

var socket = null;
var isStomp = false;

function connectStomp() {
    var sock = new SockJS("/stompTest");
    var client = Stomp.over(sock);
    isStomp = true;
    socket = client;

    client.connect({}, function () {
        console.log("Connected to stompTest!");

        client.subscribe('/topic/message', function (event) {
            console.log("Received message:", event.body);
            let message = JSON.parse(event.body); // Parse JSON
            $('#message-list').append(`<div><b>Server:</b> ${message.msg}</div>`);
        });
    });
}



</script>

	<c:if test="${chat_kind==0}">
	<div>
		유저의 채팅방
		${chat_condition}
		
		
		
		
		
	
	 	<button type="submit" onclick="${pageContext.request.contextPath}/main/main">채팅방 나가기</button>
	 </div>
	</c:if>

  



