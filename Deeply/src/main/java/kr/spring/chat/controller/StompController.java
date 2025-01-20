package kr.spring.chat.controller;

import java.util.Map;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;


@Controller
public class StompController {
	@MessageMapping("/chat/{room}")
	@SendTo("/topic/chat/{room}")
	public Map<String, String> handleMessage(@Payload Map<String, String> message) {
	    System.out.println("Received message: " + message);
	    return message; // 그대로 브로드캐스트
	}

}


