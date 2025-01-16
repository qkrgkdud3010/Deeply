package kr.spring.videocomment.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.spring.videocomment.vo.VideoCommentVO;

@Mapper
public interface VideoCommentMapper {
	
	@Insert("INSERT INTO video_comments (comment_id, video_id, user_num, comment_content, parent_comment_id, likes, dislikes) " +
            "VALUES (video_comments_seq.NEXTVAL, #{videoId}, #{userNum}, #{commentContent}, #{parentCommentId}, #{likes}, #{dislikes})")
    void insertComment(VideoCommentVO commentVO);
	
}
