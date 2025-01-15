package kr.spring.chat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.chat.service.ChatService;
import kr.spring.chat.vo.ChatMsgVO;
import kr.spring.member.vo.PrincipalDetails;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatAjaxController {
	@Autowired
	private ChatService chatService;

	/*=============
	 * 메세지 작성
	 =============*/
	
	@PostMapping("/writeChatting")
	@ResponseBody
	public Map<String, String> writeMsg(ChatMsgVO chatMsgVO, @AuthenticationPrincipal
			               PrincipalDetails principal,
			               HttpServletRequest request){
		
		log.debug("<<채팅 등록>> : " + chatMsgVO);
		
		Map<String,String> mapJson = 
				new HashMap<String,String>();		
		try {
			//메세지 VO에 유저 번호 저장
			chatMsgVO.setChat_user_num(
					principal.getMemberVO().getUser_num());
		
			
			//댓글 등록
			//boardService.insertReply(boardReplyVO);
			mapJson.put("result", "success");
		}catch(NullPointerException e) {
			mapJson.put("result", "logout");
		}		
		return mapJson;
	}
		
		
	}
	
	
	

