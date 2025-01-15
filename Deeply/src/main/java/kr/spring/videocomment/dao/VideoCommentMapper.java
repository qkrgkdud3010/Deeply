package kr.spring.videocomment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.spring.videocomment.vo.VideoCommentVO;

@Mapper
public interface VideoCommentMapper {
    // 댓글 추가
    void insertComment(VideoCommentVO comment);
    
    // 특정 비디오의 댓글 목록 조회
    List<VideoCommentVO> getCommentsByVideoId(@Param("videoId") Long videoId);
}
