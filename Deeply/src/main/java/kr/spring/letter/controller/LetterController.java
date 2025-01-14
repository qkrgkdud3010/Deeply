package kr.spring.letter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.spring.letter.service.LetterService;
import kr.spring.letter.vo.LetterVO;
import kr.spring.member.service.ArtistService;
import kr.spring.member.vo.ArtistVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import kr.spring.util.PagingUtil;
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
	public String getList(long artist_num,@RequestParam(defaultValue="1") int pageNum, Model model, @AuthenticationPrincipal PrincipalDetails principal, HttpServletRequest request) {
		
		ArtistVO artist = artistService.selectMember(artist_num);
		model.addAttribute("artist", artist);
		
		if(principal.getArtistVO() != null) {
			model.addAttribute("message", "아티스트 계정 전용 페이지로 이동합니다");
		    model.addAttribute("url",request.getContextPath() + "/artist/list");
			
			return "common/resultAlert";
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_num", principal.getMemberVO().getUser_num());
		map.put("artist_num", artist_num);
		
		int count = letterService.countLetterByUser(map);
		PagingUtil page = new PagingUtil(pageNum,count,11,5,"list");
		
		List<LetterVO> letters = new ArrayList<LetterVO>();
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			letters = letterService.selectLetterByUser(map);
		}
		
		model.addAttribute("count", count);
		model.addAttribute("letters", letters);
		model.addAttribute("page", page.getPage());
		
		return "letterList";
	}
	
	//편지 작성
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String form(long artist_num, @AuthenticationPrincipal PrincipalDetails principal, HttpServletRequest request, Model model) {
		
		if(principal.getArtistVO() != null) {
			model.addAttribute("message", "아티스트 계정으로 편지를 작성할 수 없습니다");
		    model.addAttribute("url",request.getContextPath() + "/letter/list?artist_num=" + artist_num);
			
			return "common/resultAlert";
		}
		
		ArtistVO artist = artistService.selectMember(artist_num);
		model.addAttribute("letterVO", new LetterVO());
		model.addAttribute("artist", artist);
		return "letterWrite";
	}
	
	//편지 폼 전송
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/write")
	public String writeLetter(@ModelAttribute("letterVO") @Valid LetterVO letterVO,BindingResult result, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
		
		log.debug("<<편지 전송>> : " + letterVO);
		letterVO.setLetter_num(0); // 클라이언트 입력 무시		
		
		if(result.hasErrors()) {
		    model.addAttribute("letterVO", letterVO);
		    model.addAttribute("errors", result.getAllErrors());
		    return "letterWrite"; // 유효성 검증 실패 시 다시 작성 화면으로 이동
		}
		
		letterService.postLetter(letterVO);
		
		model.addAttribute("message", "편지를 전송하였습니다");
	    model.addAttribute("url",request.getContextPath() + "/letter/list?artist_num=" + letterVO.getArtist_num());
		
		return "common/resultAlert";
	}
	
	@GetMapping("/detail")
	public String showDetail(long letter_num, Model model, @AuthenticationPrincipal PrincipalDetails principal, HttpServletRequest request) {
		
		LetterVO letter = letterService.showLetterDetail(letter_num);
		ArtistVO artist = artistService.selectMember(letter.getArtist_num());
		
		
		if(principal.getMemberVO() == null || principal.getMemberVO().getUser_num() != letter.getUser_num()) {
			if(principal.getMemberVO() == null) {
				model.addAttribute("message", "로그인이 필요합니다");
			}else {
				model.addAttribute("message", "로그인 계정이 작성자 계정과 일치하지 않습니다");
			}
			model.addAttribute("url",request.getContextPath() + "/artist/detail?artist_num="+letter.getArtist_num());
		}
		
		model.addAttribute("letter", letter);
		model.addAttribute("artist", artist);
		return "letterDetail";
	}
}
