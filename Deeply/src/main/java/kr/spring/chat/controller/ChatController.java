package kr.spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.chat.service.ChatService;
import kr.spring.chat.vo.ChatVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public ChatVO initCommand() {
		return new ChatVO();
	}
	
	/*========================
	 * 채팅방 만들기
	 *========================*/
	//채팅방 등록 폼
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/chwrite")
	public String form() {
		return "chatWrite";
	}
	//전송된 채팅방 처리
	

}
