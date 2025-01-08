package kr.spring.letter.service;

import java.util.Map;

import kr.spring.letter.vo.LetterVO;

public interface LetterService {
	public void selectLetterByUser(Map<String,Object> map);
	public int countLetterByUser(Map<String,Object> map);
	public void postLetter(LetterVO letterVO);
}
