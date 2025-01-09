package kr.spring.video.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.video.service.VideoService;
import kr.spring.video.vo.VideoVO;
import kr.spring.member.vo.PrincipalDetails;

@Controller
public class VideoController {

    @Autowired
    private VideoService videoService;

    // 영상 목록 조회
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

    // 영상 업로드 페이지 (로그인 필요)
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/videos/upload")
    public String showUploadPage() {
        return "videoUpload"; // Tiles 정의 이름
    }

    // 영상 업로드 처리 (로그인 필요)
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/videos/upload")
    public String uploadVideo(
            VideoVO video,
            @RequestParam(value = "mediaUrl", required = false) String mediaUrl,
            @RequestParam(value = "isExclusive", defaultValue = "0") int isExclusive,
            @AuthenticationPrincipal PrincipalDetails principal) {

        // 로그인 사용자 정보 설정
        video.setArtistId(principal.getArtistVO().getUser_num());

        // 멤버십 여부
        video.setIsExclusive(isExclusive);

        // mediaUrl 설정
        if (mediaUrl != null && !mediaUrl.trim().isEmpty()) {
            video.setMediaUrl(mediaUrl.trim());
        } else {
            video.setMediaUrl("");
        }

        // DB 저장
        videoService.insertVideo(video);

        return "redirect:/videos";
    }

    @GetMapping("/videos/newjeans")
    public String showNewJeansPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                   Model model) {
        Map<String, Object> map = new HashMap<>();
        map.put("page", page);

        List<VideoVO> videos = videoService.selectList(map);
        model.addAttribute("videos", videos);

        Integer totalCount = videoService.selectRowCount(map);
        model.addAttribute("totalCount", totalCount);

        return "newjeans"; // newjeans.jsp
    }
}
