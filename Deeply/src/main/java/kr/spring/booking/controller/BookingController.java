package kr.spring.booking.controller;

import java.io.IOException;
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

import kr.spring.member.service.ArtistService;
import kr.spring.booking.service.BookingService;
import kr.spring.booking.vo.BookingVO;
import kr.spring.event.vo.EventVO;
import kr.spring.member.vo.AgroupVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import kr.spring.seat.vo.SeatVO;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	private BookingService bookingService;
	@Autowired
	private ArtistService artistService;
	
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
		
		AgroupVO group = artistService.selectArtistDetail(artist_num);
		String group_name = group.getGroup_name();
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("page", page.getPage());
		model.addAttribute("artist_num", artist_num);
		model.addAttribute("group_name", group_name);
		
		return "bookingList";
	}
	
	//예매 폼 
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/book")
	public String form(BookingVO bookingVO, long perf_num, Model model, @AuthenticationPrincipal PrincipalDetails principal) {
	    log.debug("<<예매 작성폼>>");
	    
	    if(bookingVO == null) {
	    	bookingVO = new BookingVO();
	    }
	    
	    MemberVO member = principal.getMemberVO();
	    
	    loadBookingContents(perf_num, model);
	    
	    model.addAttribute("perf_num", perf_num);
	    model.addAttribute("member", member);
	    
	    
	    return "bookingForm";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/book")
	public String bookForm(@ModelAttribute("bookingVO") @Valid BookingVO bookingVO,BindingResult result,Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    log.debug("<<예매 작성폼2>>");
	    
	    if((Long)bookingVO.getPerf_num() != null) {
	    	long perf_num = bookingVO.getPerf_num();
	    	loadBookingContents(perf_num, model);
	    }
	    
	    if (result.hasErrors()) {
	        model.addAttribute("errors", result.getAllErrors());
	        model.addAttribute("bookingVO", bookingVO);
	        return "bookingForm"; // 유효성 검증 실패 시 JSP로 이동
	    }
	    
	    bookingService.registerBookingInfo(bookingVO);
	    
	    model.addAttribute("message", "예매를 성공하였습니다");
	    model.addAttribute("url",request.getContextPath() + "/main/main");
	    
	    return "common/resultAlert"; // 성공 시 리다이렉트
	}
	
	public void loadBookingContents(long perf_num, Model model) {
		EventVO event = bookingService.showEventDetail(perf_num);
    	AgroupVO group = artistService.selectArtistDetail(event.getArtist_num());
    	String group_name = group.getGroup_name();

	    int seat_count = bookingService.countSeatByHallNum(event.getHall_num());
	    List<SeatVO> seats = bookingService.selectSeatByHallNum(event.getHall_num());
	    
	    model.addAttribute("group_name", group_name);
    	model.addAttribute("event", event);
	    model.addAttribute("seat_count", seat_count);
	    model.addAttribute("seats",seats);
	}
	
}
