package kr.spring.letter.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.letter.service.LetterService;
import kr.spring.letter.vo.LetterVO;
import kr.spring.member.service.ArtistService;
import kr.spring.member.vo.ArtistVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/letter")
public class LetterController {
	
	@Autowired
	ArtistService artistService;
	
	@Autowired
	LetterService letterService;
	
	//편지 목록
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public String getList(long artist_num, Model model) {
		
		ArtistVO artist = artistService.selectMember(artist_num);
		model.addAttribute("artist", artist);
		
		return "letterList";
	}
	
	//편지 작성
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String form(long artist_num, @AuthenticationPrincipal PrincipalDetails principal, Model model) {
		
		MemberVO member = principal.getMemberVO();
		ArtistVO artist = artistService.selectMember(artist_num);
		model.addAttribute("member", member);
		model.addAttribute("letterVO", new LetterVO());
		model.addAttribute("artist", artist);
		return "letterWrite";
	}
	
	//편지 폼 전송
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/write")
	public String writeLetter(@Valid @ModelAttribute("letterVO") LetterVO letterVO,BindingResult result, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
		log.debug("<<편지 전송>> : " + letterVO);
		
		if(result.hasErrors()) {
			 redirectAttributes.addFlashAttribute("letterVO", letterVO);
			return "redirect:/letter/write";
		}
		
		letterService.postLetter(letterVO);
		
		model.addAttribute("message", "편지를 전송하였습니다");
	    model.addAttribute("url",request.getContextPath() + "/letter/list?artist_num=" + letterVO.getArtist_num());
		
		return "common/resultAlert";
	}
}
