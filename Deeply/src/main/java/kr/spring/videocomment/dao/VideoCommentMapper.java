package kr.spring.videocomment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.videocomment.vo.VideoCommentVO;

@Mapper
public interface VideoCommentMapper {
	
	@Insert("INSERT INTO video_comments (comment_id, video_id, user_num, comment_content, parent_comment_id, likes, dislikes) " +
            "VALUES (video_comments_seq.NEXTVAL, #{videoId}, #{userNum}, #{commentContent}, #{parentCommentId}, #{likes}, #{dislikes})")
    void insertComment(VideoCommentVO commentVO);
	
	// 2) 특정 videoId의 댓글 목록 조회
    @Select("SELECT "
          + "  comment_id AS commentId, "
          + "  user_num AS userNum, "
          + "  video_id AS videoId, "
          + "  parent_comment_id AS parentCommentId, "
          + "  comment_content AS commentContent, "
          + "  likes, "
          + "  dislikes, "
          + "  created_at AS createdAt "
          + "FROM video_comments "
          + "WHERE video_id = #{videoId} "
          + "ORDER BY comment_id DESC")
    List<VideoCommentVO> selectCommentsByVideoId(Long videoId);
	
}
