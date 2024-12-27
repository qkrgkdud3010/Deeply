package kr.spring.video.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.video.dao.VideoMapper;
import kr.spring.video.vo.VideoVO;

@Service
public class VideoServiceImpl implements VideoService {
    @Autowired
    private VideoMapper videoMapper; // DAO 의존성 주입

    @Override
    public List<VideoVO> getAllVideos() {
        // DAO의 selectAllVideos 호출
        return videoMapper.selectAllVideos();
    }
}
