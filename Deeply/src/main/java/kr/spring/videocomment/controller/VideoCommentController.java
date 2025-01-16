package kr.spring.videocomment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.spring.member.vo.PrincipalDetails;
import kr.spring.videocomment.service.VideoCommentService;
import kr.spring.videocomment.vo.VideoCommentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/videos")
public class VideoCommentController {
    
    @Autowired
    private VideoCommentService videoCommentService;

    /*===================
     * 댓글 작성
     *===================*/	
    @PostMapping("/writeReply")
    @ResponseBody
    public Map<String, String> writeReply(
            VideoCommentVO videoCommentVO,
            @AuthenticationPrincipal PrincipalDetails principal,
            HttpServletRequest request) {
        
        log.debug("<<댓글 작성>> : " + videoCommentVO);
        
        Map<String, String> mapJson = new HashMap<String, String>();
        
        try {
			//회원번호 저장
			videoCommentVO.setUserNum(principal.getArtistVO().getUser_num());
			//댓글 등록
			videoCommentService.insertComment(videoCommentVO);
			mapJson.put("result", "success");
		}catch(NullPointerException e) {
			mapJson.put("result", "logout");
		}		
		return mapJson;
    }
}
