package kr.spring.commu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.commu.dao.CommuMapper;
import kr.spring.commu.vo.CommuReplyVO;
import kr.spring.commu.vo.CommuVO;

@Service
@Transactional
public class CommuServiceImpl implements CommuService{
	@Autowired
	CommuMapper commuMapper;

	@Override
	public List<CommuVO> selectList(Map<String, Object> map) {
		return commuMapper.selectList(map);
	}

	@Override
	public Integer selectRowCount(Map<String, Object> map) {
		return commuMapper.selectRowCount(map);
	}

	@Override
	public void insertCommu(CommuVO commu) {
		commuMapper.insertCommu(commu);
	}
	@Override
	public void insertFanCommu(CommuVO commu) {
		commuMapper.insertFanCommu(commu);
	}

	@Override
	public CommuVO selectCommu(Long c_num) {
		return commuMapper.selectCommu(c_num);
	}

	@Override
	public void updateHit(Long c_num) {
		commuMapper.updateHit(c_num);
	}

	@Override
	public void updateCommu(CommuVO commu) {
		commuMapper.updateCommu(commu);
	}

	@Override
	public void deleteCommu(Long c_num) {
		//글 삭제
		commuMapper.deleteCommu(c_num);
	}

	@Override
	public void deleteFile(Long c_num) {
		commuMapper.deleteFile(c_num);
	}

	@Override
	public List<CommuReplyVO> selectListReply(Map<String, Object> map) {
		return commuMapper.selectListReply(map);
	}

	@Override
	public Integer selectRowCountReply(Map<String, Object> map) {
		return commuMapper.selectRowCountReply(map);
	}

	@Override
	public void insertReply(CommuReplyVO commuReply) {
		commuMapper.insertReply(commuReply);
	}

	@Override
	public CommuReplyVO selectReply(Long cre_num) {
		return commuMapper.selectReply(cre_num);
	}

	@Override
	public void updateReply(CommuReplyVO commuReply) {
		commuMapper.updateReply(commuReply);
	}

	@Override
	public void deleteReply(Long cre_num) {
		commuMapper.deleteReply(cre_num);
	}

	@Override
	public void deleteReplyByCNum(Long c_num) {
		commuMapper.deleteReplyByCNum(c_num);
	}

	@Override
	public List<CommuVO> selectMyList(Map<String,Object> map) {
		return commuMapper.selectMyList(map);
	}

	@Override
	public Integer selectMyRowCount(Map<String,Object> map) {
		return commuMapper.selectMyRowCount(map);
	}

	@Override
	public List<CommuVO> selectFreeList(Map<String, Object> map) {
		return commuMapper.selectFreeList(map);
	}

	@Override
	public Integer selectFreeRowCount(Map<String, Object> map) {
		return commuMapper.selectFreeRowCount(map);
	}

	@Override
	public List<CommuVO> selectFandomList(Map<String, Object> map) {
		return commuMapper.selectFandomList(map);
	}

	@Override
	public Integer selectFandomRowCount(Map<String, Object> map) {
		return commuMapper.selectFandomRowCount(map);
	}
	
	
	/*

	@Override
	public void updateBoard(CommuVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(Long board_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(Long board_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CommuReplyVO> selectListReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer selectRowCountReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReply(CommuReplyVO boardReply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CommuReplyVO selectReply(Long re_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReply(CommuReplyVO boardReply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply(Long re_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReplyByBoardNum(Long board_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CommuReplyVO> selectListResponse(Long re_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer selectResponseCount(Long re_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommuReplyVO selectResponse(Long te_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertResponse(CommuReplyVO boardResponse) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateResponse(CommuReplyVO boardResponse) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer deleteResponse(Long te_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteResponseByReNum(Long re_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteResponseByBoardNum(Long board_num) {
		// TODO Auto-generated method stub
		
	}
	*/
}
