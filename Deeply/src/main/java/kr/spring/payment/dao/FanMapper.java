package kr.spring.payment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.payment.vo.FanVO;

@Mapper
public interface FanMapper {
	@Select("SELECT fan_seq.nextval FROM dual")
	public Long selectFan_num();

	//회원이 내가 팬맺은 아티스트 보기
	List<FanVO> getMyArtist(Map<String,Object> map);
	@Select("SELECT COUNT(*) FROM fan WHERE user_num=#{user_num}")
	public Integer countMyArtist(long user_num);
	
	//현재 팬 정보 확인하기
	public FanVO selectFan(long user_num);
}
