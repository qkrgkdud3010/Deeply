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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.spring.video.service.VideoCategoryService;
import kr.spring.video.service.VideoService;
import kr.spring.video.vo.VideoCategoryVO;
import kr.spring.video.vo.VideoVO;
import kr.spring.member.dao.ArtistMapper;
import kr.spring.member.vo.AgroupVO;
import kr.spring.member.vo.ArtistVO;
import kr.spring.member.vo.PrincipalDetails;

@Controller
public class VideoController {

	private static final Logger logger = LoggerFactory.getLogger(VideoController.class);
	
    @Autowired
    private VideoService videoService;
    
    @Autowired
    private VideoCategoryService videoCategoryService;

    @Autowired
    private ArtistMapper artistMapper;

    // 영상 목록 조회
    @GetMapping("/videos")
    public String listVideos(@RequestParam(value = "page", defaultValue = "1") int page,
                             Model model) {
        System.out.println("==> listVideos called with page: " + page);

        Map<String, Object> map = new HashMap<>();
        map.put("page", page);

        List<VideoVO> videos = videoService.selectList(map);
        Integer totalCount = videoService.selectRowCount(map);

        System.out.println("Total videos fetched: " + (videos != null ? videos.size() : 0));
        videos.forEach(video -> System.out.println("Video: " + video));

        model.addAttribute("videos", videos);
        model.addAttribute("totalCount", totalCount);

        return "videoList"; // Tiles 정의 이름
    }

    // 영상 업로드 페이지 (로그인 필요)
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/videos/upload")
    public String showUploadPage() {
        System.out.println("==> showUploadPage called");
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

        System.out.println("==> uploadVideo called with mediaUrl: " + mediaUrl);

        // 1) 로그인 사용자 정보 가져오기
        ArtistVO artist = principal.getArtistVO();
        System.out.println("Logged-in artist: " + artist);

        // 2) group_name으로 agroup 정보(AgroupVO) 조회
        AgroupVO agroup = artistMapper.findByGroupName(artist.getGroup_name());
        if (agroup == null) {
            throw new IllegalArgumentException("해당 group_name이 agroup 테이블에 존재하지 않습니다.");
        }
        System.out.println("Agroup: " + agroup);

        // 3) video에 필요한 값 채우기
        video.setArtistId(artist.getUser_num());
        video.setGroupNum(agroup.getGroup_num());
        video.setIsExclusive(isExclusive);

        // mediaUrl 설정
        if (mediaUrl != null && !mediaUrl.trim().isEmpty()) {
            video.setMediaUrl(mediaUrl.trim());
        } else {
            video.setMediaUrl("");
        }
        System.out.println("Final video object before save: " + video);

        // 4) DB에 영상 정보 저장
        videoService.insertVideo(video);

        return "redirect:/videos";
    }

    // 그룹별 영상 페이지
    @GetMapping("artist/videos/group")
    public String showGroupVideosPage(
        @RequestParam("group_num") Long groupNum,
        @RequestParam(value = "page", defaultValue = "1") int page,
        Model model
    ) {
        System.out.println("==> showGroupVideosPage called with groupNum: " + groupNum + ", page: " + page);

        // 1. group_num으로 카테고리 조회
        List<VideoCategoryVO> categories = videoCategoryService.getCategoriesByGroupNum(groupNum);
        System.out.println("Categories fetched: " + (categories != null ? categories.size() : 0));
        categories.forEach(category -> System.out.println("Category: " + category));

        // 2. 카테고리별 영상 조회
        Map<Long, List<VideoVO>> categoryVideosMap = new HashMap<>();
        for (VideoCategoryVO category : categories) {
            List<VideoVO> videos = videoService.getVideosByCategoryAndGroup(category.getCategory_id(), groupNum);
            System.out.println("Category ID: " + category.getCategory_id() + " -> Videos count: " + videos.size());
            videos.forEach(video -> System.out.println("Video: " + video));

            categoryVideosMap.put(category.getCategory_id(), videos);
        }

        // 3. 카테고리, 영상 데이터, groupNum을 JSP로 전달
        model.addAttribute("categories", categories); // 카테고리 목록
        model.addAttribute("categoryVideosMap", categoryVideosMap); // 카테고리별 영상
        model.addAttribute("groupNum", groupNum); // 그룹 번호

        return "groupVideoList"; // JSP 파일 이름
    }
    
    @GetMapping("/videos/page")
    public String showVideoPage(
        @RequestParam("videoId") Long videoId,
        @RequestParam("group_num") Long groupNum,
        Model model
    ) {
        // 1. 영상 정보 조회
        VideoVO video = videoService.selectVideo(videoId);

        // 2. YouTube URL 변환
        String youtubeLink = video.getMediaUrl();
        
        youtubeLink = convertToEmbedUrl(youtubeLink);
        
        model.addAttribute("youtubeLink", youtubeLink);

        // 3. 데이터 모델에 추가
        model.addAttribute("video", video);       // 영상 정보
        model.addAttribute("title", video.getTitle()); 
        model.addAttribute("groupNum", groupNum); // 그룹 번호

        return "video_page"; // JSP 파일 이름
    }

    /**
     * 일반 YouTube URL을 embed URL로 변환
     * @param youtubeUrl 일반 YouTube URL (e.g., https://youtu.be/abc123, https://www.youtube.com/watch?v=abc123)
     * @return embed URL (e.g., https://www.youtube.com/embed/abc123)
     */
    private String convertToEmbedUrl(String youtubeUrl) {
        try {
            String videoLink = null;

            // 예: https://www.youtube.com/watch?v=abc123
            if (youtubeUrl.contains("v=")) {
                videoLink = youtubeUrl.split("v=")[1].split("&")[0];
            }
            // 예: https://youtu.be/abc123
            else if (youtubeUrl.contains("youtu.be/")) {
                videoLink = youtubeUrl.substring(youtubeUrl.lastIndexOf("/") + 1);
            }
            // 예: https://www.youtube.com/embed/abc123
            else if (youtubeUrl.contains("youtube.com/embed/")) {
                videoLink = youtubeUrl.substring(youtubeUrl.indexOf("embed/") + 6);
            }

            if (videoLink != null && !videoLink.isEmpty()) {
                // embed URL 생성
                return "https://www.youtube.com/embed/" + videoLink;
            } else {
                logger.warn("Unable to extract video ID from URL: {}", youtubeUrl);
                return youtubeUrl; // 원래 URL 반환
            }
        } catch (Exception e) {
            logger.error("Error converting YouTube URL to embed URL: {}", youtubeUrl, e);
            return youtubeUrl; // 변환 실패 시 원래 URL 반환
        }
    }

}
