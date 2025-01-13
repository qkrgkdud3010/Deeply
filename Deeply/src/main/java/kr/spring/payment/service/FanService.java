package kr.spring.payment.service;

import java.util.List;
import java.util.Map;

import kr.spring.payment.vo.FanVO;

public interface FanService {
	public Long selectFan_num();

	//회원이 내가 팬맺은 아티스트 보기
	List<FanVO> getMyArtist(Map<String,Object> map);
	public Integer countMyArtist(long user_num);

	//현재 팬 상태인지 확인하기
	public FanVO selectFan(long user_num);
}
