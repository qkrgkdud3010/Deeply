package kr.spring.commu.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import kr.spring.commu.vo.CommuReplyVO;
import kr.spring.commu.vo.CommuVO;

public interface CommuService {
	// ============== 글 ============== 
	//글 목록 보기
	public List<CommuVO> selectList(Map<String,Object> map);
	public Integer selectRowCount(Map<String,Object> map);
	//내 글 목록
	public List<CommuVO> selectMyList(Map<String,Object> map);
	public Integer selectMyRowCount(Map<String,Object> map);
	//글 조회수
	public void updateHit(Long c_num);
	//글 상세보기
	public CommuVO selectCommu(Long c_num);
	
	//전체글 작성
	public void insertCommu(CommuVO commu);
	//팬덤글 작성
	public void insertFanCommu(CommuVO commu);
	
	//글 수정
	public void updateCommu(CommuVO commu);
	//삭제
	public void deleteCommu(Long c_num);
	public void deleteFile(Long c_num);

	// ============== 댓글 ============== //
	//댓글 보기
	public List<CommuReplyVO> selectListReply(Map<String,Object> map);
	public Integer selectRowCountReply(Map<String,Object> map);
	//댓글 작성
	public void insertReply(CommuReplyVO commuReply);
	
	//댓글 수정,삭제시 작성자 회원번호를 구하기 위해 사용
	public CommuReplyVO selectReply(Long cre_num);
	public void updateReply(CommuReplyVO commuReply);
	public void deleteReply(Long cre_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	public void deleteReplyByCNum(Long c_num);
}
