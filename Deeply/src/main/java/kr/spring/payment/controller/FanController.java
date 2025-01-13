package kr.spring.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.member.vo.PrincipalDetails;
import kr.spring.payment.service.FanService;
import kr.spring.payment.vo.FanVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/fan")
public class FanController {
	@Autowired
	private FanService fanService;

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/selectFan")
	public String selectFan(@AuthenticationPrincipal PrincipalDetails principal, Model model) {
		//회원정보
		Long user_num = principal.getMemberVO().getUser_num();
		
		FanVO fan = fanService.selectFan(user_num);
		
		model.addAttribute("fan",fan);
		model.addAtr
		
		return "fan";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myArtistList")
	public String getMyArtist(@RequestParam(defaultValue="1")int pageNum,
			@AuthenticationPrincipal 
			PrincipalDetails principal,
			Model model, FanVO fan) {

		//로그인한 회원번호 저장
		Long user_num = principal.getMemberVO().getUser_num();

		//전체 팬맺은 아티스트 수
		int count = fanService.countMyArtist(user_num);

		//페이지 처리
		PagingUtil page = new PagingUtil(null,null,pageNum, count, 20, 10, "myArtistList");

		List<FanVO> myArtistList = null;

		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("user_num", user_num);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			//아티스트 리스트 가져오기
			myArtistList = fanService.getMyArtist(map);
		}

		model.addAttribute("count",count);
		model.addAttribute("myArtistList",myArtistList);

		return "myArtistList";
	};
}
