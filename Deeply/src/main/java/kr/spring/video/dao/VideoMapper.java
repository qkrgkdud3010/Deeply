package kr.spring.video.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.video.vo.VideoVO;

@Mapper
public interface VideoMapper {
    public List<VideoVO> selectAllVideos(); // 모든 영상 조회
}
