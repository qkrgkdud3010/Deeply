package kr.spring.video.controller;

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
public class VideoController {

    @Autowired
    private VideoService videoService;

    @GetMapping("/videos")
    public String listVideos(@RequestParam(value = "page", defaultValue = "1") int page,
                             Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("page", page);

        List<VideoVO> videos = videoService.selectList(map);
        Integer totalCount = videoService.selectRowCount(map);

        model.addAttribute("videos", videos);
        model.addAttribute("totalCount", totalCount);

        return "videoList"; // Tiles 정의 이름
    }

    @GetMapping("/videos/upload")
    public String showUploadPage() {
        return "videoUpload"; // Tiles 정의 이름
    }

    // ===========================
    // 파일 대신 "링크"만 입력 받는 메서드
    // ===========================
    @PostMapping("/videos/upload")
    public String uploadVideo(
            VideoVO video,
            @RequestParam(value="mediaUrl", required=false) String mediaUrl,
            @RequestParam(value="isExclusive", defaultValue="0") int isExclusive
    ) {
        // 기본값 세팅
        if (video.getArtistId() == null) {
            video.setArtistId(1L);
        }
        if (video.getCategoryId() == null) {
            video.setCategoryId(1L);
        }
        if (video.getIsExclusive() == null) {
            video.setIsExclusive(0);
        }
        if (video.getTitle() == null || video.getTitle().isEmpty()) {
            video.setTitle("Default Title");
        }
        if (video.getDescription() == null || video.getDescription().isEmpty()) {
            video.setDescription("Default description");
        }

        // 멤버십 여부
        video.setIsExclusive(isExclusive);

        // (변경) mediaUrl만 세팅
        if (mediaUrl != null && !mediaUrl.trim().isEmpty()) {
            video.setMediaUrl(mediaUrl.trim());
        } else {
            video.setMediaUrl("");
        }

        // DB 저장
        videoService.insertVideo(video);

        // 목록으로 이동
        return "redirect:/videos";
    }

    @GetMapping("/videos/view")
    public String viewVideo(@RequestParam("id") Long videoId, Model model) {
        videoService.updateHit(videoId);
        VideoVO video = videoService.selectVideo(videoId);
        model.addAttribute("video", video);
        return "videoDetail"; // Tiles 정의 이름
    }

    @GetMapping("/videos/edit")
    public String editVideo(@RequestParam("id") Long videoId, Model model) {
        VideoVO video = videoService.selectVideo(videoId);
        model.addAttribute("video", video);
        return "videoEdit"; // Tiles 정의가 있다면 해당 이름 사용
    }

    @PostMapping("/videos/edit")
    public String updateVideo(VideoVO video) {
        videoService.updateVideo(video);
        return "redirect:/videos/view?id=" + video.getVideoId();
    }

    @GetMapping("/videos/delete")
    public String deleteVideo(@RequestParam("id") Long videoId) {
        videoService.deleteVideo(videoId);
        return "redirect:/videos";
    }

    @GetMapping("/videos/newjeans")
    public String showNewJeansPage(
        @RequestParam(value="page", defaultValue="1") int page,
        Model model
    ) {
        Map<String,Object> map = new HashMap<>();
        map.put("page", page);

        List<VideoVO> videos = videoService.selectList(map);
        model.addAttribute("videos", videos);

        Integer totalCount = videoService.selectRowCount(map);
        model.addAttribute("totalCount", totalCount);

        return "newjeans"; // newjeans.jsp
    }
}
