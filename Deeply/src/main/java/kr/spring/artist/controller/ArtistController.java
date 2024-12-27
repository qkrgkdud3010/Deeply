package kr.spring.artist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/artist")
public class ArtistController {
	
	//아티스트 목록
	@GetMapping("/list")
	public String getList() {
		return "artistList";
	}
	
	//아티스트 목록
	@GetMapping("/detail")
	public String getDetail() {
		return "artistDetail";
	}
	
}
