package kr.spring.video.dao;

import java.util.List;
import kr.spring.video.vo.VideoVO;

public interface VideoMapper {
    public List<VideoVO> selectAllVideos(); // 모든 영상 조회
}
