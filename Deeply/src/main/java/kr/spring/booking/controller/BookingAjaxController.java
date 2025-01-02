package kr.spring.booking.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.booking.service.BookingService;
import kr.spring.event.vo.EventVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/booking")
public class BookingAjaxController {
	
	@Autowired
	BookingService bookingService;
	
	@GetMapping("/detail")
	@ResponseBody
	public Map<String,Object> getDetail(@RequestParam("perf_num") long perf_num){
		
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		mapAjax.put("result", "success");
		EventVO event = bookingService.showEventDetail(perf_num);
		
		mapAjax.put("event", event);
		
		log.debug("<<event 제목>> : " + event.getPerf_title());
		
		return mapAjax;
	}
}
