package kr.spring.letter.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.letter.dao.LetterMapper;
import kr.spring.letter.vo.LetterVO;

@Service
@Transactional
public class LetterServiceImpl implements LetterService{

	@Autowired
	LetterMapper letterMapper;
	
	@Override
	public void selectLetterByUser(Map<String, Object> map) {
		letterMapper.selectLetterByUser(map);
		
	}

	@Override
	public int countLetterByUser(Map<String, Object> map) {
		return letterMapper.countLetterByUser(map);
	}

	@Override
	public void postLetter(LetterVO letterVO) {
		letterMapper.postLetter(letterVO);
	}

}
