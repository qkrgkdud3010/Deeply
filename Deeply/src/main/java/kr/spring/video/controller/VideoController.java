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

        return "video/video_list";
    }

    @GetMapping("/videos/upload")
    public String showUploadPage() {
        return "video/video_upload";
    }

    @PostMapping("/videos/upload")
    public String uploadVideo(VideoVO video, @RequestParam("media") MultipartFile media,
                              @RequestParam(value = "isExclusive", defaultValue = "0") int isExclusive) {
    	
    	// 테스트용 기본 데이터 설정
        if (video.getArtistId() == null) {
            video.setArtistId(1L); // 기본 ARTIST_ID 값
        }
        if (video.getCategoryId() == null) {
            video.setCategoryId(1L); // 기본 CATEGORY_ID 값
        }
        if (video.getIsExclusive() == null) {
            video.setIsExclusive(0); // 기본 IS_EXCLUSIVE 값
        }

        // 나머지 필수 값도 기본값 설정 (테스트용)
        if (video.getTitle() == null || video.getTitle().isEmpty()) {
            video.setTitle("Default Title"); // 기본 제목
        }
        if (video.getDescription() == null || video.getDescription().isEmpty()) {
            video.setDescription("Default description"); // 기본 설명
        }
    	
        // 멤버십 여부 설정
        video.setIsExclusive(isExclusive);

        // 파일 경로 설정
        if (!media.isEmpty()) {
            video.setMediaUrl("/uploads/" + media.getOriginalFilename());
        }

        // 비디오 데이터 삽입
        videoService.insertVideo(video);

        return "redirect:/videos";
    }


    @GetMapping("/videos/view")
    public String viewVideo(@RequestParam("id") Long videoId, Model model) {
        videoService.updateHit(videoId);
        VideoVO video = videoService.selectVideo(videoId);
        model.addAttribute("video", video);
        return "video/video_view";
    }

    @GetMapping("/videos/edit")
    public String editVideo(@RequestParam("id") Long videoId, Model model) {
        VideoVO video = videoService.selectVideo(videoId);
        model.addAttribute("video", video);
        return "video/video_edit";
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
