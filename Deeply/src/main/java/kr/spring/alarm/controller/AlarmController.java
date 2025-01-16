package kr.spring.alarm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.alarm.service.AlarmService;
import kr.spring.alarm.vo.AlarmVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/alarm")
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public AlarmVO initCommand() {
		return new AlarmVO();
	}
		/*
		 * 알람테이블에 동{적으로 넣기
		 * */
		
		//따로 알람 등록 폼은 필요하지 않다
		
		@PreAuthorize("isAuthenticated()")
		@PostMapping("/userReplyAlarm")
		public String replyAlarm(@Valid AlarmVO alarmVO, BindingResult result,
				HttpServletRequest request, RedirectAttributes redirect, HttpSession session,
				 @AuthenticationPrincipal 
	             PrincipalDetails principal)throws IllegalStateException, IOException{
			
			
			log.debug("<<답장알람>>" + alarmVO);
			
			//답장 알람을 vo에 설정하기
			
			MemberVO memberVO = principal.getMemberVO();
			
			alarmVO.setUser_num(memberVO.getUser_num());
			
			alarmService.insertReplyAlarm(alarmVO);
			
			return "redirect:/alarm/reAlarm";
		}
		
		//알람 jsp에 답장알람 넣기
		//채팅방 열기
		@PreAuthorize("isAuthenticated()")
		@GetMapping("/userReplyAlarm")
		public String replyAlarm2(Model model) {
			
			AlarmVO alarmVO  = new AlarmVO();
			
			model.addAttribute("alarmVO",alarmVO);
			
			return "alarm_nav";
		}
	
	
	

}
