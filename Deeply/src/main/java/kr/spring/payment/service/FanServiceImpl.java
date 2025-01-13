package kr.spring.payment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.payment.dao.FanMapper;
import kr.spring.payment.vo.FanVO;

@Service
@Transactional
public class FanServiceImpl implements FanService{
	
	@Autowired
	private FanMapper fanMapper;
	
	//회원이 내가 팬 맺은 아티스트 보기
	@Override
	public List<FanVO> getMyArtist(Map<String, Object> map) {
		return fanMapper.getMyArtist(map);
	}
  
	@Override
	public Integer countMyArtist(long user_num) {
		return fanMapper.countMyArtist(user_num);
	}

	@Override
	public Long selectFan_num() {
		return fanMapper.selectFan_num();
	}

	@Override
	public FanVO selectFan(long user_num) {
		return fanMapper.selectFan(user_num);
	}




}
