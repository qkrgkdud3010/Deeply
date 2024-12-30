package kr.spring.video.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.video.service.VideoService;
import kr.spring.video.vo.VideoVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/video") // 공통 URL 매핑: /video
public class VideoController {

    @Autowired
    private VideoService videoService;

    /**
     * 자바빈 초기화 메서드
     * - 모든 요청 전에 실행되며, VideoVO 객체를 생성해 뷰에 전달합니다.
     */
    @ModelAttribute
    public VideoVO initCommand() {
        return new VideoVO();
    }

    /**
     * 업로드 폼 페이지 반환
     * - 사용자가 동영상을 업로드할 수 있는 폼을 반환합니다.
     * - JSP 파일: /WEB-INF/views/video/video_upload.jsp
     */
    @GetMapping("/upload")
    public String form() {
        return "video/video_upload"; // JSP 경로
    }

    /**
     * 업로드 처리 메서드
     * - 사용자가 업로드한 동영상과 데이터를 처리하여 저장합니다.
     * - 업로드된 파일은 지정된 디렉토리에 저장됩니다.
     */
    @PostMapping("/upload")
    public String submit(VideoVO videoVO, 
                         HttpServletRequest request, 
                         RedirectAttributes redirect) 
                         throws IOException {
        log.debug("<<영상 업로드>> : " + videoVO);

        // 파일 업로드 처리
        if (videoVO.getMedia() != null && !videoVO.getMedia().isEmpty()) {
            String uploadPath = "/assets/upload/videos"; // 업로드 경로
            String realPath = request.getServletContext().getRealPath(uploadPath); // 실제 서버 경로
            File uploadDir = new File(realPath);
            
            // 디렉토리가 존재하지 않으면 생성
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // 파일 이름 생성 (타임스탬프 + 원본 파일명)
            String fileName = System.currentTimeMillis() + "_" + videoVO.getMedia().getOriginalFilename();
            File file = new File(realPath, fileName);
            videoVO.getMedia().transferTo(file); // 파일 저장
            
            // 파일 경로를 VO에 저장
            videoVO.setMediaUrl(uploadPath + "/" + fileName);
        }

        // 데이터 저장 (DB)
        videoService.insertVideo(videoVO);

        // 업로드 성공 메시지 전달
        redirect.addFlashAttribute("result", "success");

        // 업로드 완료 후 목록 페이지로 리다이렉트
        return "redirect:/video/video_list";
    }

    /**
     * 영상 목록 페이지 반환
     * - DB에서 저장된 영상 데이터를 조회하여 목록 형태로 반환합니다.
     */
    @GetMapping("/list")
    public String getList(
            @RequestParam(defaultValue = "1") int pageNum, // 기본 페이지 번호: 1
            @RequestParam(defaultValue = "1") int order, // 정렬 방식: 1(기본)
            String keyfield, String keyword, Model model) {

        log.debug("<<영상 목록>>");

        // 검색 조건 및 페이징 처리를 위한 파라미터 맵
        Map<String, Object> map = new HashMap<>();
        map.put("keyfield", keyfield);
        map.put("keyword", keyword);

        // 총 레코드 수 조회
        int count = videoService.selectRowCount(map);

        // 페이징 유틸리티 객체 생성
        PagingUtil page = new PagingUtil(keyfield, keyword, pageNum, count, 20, 10, "list", "&order=" + order);

        // 데이터 리스트 조회
        List<VideoVO> list = null;
        if (count > 0) {
            map.put("order", order);
            map.put("start", page.getStartRow());
            map.put("end", page.getEndRow());

            list = videoService.selectList(map);
        }

        // 모델에 데이터 추가
        model.addAttribute("count", count);
        model.addAttribute("list", list);
        model.addAttribute("page", page.getPage());

        return "video/video_list"; // JSP 경로
    }

    /**
     * 영상 상세 보기
     * - 선택된 영상의 상세 정보를 반환합니다.
     * - 조회수를 증가시킵니다.
     */
    @GetMapping("/detail")
    public String detail(long videoId, Model model) {
        log.debug("<<영상 상세 보기>> : " + videoId);

        // 조회수 증가
        videoService.updateHit(videoId);

        // 영상 데이터 조회
        VideoVO video = videoService.selectVideo(videoId);

        // 모델에 데이터 추가
        model.addAttribute("video", video);

        return "video/video_detail"; // JSP 경로
    }

    /**
     * 영상 삭제
     * - 선택된 영상을 DB와 서버 파일 시스템에서 삭제합니다.
     */
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/delete")
    public String delete(long videoId, HttpServletRequest request, RedirectAttributes redirect) {
        log.debug("<<영상 삭제>> : " + videoId);

        // 영상 데이터 조회
        VideoVO video = videoService.selectVideo(videoId);

        // DB에서 영상 삭제
        videoService.deleteVideo(videoId);

        // 서버에 저장된 파일 삭제
        if (video.getMediaUrl() != null) {
            FileUtil.removeFile(request, video.getMediaUrl());
        }

        // 삭제 성공 메시지 전달
        redirect.addFlashAttribute("result", "deleted");

        return "redirect:/video/video_list";
    }
}
