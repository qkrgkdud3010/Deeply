package kr.spring.booking.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/booking")
public class BookingController {
	//아티스트 예매 목록
	@GetMapping("/list")
	public String getList(HttpServletRequest request, Model model) {
		long artist_num = (long)request.getAttribute("artist_num");
		Map<String,Object> map =  new HashMap<String,Object>();
		
		
		
		return "bookingList";
	}
}
