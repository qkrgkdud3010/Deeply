package kr.spring.videocomment.service;

import kr.spring.videocomment.vo.VideoCommentVO;

public interface VideoCommentService {
    void insertComment(VideoCommentVO videoCommentVO);
}
