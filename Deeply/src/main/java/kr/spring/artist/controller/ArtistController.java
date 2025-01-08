package kr.spring.artist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.member.service.ArtistService;
import kr.spring.member.vo.AgroupVO;
import kr.spring.member.vo.ArtistVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/artist")
public class ArtistController {
	
	@Autowired
	ArtistService artistService;
	
	//아티스트 목록
	@GetMapping("/list")
	public String getList(Model model) {
		
		List<AgroupVO> groups = artistService.selectArtistByGroup();
		
		model.addAttribute("groups", groups);
		
		return "artistList";
	}
	//아티스트 목록
	@GetMapping("/detail")
	public String getDetail(long artist_num, Model model) {
		AgroupVO vo = artistService.selectArtistDetail(artist_num);
		List<ArtistVO> members = artistService.selectGroupMembers(artist_num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("members", members);
		
		return "artistDetail";
	}
	
}
