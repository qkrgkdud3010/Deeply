package kr.spring.video.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.spring.video.service.VideoService;
import kr.spring.video.vo.VideoVO;

@Controller
public class VideoController {
    @Autowired
    private VideoService videoService;

    @GetMapping("/videos")
    public String listVideos(Model model) {
        // 서비스 호출
        List<VideoVO> videos = videoService.getAllVideos();

        // 뷰로 데이터 전달
        model.addAttribute("videos", videos);
        return "video/list"; // JSP 파일 이름
    }
}
