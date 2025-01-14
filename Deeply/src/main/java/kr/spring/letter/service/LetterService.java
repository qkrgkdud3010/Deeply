package kr.spring.letter.service;

import java.util.List;
import java.util.Map;

import kr.spring.letter.vo.LetterVO;
import kr.spring.letter.vo.ReplyVO;

public interface LetterService {
	public List<LetterVO> selectLetterByUser(Map<String,Object> map);
	public int countLetterByUser(Map<String,Object> map);
	public void postLetter(LetterVO letterVO);
	public LetterVO showLetterDetail(long letter_num);
	//reply
	public int countReply(Map<String,Object> map);
	public List<ReplyVO> showReplyForUser(Map<String,Object> map);
	//아티스트
	public int countLetterForArtist(Map<String,Object> map);
	public List<LetterVO> selectLetterForArtist(Map<String, Object> map);
}
