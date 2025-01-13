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
import kr.spring.util.FileUtil;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
	public String getList(long artist_num, @RequestParam(defaultValue="1") int pageNum,
										   @RequestParam(defaultValue="before") String status, 
										   @RequestParam(required=false) String dateRange, HttpServletRequest request, Model model) {
		
		
		
		log.debug("<<예매 페이지 아티스트 번호>> : " + artist_num);
		log.debug("<<예매 페이지 번호>> : " + pageNum);
		Map<String,Object> map = new HashMap<String,Object>();
		
		LocalDate today = LocalDate.now();
	    LocalDate hundredDaysLater = today.plusDays(100);
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	    String startDate = today.format(formatter);
	    String endDate = hundredDaysLater.format(formatter);
		
		if(dateRange !=  null) {
			String[] dates = dateRange.split(" ~ ");
			startDate = dates[0];
			endDate = dates[1];
		}
		
		
		log.debug("dateRange: " + dateRange);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("user_num", artist_num);
		if(status != null) {
			map.put("status", status);
		}
		
		
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
	    
	    if(principal.getArtistVO() != null) {
	    	AgroupVO av = principal.getAgroupVO();
	    	log.debug("------------------------------------------------" + av);
	    }
	    
	    loadBookingContents(perf_num, model);
	    
	    model.addAttribute("perf_num", perf_num);
	    model.addAttribute("member", member);
	    
	    
	    return "bookingForm";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/book")
	public String bookForm(@ModelAttribute @Valid BookingVO bookingVO,BindingResult result,Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
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
	
	@GetMapping("/register")
	public String registerForm(EventVO eventVO, @RequestParam long group_num, Model model, HttpServletRequest request) {
		
		if(eventVO == null) {
			eventVO = new EventVO();
		}
		
		AgroupVO group = artistService.selectArtistDetail(group_num);
		log.debug("Agroup: " + group);
		model.addAttribute("group", group);
		return "bookingRegister";
	}
	
	@PostMapping("/register")
	public String registerEvent(@ModelAttribute @Valid EventVO eventVO, BindingResult result, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
			
		long group_num = eventVO.getArtist_num();
		AgroupVO group = artistService.selectArtistDetail(group_num);
		model.addAttribute("group", group);
		log.debug("Agroup2: " + group);
		if(result.hasErrors()) {
		    model.addAttribute("errors", result.getAllErrors());
		    model.addAttribute("eventVO", eventVO);
		    return "bookingRegister"; // 유효성 검증 실패 시 JSP로 이동
		}
		
		String uploadedPhoto = FileUtil.createFile(request, eventVO.getUpload());
		eventVO.setPerf_photo(uploadedPhoto);
		
		long hall_num = eventVO.getHall_num();
		String hall_name = null;
		if(hall_num == 1) {
			hall_name = "테스트 홀";
		}
		if(hall_num == 2) {
			hall_name = "서울 체육관";
		}
		if(hall_num == 3) {
			hall_name = "수도권 경기장";
		}
		if(hall_num == 4) {
			hall_name = "월드컵 돔";
		}
		
		eventVO.setHall_name(hall_name);
		
		bookingService.registerEvent(eventVO);
		
		model.addAttribute("message", "공연 등록을 성공하였습니다");
		model.addAttribute("url",request.getContextPath() + "/booking/list?artist_num="+group_num);
		    
		return "common/resultAlert";
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
