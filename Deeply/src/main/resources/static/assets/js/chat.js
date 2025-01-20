let username = null;
let currentRoom = null;

$(document).ready(function () {
    // 유저 이름 설정
    $('#btnSetUsername').on('click', function (evt) {
        evt.preventDefault();
        username = $('#username').val().trim();

        if (!username) {
            alert("Please enter a username.");
            return;
        }

        // 로그인 관련은 숨겨놓기
        $('.login-container').hide();
        $('.room-container').show(); // 방 선택 UI 보이기
    });

    // 채팅방 접속
    $('#btnJoinRoom').on('click', function (evt) {
        evt.preventDefault();
        let room = $('#roomName').val().trim();

        if (!room) {
            alert("Please enter a room name.");
            return;
        }

        currentRoom = room;
		console.log("courrent-room:"+currentRoom);

        // 방 선택 UI 숨기고 채팅 UI 보여주기
        $('.room-container').hide();
        $('#chatContainer').show();

        connectStomp(currentRoom); // STOMP 연결
    });

    // 메시지 전송
    $('#btnSend').on('click', function (evt) {
        evt.preventDefault();
        let msg = $('input#msg').val();

        if (!msg.trim()) {
            alert("Please enter a message.");
            return;
        }

        // 보낸 메시지 화면에 표시
        $('#message-list').append(`<div class="chat-bubble user"><b>${username}:</b> ${msg}</div>`);
        $('input#msg').val(''); // 입력창 초기화

        // STOMP 서버에 메시지 전송
        if (socket && isStomp) {
            socket.send(`/chat/${currentRoom}`, {}, JSON.stringify({ user: username, msg: msg }));
        }
    });
});

var socket = null;
var isStomp = false;

// STOMP 연결 함수
function connectStomp(room) {
    var sock = new SockJS("/stompChat"); // SockJS 엔드포인트
    var client = Stomp.over(sock);
    isStomp = true;
    socket = client;

    // 연결 시 로그를 출력
    client.connect({}, function () {
        console.log("Connected to /stompChat!");

        // 방에 따라 동적으로 토픽 구독
        const topic = `/topic/chat/${room}`;
        console.log("Subscribing to:", topic);

        client.subscribe(topic, function (event) {
            try {
                let message = JSON.parse(event.body); // 메시지 파싱
                console.log("Received message:", message);

                if (message.user !== username) {
                    $('#message-list').append(`<div class="chat-bubble server"><b>${message.user}:</b> ${message.msg}</div>`);

                    // 자동 스크롤
                    var chatContainer = document.getElementById('chatContainer');
                    chatContainer.scrollTop = chatContainer.scrollHeight;
                } else {
                    console.log("Own message ignored:", message);
                }
            } catch (error) {
                console.error("Error parsing message:", error, event.body);
            }
        });
    }, function (error) {
        console.error("STOMP connection failed:", error);  // 연결 실패 시 오류 출력
    });
}
