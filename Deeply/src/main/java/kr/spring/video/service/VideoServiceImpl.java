package kr.spring.video.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.video.dao.VideoMapper;
import kr.spring.video.vo.VideoVO;

@Service
public class VideoServiceImpl implements VideoService {
    @Autowired
    private VideoMapper videoMapper;

    @Override
    public void saveVideo(VideoVO video) {
        video.setVideoId(getNextVideoId());
        videoMapper.insertVideo(video);
    }

    @Override
    public List<VideoVO> getAllVideos() {
        return videoMapper.getAllVideos();
    }

    private long getNextVideoId() {
        return videoMapper.getNextVideoId();
    }

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<VideoVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(long videoId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public VideoVO selectVideo(long videoId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteVideo(long videoId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertVideo(VideoVO videoVO) {
		// TODO Auto-generated method stub
		
	}
}