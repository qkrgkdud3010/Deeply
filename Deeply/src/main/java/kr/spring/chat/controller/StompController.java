package kr.spring.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class StompController {
	@MessageMapping("/TTT")
	@SendTo("/topic/message")
	public String ttt(String message) throws Exception{
		System.out.println("TTT >>"+message);
		return message;
	}

}
 