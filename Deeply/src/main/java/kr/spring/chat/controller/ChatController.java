package kr.spring.chat.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.chat.service.ChatService;
import kr.spring.chat.vo.ChatVO;
import kr.spring.member.vo.ArtistVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
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
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/chWrite")
	public String form() {
		return "chatWrite";
	}
	
	//형성된 채팅방 데이터 처리
	//아티스트만 방을 만들 수 있도록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/chWrite")
	public String submitRoom(@Valid ChatVO chatVO, BindingResult result,
			HttpServletRequest request, RedirectAttributes redirect,
			 @AuthenticationPrincipal 
             PrincipalDetails principal)throws IllegalStateException, IOException{
		
		log.debug("<<채팅방 형성>>" + chatVO);
		//유효성 체크결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		//아티스트 페이지에서 방을 만들 수 있도록 설정
		ArtistVO artistVO= principal.getArtistVO();
		chatVO.setAuser_num(artistVO.getUser_num());
		chatVO.setAuser_id(artistVO.getId());		
		
		
		//제목(title=chat_name은 jsp에서 써서 전송할 예정)
		chatService.insertChatroom(chatVO);
		chatService.insertAuserInfo(chatVO);


	
		//브라우저에 데이터를 전송하지만 URI상에는 보이지 않는 숨겨진
		//데이터의 형태로 전달
		redirect.addFlashAttribute("result","success");
		

		return "chatRoom";
	}
	
	/*========================
	 채팅방 들어가기 form
	 *========================*/	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/chClick")
	public String formUser() {
		return "chatClick";
	}

	//형성된 채팅방 데이터 처리
	//아티스트만 방을 만들 수 있도록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/chClick")
	public String enterRoom(@Valid ChatVO chatVO, BindingResult result,
			HttpServletRequest request, RedirectAttributes redirect,
			@AuthenticationPrincipal 
			PrincipalDetails principal)throws IllegalStateException, IOException{

		log.debug("<<채팅방 들어가기>>" + chatVO);
		//유효성 체크결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		//아티스트 페이지에서 방을 만들 수 있도록 설정
		MemberVO memberVO = principal.getMemberVO();
		chatVO.setDuser_num(memberVO.getUser_num());
		chatVO.setDuser_id(memberVO.getId());
	


		//제목(title=chat_name은 jsp에서 써서 전송할 예정)
		chatService.insertDuserInfo(chatVO);


		//브라우저에 데이터를 전송하지만 URI상에는 보이지 않는 숨겨진
		//데이터의 형태로 전달
		redirect.addFlashAttribute("result","success");


		return "chatRoom";
	}


	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/table")
	public String submitTable(
	        @ModelAttribute ChatVO chatVO,
	        Model model) {

	    long chat_num = chatVO.getChat_num(); // 모델에서 chat_num 값 
	    chatService.insertAuserChat(chat_num);
	    log.debug("Received chat_num: " + chat_num);

	    // 처리 로직
	    return "chatRoom"; // 결과 페이지로 이동
	}
	
}
