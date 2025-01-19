let username = null;

$(document).ready(function () {
    // Set username and show the chat interface
    $('#btnSetUsername').on('click', function (evt) {
        evt.preventDefault();
        username = $('#username').val().trim();

        if (!username) {
            alert("Please enter a username.");
            return;
        }

        // Hide login container and show chat interface
        $('.login-container').hide();
        $('#chatContainer').show();

        connectStomp(); // Connect to STOMP
    });

    $('#btnSend').on('click', function (evt) {
        evt.preventDefault();
        let msg = $('input#msg').val();

        if (!msg.trim()) {
            alert("Please enter a message.");
            return;
        }

        // Display the sent message in the UI
        $('#message-list').append(`<div class="chat-bubble user"><b>${username}:</b> ${msg}</div>`);
        $('input#msg').val(''); // Clear input field

        // Send the message to the server using STOMP
        if (socket && isStomp) {
            socket.send("/TTT", {}, JSON.stringify({ user: username, msg: msg }));
        }
    });
});

var socket = null;
var isStomp = false;

function connectStomp() {
    var sock = new SockJS("/stompChat"); // Connect to the SockJS endpoint
    var client = Stomp.over(sock);
    isStomp = true;
    socket = client;

    client.connect({}, function () {
        console.log("Connected to /stompChat!");

        // Subscribe to the topic '/topic/message'
        client.subscribe('/topic/message', function (event) {
            let message = JSON.parse(event.body); // Parse the incoming JSON message
            console.log("Received message:", message);

            // 나 자신의 메시지가 아닌 경우만 화면에 표시
            if (message.user !== username) {
                $('#message-list').append(`<div class="chat-bubble server"><b>${message.user}:</b> ${message.msg}</div>`);

                // Auto-scroll to the latest message
                var chatContainer = document.getElementById('chatContainer');
                chatContainer.scrollTop = chatContainer.scrollHeight;
            } else {
                console.log("Own message ignored:", message);
            }
        });
    });
}
