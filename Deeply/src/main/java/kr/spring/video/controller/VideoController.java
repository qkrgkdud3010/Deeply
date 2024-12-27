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

    // 새로운 newjeans.jsp 매핑
    @GetMapping("/newjeans")
    public String showNewJeansPage() {
        return "video/newjeans"; // "WEB-INF/views/video/newjeans.jsp"를 호출
    }
}
