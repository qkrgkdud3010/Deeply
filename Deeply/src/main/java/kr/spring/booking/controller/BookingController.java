package kr.spring.booking.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.spring.booking.service.BookingService;
import kr.spring.booking.vo.BookingVO;
import kr.spring.event.vo.EventVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	private BookingService bookingService;
	
	//아티스트 예매 목록
	@GetMapping("/list")
	public String getList(long artist_num, @RequestParam(defaultValue="1") int pageNum, HttpServletRequest request, Model model) {
		
		log.debug("<<예매 페이지 아티스트 번호>> : " + artist_num);
		log.debug("<<예매 페이지 번호>> : " + pageNum);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_num", artist_num);
		
		int count = bookingService.selectEventRowCount(map);
		log.debug("<<예매 페이지 count>> : " + count);
		PagingUtil page = new PagingUtil(pageNum, count,20,10,"list");
		
		List<EventVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = bookingService.selectEventByArtistId(map);
		}
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("page", page.getPage());
		model.addAttribute("artist_num", artist_num);
		
		return "bookingList";
	}
	
	//예매 폼
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/book")
	public String form(@ModelAttribute("bookingVO") BookingVO bookingVO, long perf_num, Model model, @AuthenticationPrincipal PrincipalDetails principal) {
		
		EventVO event = bookingService.showEventDetail(perf_num);
		MemberVO member = principal.getMemberVO();
		
		model.addAttribute("event", event);
		model.addAttribute("member", member);
		
		return "bookingForm";
	}
	
	@PostMapping("/book")
	public String bookForm() {
		
		return "bookingForm";
	}
	
}
