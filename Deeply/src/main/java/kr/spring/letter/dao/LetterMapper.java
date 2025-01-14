package kr.spring.letter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.letter.vo.LetterVO;

@Mapper
public interface LetterMapper {
	
	public List<LetterVO> selectLetterByUser(Map<String,Object> map);
	public int countLetterByUser(Map<String,Object> map);
	public void postLetter(LetterVO letterVO);
	@Select("SELECT * FROM letter WHERE letter_num=#{letter_num}")
	public LetterVO showLetterDetail(long letter_num);
}
