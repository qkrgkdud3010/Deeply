package kr.spring.letter.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.letter.dao.LetterMapper;
import kr.spring.letter.vo.LetterVO;
import kr.spring.letter.vo.ReplyVO;

@Service
@Transactional
public class LetterServiceImpl implements LetterService{

	@Autowired
	LetterMapper letterMapper;
	
	@Override
	public List<LetterVO> selectLetterByUser(Map<String, Object> map) {
		return letterMapper.selectLetterByUser(map);
		
	}

	@Override
	public int countLetterByUser(Map<String, Object> map) {
		return letterMapper.countLetterByUser(map);
	}

	@Override
	public void postLetter(LetterVO letterVO) {
		letterMapper.postLetter(letterVO);
	}

	@Override
	public LetterVO showLetterDetail(long letter_num) {
		return letterMapper.showLetterDetail(letter_num);
	}

	@Override
	public int countReply(Map<String, Object> map) {
		return letterMapper.countReply(map);
	}

	@Override
	public List<ReplyVO> showReplyForUser(Map<String, Object> map) {
		return letterMapper.showReplyForUser(map);
	}

	@Override
	public int countLetterForArtist(Map<String, Object> map) {
		return letterMapper.countLetterForArtist(map);
	}

	@Override
	public List<LetterVO> selectLetterForArtist(Map<String, Object> map) {
		return letterMapper.selectLetterForArtist(map);
	}

	@Override
	public int countReplyForArtist(long artist_num) {
		return letterMapper.countReplyForArtist(artist_num);
	}

	@Override
	public List<ReplyVO> showReplyForArtist(Map<String, Object> map) {
		return letterMapper.showReplyForArtist(map);
	}

}
