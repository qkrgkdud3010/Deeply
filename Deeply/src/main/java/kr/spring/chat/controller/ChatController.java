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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/*========================
	 * 아티스트 - 채팅방
	 *========================*/
	
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
		
		Long chat_num = chatService.selectChatnum(artistVO.getUser_num());
		chatVO.setChat_num(chat_num);
		System.out.println(chat_num);
		
		//중간테이블로 전송
		chatService.insertAuserChat(chatVO);
	
		//아티스트의 경우 유저 정보가 1로 바뀜
		chatService.updateAuserKind(chat_num);
		
		//브라우저에 데이터를 전송하지만 URI상에는 보이지 않는 숨겨진
		//데이터의 형태로 전달
		redirect.addFlashAttribute("chat_num",chat_num);
		redirect.addFlashAttribute("auser_num",artistVO.getUser_num());
		redirect.addFlashAttribute("chat_kind",1);
		

		return "redirect:/chat/artistChatroom";
	}
	
	
	//채팅방 열기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/artistChatroom")
	public String enterRoomArtist() {
				
		return "chatRoom";
	}
	//채팅방 닫기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/closeChatroom")
	public String closeRoomArtist() {
		
		
		
		return "chatWrite";
	}
	
	

	/*========================
	 채팅방 들어가기 form
	 *========================*/	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/chatting")
	public String formUser() {
		
		return "chat/chattingUser";
	}

	//형성된 채팅방 데이터 처리
	//아티스트만 방을 만들 수 있도록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/chatting")
	public String enterRoomUser(@Valid ChatVO chatVO, BindingResult result,
			HttpServletRequest request, RedirectAttributes redirect,
			@AuthenticationPrincipal 
			PrincipalDetails principal)throws IllegalStateException, IOException{

		log.debug("<<채팅방 들어가기>>" + chatVO);
		//유효성 체크결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return formUser();
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


		return "redirect:/chat/userChatroom";
	}
	
	//채팅방 열기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/userChatroom")
	public String enterRoomUser() {
			
		return "chatRoom";
	}
	

	
	/* 서버  통신 예시
	@ResponseBody
	@PostMapping("/table")
	public String memberRegi(@RequestParam("chat_num") long chat_num, 
	                         @ModelAttribute ChatVO chatvo, 
	                         HttpServletRequest request) {
	    System.out.println("request.getParameter(\"chat_num\"): " + request.getParameter("chat_num"));
	    //System.out.println("chatvo.getChat_num(): " + chatvo.getChat_num());
	   //System.out.println("chat_num: " + chat_num);

	    // 응답 반환
	    return "success"; 
	}
	*/
	
	
	
	
	

}
