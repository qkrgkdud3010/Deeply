package kr.spring.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.video.service.VideoService;
import kr.spring.video.vo.VideoVO;

@Controller
public class FaqController {
	@GetMapping("/faq")
	public String showFAQPage() {
		return "faq"; // Tiles 또는 View Resolver에 따라 경로를 설정
	}
}
