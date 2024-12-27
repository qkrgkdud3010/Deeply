package kr.spring.video.service;

import java.util.List;
import kr.spring.video.vo.VideoVO;

public interface VideoService {
    /**
     * 모든 영상을 조회합니다.
     * @return 영상 리스트
     */
    public List<VideoVO> getAllVideos();
}
