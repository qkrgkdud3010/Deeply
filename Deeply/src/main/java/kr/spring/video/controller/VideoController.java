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

    // 기존 list.jsp 매핑
    @GetMapping("/videos")
    public String listVideos(Model model) {
        List<VideoVO> videos = videoService.getAllVideos();
        model.addAttribute("videos", videos);
        return "video/list";
    }

    @GetMapping("/newjeans")
    public String showNewJeansPage() {
        return "newjeans"; // hy.xml의 definition name과 일치해야 합니다.
    }
    
    @GetMapping("/videos/upload")
    public String showVideoUploadPage() {
        return "video_upload"; // Tiles 설정에 따라 "video_upload" 호출
    }
}
