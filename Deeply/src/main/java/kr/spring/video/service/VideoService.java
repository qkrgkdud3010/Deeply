package kr.spring.video.service;

import java.util.List;
import java.util.Map;

import kr.spring.video.vo.VideoVO;

public interface VideoService {
    /**
     * 모든 영상을 조회합니다.
     * @return 영상 리스트
     */
	void saveVideo(VideoVO video);
    List<VideoVO> getAllVideos();
	int selectRowCount(Map<String, Object> map);
	List<VideoVO> selectList(Map<String, Object> map);
	void updateHit(long videoId);
	VideoVO selectVideo(long videoId);
	void deleteVideo(long videoId);
	void insertVideo(VideoVO videoVO);
}
