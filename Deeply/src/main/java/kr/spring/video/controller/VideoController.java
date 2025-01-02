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
import org.springframework.web.multipart.MultipartFile;

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

    @PostMapping("/videos/upload")
    public String uploadVideo(VideoVO video, @RequestParam("media") MultipartFile media,
                              @RequestParam(value = "isExclusive", defaultValue = "0") int isExclusive) {
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

        video.setIsExclusive(isExclusive);

        if (!media.isEmpty()) {
            video.setMediaUrl("/uploads/" + media.getOriginalFilename());
        }

        videoService.insertVideo(video);

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
}
