package kr.spring.commu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.commu.vo.CommuReplyVO;
import kr.spring.commu.vo.CommuVO;

@Mapper
public interface CommuMapper {
	// ============== 글 ============== 
	//글 목록 보기
	public List<CommuVO> selectList(Map<String,Object> map);
	public Integer selectRowCount(Map<String,Object> map);
	//내 글 목록
	public List<CommuVO> selectMyList(Map<String,Object> map);
	public Integer selectMyRowCount(Map<String,Object> map);
	//글 조회수
	@Update("UPDATE community SET c_hit=c_hit+1 WHERE c_num=#{c_num}")
	public void updateHit(Long c_num);
	//글 상세 보기
	@Select("SELECT * FROM community JOIN duser USING(user_num) LEFT OUTER JOIN duser_detail USING(user_num) WHERE c_num=#{c_num}")
	public CommuVO selectCommu(Long c_num);
	
	//전체글 작성
	public void insertCommu(CommuVO commu);
	//팬덤글 작성
	public void insertFanCommu(CommuVO commu);
	
	//글 수정
	public void updateCommu(CommuVO commu);
	//삭제
	@Delete("DELETE FROM community WHERE c_num=#{c_num}")
	public void deleteCommu(Long c_num); //글삭제
	@Update("UPDATE community SET c_file='' WHERE cd_num=#{c_num}")
	public void deleteFile(Long c_num); //파일삭제
	
	// ============== 댓글 ============== //
	//댓글 보기
	public List<CommuReplyVO> selectListReply(Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM community_reply WHERE c_num=#{c_num}")
	public Integer selectRowCountReply(Map<String,Object> map);
	//댓글 작성
	public void insertReply(CommuReplyVO commuReply);
	
	//댓글 수정,삭제시 작성자 회원번호를 구하기 위해 사용
	@Select("SELECT * FROM community_reply WHERE cre_num=#{cre_num}")
	public CommuReplyVO selectReply(Long cre_num);
	@Update("UPDATE community_reply SET cre_content=#{cre_content},cre_update=SYSDATE WHERE cre_num=#{cre_num}")
	public void updateReply(CommuReplyVO commuReply);
	@Delete("DELETE FROM community_reply WHERE cre_num=#{cre_num}")
	public void deleteReply(Long cre_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	@Delete("DELETE FROM community_reply WHERE c_num=#{c_num}")
	public void deleteReplyByCNum(Long c_num);
}
